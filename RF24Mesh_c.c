/*
 Copyright (c) 2016 Luis Claudio Gamboa Lopes <lcgamboa@yahoo.com>
 Copyright (c) 2014 tmrh20@gmail.com, github.com/TMRh20 

 This program is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.

 This program is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.

 You should have received a copy of the GNU General Public License
 along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/



#include "RF24Mesh_c.h"
#include "RF24Mesh_c_config.h"
#if defined (__linux) && !defined(__ARDUINO_X86__)
//#include <fstream>
#endif

void RF24M_init(RF24Mesh* mesh,  RF24* _radio,RF24Network* _network )
{
  mesh->radio=_radio;
  mesh->network=_network;
}


/*****************************************************/

uint8_t RF24M_begin(RF24Mesh* mesh, uint8_t channel, rf24_datarate_e data_rate, uint32_t timeout){
  //delay(1); // Found problems w/SPIDEV & ncurses. Without this, getch() returns a stream of garbage
  RF24_begin(mesh->radio);
  mesh->radio_channel = channel;
  RF24_setChannel(mesh->radio,mesh->radio_channel);
  RF24_setDataRate(mesh->radio,data_rate);  
  mesh->network->returnSysMsgs = 1;
  
  if(RF24M_getNodeID(mesh,MESH_BLANK_ID)){ //Not master node
    mesh->mesh_address = MESH_DEFAULT_ADDRESS;
    if(!RF24M_renewAddress(mesh,timeout)){
      return 0;
    }
  }else{
    #if !defined (RF24_TINY) && !defined(MESH_NOMASTER)
	mesh->addrList = (addrListStruct*)malloc(2 * sizeof(addrListStruct));
	mesh->addrListTop = 0;
	RF24M_loadDHCP(mesh);
	#endif
    mesh->mesh_address = 0;
    RF24N_begin(mesh->network,mesh->mesh_address);
  }
  
  return 1;
}

/*****************************************************/

uint8_t RF24M_update(RF24Mesh* mesh){

    
    
	uint8_t type = RF24N_update(mesh->network);
    if(mesh->mesh_address == MESH_DEFAULT_ADDRESS){ return type; }
    
	#if !defined (RF24_TINY) && !defined(MESH_NOMASTER)
	if(type == NETWORK_REQ_ADDRESS){
	  mesh->doDHCP = 1;
	}

  if(!RF24M_getNodeID(mesh,MESH_BLANK_ID)){
	if( (type == MESH_ADDR_LOOKUP || type == MESH_ID_LOOKUP)) {
	  RF24NetworkHeader * header = (RF24NetworkHeader*)mesh->network->frame_buffer;
	  header->to_node = header->from_node;
	  
      if(type==MESH_ADDR_LOOKUP){
	    int16_t returnAddr = RF24M_getAddress(mesh,mesh->network->frame_buffer[sizeof(RF24NetworkHeader)]);
        RF24N_write_m(mesh->network,header,&returnAddr,sizeof(returnAddr)); 
      }else{
        int16_t returnAddr = RF24M_getNodeID(mesh,mesh->network->frame_buffer[sizeof(RF24NetworkHeader)]);
        RF24N_write_m(mesh->network,header,&returnAddr,sizeof(returnAddr));        
      }      
	  //printf("Returning lookup 0%o to 0%o   \n",returnAddr,header.to_node);
	  //RF24N_write(&network,header,&returnAddr,sizeof(returnAddr));	
	}else
	if(type == MESH_ADDR_RELEASE ){
                uint8_t i;
		uint16_t *fromAddr = (uint16_t*)mesh->network->frame_buffer;
		for(i=0; i< mesh->addrListTop; i++){
			if(mesh->addrList[i].address == *fromAddr){
				mesh->addrList[i].address = 0;
			}
		}		
	}
    #if !defined (ARDUINO_ARCH_AVR)
    else 
	if(type == MESH_ADDR_CONFIRM ){
        RF24NetworkHeader * header = (RF24NetworkHeader*)mesh->network->frame_buffer;
        if(header->from_node == mesh->lastAddress){
            RF24M_setAddress(mesh,mesh->lastID,mesh->lastAddress);
        }        
    }
    #endif
  }
    
	#endif
	return type;
}

uint8_t RF24M_write_n(RF24Mesh* mesh, uint16_t to_node, const void* data, uint8_t msg_type, size_t size ){
    RF24NetworkHeader header; 
    if(mesh->mesh_address == MESH_DEFAULT_ADDRESS){ return 0; }
	RF24NH_init(&header,to_node,msg_type);	
	return RF24N_write_m(mesh->network,&header,data,size);	
}

/*****************************************************/

uint8_t RF24M_write(RF24Mesh* mesh, const void* data, uint8_t msg_type, size_t size, uint8_t nodeID){
  int16_t toNode = 0;
  int32_t lookupTimeout = millis()+ MESH_LOOKUP_TIMEOUT;
  uint32_t retryDelay = 50;
  
  if(mesh->mesh_address == MESH_DEFAULT_ADDRESS){ return 0; }
  
  if(nodeID){
    
    while( (toNode=RF24M_getAddress(mesh,nodeID)) < 0 ){
        if(millis() > lookupTimeout || toNode == -2){
          return 0;
        }
        retryDelay+=50;
        delay(retryDelay);
    }  
  }
  return RF24M_write_n(mesh,toNode,data,msg_type,size);
}

/*****************************************************/

void RF24M_setChannel(RF24Mesh* mesh, uint8_t _channel){

	mesh->radio_channel = _channel;
	RF24_setChannel(mesh->radio,mesh->radio_channel);
	RF24_startListening(mesh->radio);
}
/*****************************************************/
void RF24M_setChild(RF24Mesh* mesh, uint8_t allow){
    //Prevent old versions of RF24Network from throwing an error
    //Note to remove this ""if defined"" after a few releases from 1.0.1
    #if defined FLAG_NO_POLL
      mesh->network->networkFlags = allow ? mesh->network->networkFlags & ~FLAG_NO_POLL : mesh->network->networkFlags | FLAG_NO_POLL; 
    #endif
}
/*****************************************************/

uint8_t RF24M_checkConnection(RF24Mesh* mesh){

	uint8_t count = 3;
	uint8_t ok = 0;
	while(count-- && mesh->mesh_address != MESH_DEFAULT_ADDRESS){
        RF24NetworkHeader header;
        
        RF24M_update(mesh);
        if(RF24_rxFifoFull(mesh->radio) || (mesh->network->networkFlags & 1)){
          return 1;
        }

	    RF24NH_init(&header,00,NETWORK_PING);
		ok = RF24N_write_m(mesh->network,&header,0,0);
		if(ok){break;}
		delay(103);
	}
    if(!ok){ RF24_stopListening(mesh->radio); }
	return ok;
	
}

/*****************************************************/

int16_t RF24M_getAddress(RF24Mesh* mesh, uint8_t nodeID){
int16_t address = 0;
RF24NetworkHeader header;
//#if defined (ARDUINO_SAM_DUE) || defined (__linux)
#if !defined RF24_TINY && !defined(MESH_NOMASTER)
	if(!RF24M_getNodeID(mesh,MESH_BLANK_ID)){ //Master Node
		uint8_t i;
        address = 0;

		for(i=0; i< mesh->addrListTop; i++){
			if(mesh->addrList[i].nodeID == nodeID){
				address = mesh->addrList[i].address;
				return address;
			}
		}
        return -1;
	}
#endif
    if(mesh->mesh_address == MESH_DEFAULT_ADDRESS){ return -1; }
    if(!nodeID){return 0;}

	RF24NH_init(&header, 00, MESH_ADDR_LOOKUP );
	if(RF24N_write_m(mesh->network,&header,&nodeID,sizeof(nodeID)+1) ){
		uint32_t timer=millis(), timeout = 150;		
		while(RF24N_update(mesh->network) != MESH_ADDR_LOOKUP){
			if(millis()-timer > timeout){ return -1; }
		}
	}else{
      return -1;
    }
    address = 0;
	memcpy(&address,mesh->network->frame_buffer+sizeof(RF24NetworkHeader),sizeof(address));
	return address >= 0 ? address: -2;	
}

int16_t RF24M_getNodeID(RF24Mesh* mesh, uint16_t address){

    if(address == MESH_BLANK_ID){
      return mesh->_nodeID;
    }else
    if(address == 0){
      return 0;
    }    
    
    if(!mesh->mesh_address){ //Master Node
        uint8_t i; 
        for(i=0; i< mesh->addrListTop; i++){
            if(mesh->addrList[i].address == address){
                return mesh->addrList[i].nodeID;
            }
        }
    }else{
      RF24NetworkHeader header;  
      if(mesh->mesh_address == MESH_DEFAULT_ADDRESS){ return -1; }
      RF24NH_init(&header, 00, MESH_ID_LOOKUP );
      if(RF24N_write_m(mesh->network,&header,&address,sizeof(address)) ){
        uint32_t timer=millis(), timeout = 500;	
        int16_t ID;
		while(RF24N_update(mesh->network) != MESH_ID_LOOKUP){            
			if(millis()-timer > timeout){ return -1; }
		}

        memcpy(&ID,&mesh->network->frame_buffer[sizeof(RF24NetworkHeader)],sizeof(ID));
        return ID;
      }
    }
    return -1;
}
/*****************************************************/

uint8_t RF24M_releaseAddress(RF24Mesh* mesh){
    RF24NetworkHeader header;
        
    if(mesh->mesh_address == MESH_DEFAULT_ADDRESS){ return 0; }

	RF24NH_init(&header,00,MESH_ADDR_RELEASE);
    if(RF24N_write_m(mesh->network,&header,0,0)){
        RF24N_begin(mesh->network,MESH_DEFAULT_ADDRESS);
        mesh->mesh_address=MESH_DEFAULT_ADDRESS;
        return 1;
    }
	return 0;
}

/*****************************************************/

uint16_t RF24M_renewAddress(RF24Mesh* mesh, uint32_t timeout){
  uint8_t reqCounter = 0;
  uint8_t totalReqs = 0;
  uint32_t start;
          
  if(RF24_available(mesh->radio)){ return 0; }

  RF24_stopListening(mesh->radio);

  mesh->network->networkFlags |= 2;
  delay(10);
  
  RF24N_begin(mesh->network,MESH_DEFAULT_ADDRESS);
  mesh->mesh_address = MESH_DEFAULT_ADDRESS;
  
  start = millis();
  while(!RF24M_requestAddress(mesh,reqCounter)){
    if(millis()-start > timeout){ return 0; }
    delay(50 + ( (totalReqs+1)*(reqCounter+1)) * 2);
    reqCounter++;
    reqCounter = reqCounter%4;
    totalReqs++;
    totalReqs = totalReqs%10;
    
  }
  mesh->network->networkFlags &= ~2;
  return mesh->mesh_address;
}

/*****************************************************/

uint8_t RF24M_requestAddress(RF24Mesh* mesh, uint8_t level){    
    
    RF24NetworkHeader header;
    uint32_t timr;
    #define MESH_MAXPOLLS 4
    uint16_t contactNode[MESH_MAXPOLLS];
    uint8_t pollCount=0;
    
    uint8_t registerAddrCount = 0;
    uint16_t newAddress=0; 
    
    uint8_t type=0;
    uint8_t i;
  
	RF24NH_init(&header, 0100, NETWORK_POLL );
     //Find another radio, starting with level 0 multicast	
	#if defined (MESH_DEBUG_SERIAL)
        Serial.print( millis() ); Serial.println(F(" MSH: Poll "));
    #endif    
    RF24N_multicast(mesh->network,&header,0,0,level);
	
	timr = millis();
    
    while(1){
        #if defined (MESH_DEBUG_SERIAL) || defined (MESH_DEBUG_PRINTF)
		uint8_t goodSignal = RF24_testRPD(&radio);
        #endif
		if(RF24N_update(mesh->network) == NETWORK_POLL){
            memcpy(&contactNode[pollCount],&mesh->network->frame_buffer[0],sizeof(uint16_t));
            ++pollCount;
            
            #if defined (MESH_DEBUG_SERIAL) || defined (MESH_DEBUG_PRINTF)    
			if(goodSignal){
			    // This response was better than -64dBm
                #if defined (MESH_DEBUG_SERIAL)
	            Serial.print( millis() ); Serial.println(F(" MSH: Poll > -64dbm "));
                #elif defined (MESH_DEBUG_PRINTF)
	            printf( "%u MSH: Poll > -64dbm\n", millis() );
	            #endif
			}else{
                #if defined (MESH_DEBUG_SERIAL)
	            Serial.print( millis() ); Serial.println(F(" MSH: Poll < -64dbm "));
                #elif defined (MESH_DEBUG_PRINTF)
	            printf( "%u MSH: Poll < -64dbm\n", millis() );
	            #endif                
            }
            #endif
		}
        
		if(millis() - timr > 55 || pollCount >=  MESH_MAXPOLLS ){
			if(!pollCount){
              #if defined (MESH_DEBUG_SERIAL)
	          Serial.print( millis() ); Serial.print(F(" MSH: No poll from level "));Serial.println(level);
              #elif defined (MESH_DEBUG_PRINTF)
	          printf( "%u MSH: No poll from level %d\n", millis(), level);
	          #endif		
		      return 0;
			}else{
              
              #if defined (MESH_DEBUG_SERIAL)
              Serial.print( millis() ); Serial.println(F(" MSH: Poll OK "));
              #elif defined (MESH_DEBUG_PRINTF)
	          printf( "%u MSH: Poll OK\n", millis() );
	          #endif	
			  break;
			}
		}
	}
	
   
    #ifdef MESH_DEBUG_SERIAL
	Serial.print( millis() ); Serial.print(F(" MSH: Got poll from level ")); Serial.print(level);
    Serial.print(F(" count "));Serial.println(pollCount);
	#elif defined MESH_DEBUG_PRINTF
	printf("%u MSH: Got poll from level %d count %d\n",millis(),level,pollCount);
    #endif	


  for(i=0; i<pollCount; i++){
  
    // Request an address via the contact node
    header.type = NETWORK_REQ_ADDRESS;
    header.reserved = RF24M_getNodeID(mesh,MESH_BLANK_ID);
    header.to_node = contactNode[i];    
    
    // Do a direct write (no ack) to the contact node. Include the nodeId and address.	
    RF24N_write_(mesh->network,&header,0,0,contactNode[i]);
    #ifdef MESH_DEBUG_SERIAL
	  Serial.print( millis() ); Serial.print(F(" MSH: Req addr from ")); Serial.println(contactNode[i],OCT);
	#elif defined MESH_DEBUG_PRINTF
	  printf("%u MSH: Request address from: 0%o\n",millis(),contactNode[i]);
	#endif
	
	timr = millis();    
    
    while(millis()-timr<225){
      if( (type = RF24N_update(mesh->network)) == NETWORK_ADDR_RESPONSE){
        i=pollCount;
        break;
      }
    }
    delay(5);
  }
  if(type != NETWORK_ADDR_RESPONSE){
      return 0;
  }
    
	//Serial.print("response took");
	//Serial.println(millis()-timr);
	#ifdef MESH_DEBUG_SERIAL
    uint8_t mask = 7;	char addrs[5] = "    ", count=3; uint16_t newAddr;	
	#endif

	//memcpy(&addrResponse,network.frame_buffer+sizeof(RF24NetworkHeader),sizeof(addrResponse));
    memcpy(&newAddress,mesh->network->frame_buffer+sizeof(RF24NetworkHeader),sizeof(newAddress));

	if(!newAddress || mesh->network->frame_buffer[7] != RF24M_getNodeID(mesh,MESH_BLANK_ID) ){
		#ifdef MESH_DEBUG_SERIAL
		  Serial.print(millis()); Serial.print(F(" MSH: Attempt Failed ")); Serial.println(network.frame_buffer[7]);
          Serial.print("My NodeID ");Serial.println(getNodeID());
		#elif defined MESH_DEBUG_PRINTF
		  printf("%u Response discarded, wrong node 0%o from node 0%o sending node 0%o id %d\n",millis(),newAddress,header.from_node,MESH_DEFAULT_ADDRESS,network.frame_buffer[7]);
        #endif
		return 0;
	}
	#ifdef MESH_DEBUG_SERIAL
	  Serial.print( millis() );Serial.print(F(" Set address: "));
	  newAddr = newAddress;
	  while(newAddr){
		addrs[count] = (newAddr & mask)+48; //get the individual Octal numbers, specified in chunks of 3 bits, convert to ASCII by adding 48
		newAddr >>= 3;
		count--;
	  }
	  Serial.println(addrs);
	#elif defined (MESH_DEBUG_PRINTF)
	  printf("Set address 0%o rcvd 0%o\n",mesh_address,newAddress);
	#endif
	mesh->mesh_address = newAddress;

    RF24_stopListening(mesh->radio);
    delay(10);
	RF24N_begin(mesh->network,mesh->mesh_address);
	header.to_node = 00;
	header.type = MESH_ADDR_CONFIRM;

	while( !RF24N_write_m(mesh->network, &header,0,0) ){
		if(registerAddrCount++ >= 6 ){ 
          RF24N_begin(mesh->network,MESH_DEFAULT_ADDRESS);
          mesh->mesh_address = MESH_DEFAULT_ADDRESS;
          return 0;
        }
        delay(3);
	}
    
    return 1;  
}

/*****************************************************/
/*
uint8_t RF24M_waitForAvailable(RF24Mesh* mesh, uint32_t timeout){
  
    unsigned long timer = millis();
    while(millis()-timer < timeout){
      RF24N_update(&network);
	  if(RF24N_available(&network)){ return 1; }
	}
    if(RF24N_available(&network)){ return 1; }
	else{  return 0; }
}
*/
/*****************************************************/

void RF24M_setNodeID(RF24Mesh* mesh, uint8_t nodeID){
	mesh->_nodeID = nodeID;
}

/*****************************************************/

void RF24M_setStaticAddress(RF24Mesh* mesh, uint8_t nodeID, uint16_t address){
    RF24M_setAddress(mesh,nodeID,address);
}

/*****************************************************/

void RF24M_setAddress(RF24Mesh* mesh, uint8_t nodeID, uint16_t address){
  
  uint8_t position = mesh->addrListTop;
  uint8_t i; 
  for(i=0; i<mesh->addrListTop; i++){
      if( mesh->addrList[i].nodeID == nodeID){
          position = i;
          break;
      }
  }
  mesh->addrList[position].nodeID = nodeID;
  mesh->addrList[position].address = address;
  
  if(position == mesh->addrListTop){
      ++mesh->addrListTop;  
      mesh->addrList = (addrListStruct*)realloc(mesh->addrList,(mesh->addrListTop + 1) * sizeof(addrListStruct));
  }
  
   #if defined (__linux)  && !defined(__ARDUINO_X86__)
		//if(millis()-lastFileSave > 300){
		//	lastFileSave = millis();
			RF24M_saveDHCP(mesh);
		//}
   #endif	  
  
}

/*****************************************************/

void RF24M_loadDHCP(RF24Mesh* mesh){
	
#if defined (__linux) && !defined(__ARDUINO_X86__)
	FILE * infile;
        int i;
        infile=fopen("dhcplist.txt","r");
	if(!infile){ return; }
	
        mesh->addrList[mesh->addrListTop].nodeID = 255;
	mesh->addrList[mesh->addrListTop].address = 01114;	
	
	fseek(infile,0,SEEK_END);
	int length = ftell(infile);
	fseek(infile,0,SEEK_SET);

	mesh->addrList = (addrListStruct*)realloc(mesh->addrList,length + sizeof(addrListStruct));

	mesh->addrListTop = length/sizeof(addrListStruct);
	for(i=0; i< mesh->addrListTop; i++){
		fread( (char*)&mesh->addrList[i],sizeof(addrListStruct),1,infile);
	}
	fclose(infile);
#endif	
}

/*****************************************************/

void RF24M_saveDHCP(RF24Mesh* mesh){
#if defined (__linux)  && !defined(__ARDUINO_X86__)
	int i;
        FILE* outfile;
        outfile=fopen("dhcplist.txt","w");

	//printf("writingToFile %d  0%o size %d\n",addrList[0].nodeID,addrList[0].address,sizeof(addrListStruct));
	
	for(i=0; i< mesh->addrListTop; i++){
		fwrite( (char*)&mesh->addrList[i],sizeof(addrListStruct),1,outfile);
    }
	fclose(outfile);
	
	/*addrListStruct aList;
	std::ifstream infile ("dhcplist.txt",std::ifstream::binary);
	infile.seekg(0,infile.end);
	int length = infile.tellg();
	infile.seekg(0,infile.beg);
	//addrList = (addrListStruct*)malloc(length);
	
	//infile.read( (char*)&addrList,length);
	infile.read( (char*)&aList,sizeof(addrListStruct));
	 //addrListTop = length/sizeof(addrListStruct);
	//for(int i=0; i< addrListTop; i++){
	printf("ID: %d  ADDR: 0%o  \n",aList.nodeID,aList.address);
	//}
	infile.close();*/
#endif
}

/*****************************************************/

#if !defined (RF24_TINY) && !defined(MESH_NOMASTER)

void RF24M_DHCP(RF24Mesh* mesh){
  RF24NetworkHeader header;
    uint16_t newAddress;    
    uint16_t fwd_by = 0;
    uint8_t shiftVal = 0;
    uint8_t extraChild = 0;
    uint8_t i; 
    uint8_t from_id;
    
  if(mesh->doDHCP){
		 mesh->doDHCP = 0;
  }else{ return; }

    memcpy(&header,mesh->network->frame_buffer,sizeof(RF24NetworkHeader));	
    
    // Get the unique id of the requester
    from_id = header.reserved;
    if(!from_id){
    #ifdef MESH_DEBUG_PRINTF
      printf("MSH: Invalid id 0 rcvd\n");
    #endif
      return;
    }
     

     
    if( header.from_node != MESH_DEFAULT_ADDRESS){
      uint16_t m = header.from_node;
      uint8_t count = 0;
      fwd_by = header.from_node;

      while(m){  //Octal addresses convert nicely to binary in threes. Address 03 = B011  Address 033 = B011011
        m >>= 3; //Find out how many digits are in the octal address
        count++; 
      }
      shiftVal = count*3; //Now we know how many bits to shift when adding a child node 1-5 (B001 to B101) to any address         
    }else{
      //If request is coming from level 1, add an extra child to the master
      extraChild = 1;
    }

    #ifdef MESH_DEBUG_PRINTF
    //  printf("%u MSH: Rcv addr req from_id %d \n",millis(),from_id);
    #endif
       
    for(i=MESH_MAX_CHILDREN+extraChild; i> 0; i--){ // For each of the possible addresses (5 max)
         
      uint8_t found = 0;
      newAddress = fwd_by | (i << shiftVal);
      if(!newAddress ){ /*printf("dumped 0%o\n",newAddress);*/ continue; }

      for(i=0; i < mesh->addrListTop; i++){
      #if defined (MESH_DEBUG_MINIMAL)
        #if !defined (__linux) && !defined ARDUINO_SAM_DUE || defined TEENSY || defined(__ARDUINO_X86__)
          Serial.print("ID: ");Serial.print(addrList[i].nodeID,DEC);Serial.print(" ADDR: ");			
          uint16_t newAddr = addrList[i].address;
          char addr[5] = "    ", count=3, mask=7;
          while(newAddr){
            addr[count] = (newAddr & mask)+48; //get the individual Octal numbers, specified in chunks of 3 bits, convert to ASCII by adding 48
            newAddr >>= 3;
            count--;
          }
          Serial.println(addr);
        #else
          printf("ID: %d ADDR: 0%o\n", addrList[i].nodeID,addrList[i].address);
        #endif
      #endif
        if(  (mesh->addrList[i].address == newAddress && mesh->addrList[i].nodeID != from_id ) || newAddress == MESH_DEFAULT_ADDRESS){
          found = 1;
          break;
        }
      }
      
      if(!found){
        uint32_t timer;  
        header.type = NETWORK_ADDR_RESPONSE;
        header.to_node = header.from_node;
        //This is a routed request to 00
        if(header.from_node != MESH_DEFAULT_ADDRESS){ //Is NOT node 01 to 05
          delay(2);
          if( RF24N_write_m(mesh->network,&header,&newAddress,sizeof(newAddress)) ){
              //addrMap[from_id] = newAddress; //????
          }else{
              RF24N_write_m(mesh->network,&header,&newAddress,sizeof(newAddress));
          }
          }else{
            delay(2);
            RF24N_write_(mesh->network,&header,&newAddress,sizeof(newAddress),header.to_node);
            //addrMap[from_id] = newAddress;
          }
          timer=millis();
          mesh->lastAddress = newAddress;
          mesh->lastID = from_id;
          while(RF24N_update(mesh->network) != MESH_ADDR_CONFIRM){
            if(millis()-timer > mesh->network->routeTimeout){
              return;
            }
          
          }
          RF24M_setAddress(mesh,from_id,newAddress);
        #ifdef MESH_DEBUG_PRINTF
          printf("Sent to 0%o phys: 0%o new: 0%o id: %d\n", header.to_node,MESH_DEFAULT_ADDRESS,newAddress,header.reserved);
        #endif
          break;
      }else{
        #if defined (MESH_DEBUG_PRINTF)
        printf("not allocated\n");
        #endif
      }
    }

   //}else{
	//break;
   //}

}

/*****************************************************/

#endif
