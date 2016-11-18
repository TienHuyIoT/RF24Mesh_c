 
 
 /** RF24Mesh_Example_Master.ino by TMRh20
  * 
  *
  * This example sketch shows how to manually configure a node via RF24Mesh as a master node, which
  * will receive all data from sensor nodes.
  *
  * The nodes can change physical or logical position in the network, and reconnect through different
  * routing nodes as required. The master node manages the address assignments for the individual nodes
  * in a manner similar to DHCP.
  *
  */
  
  
#include "RF24Network.h"
#include "RF24.h"
#include "RF24Mesh.h"

//Include eeprom.h for AVR (Uno, Nano) etc. except ATTiny
#include <EEPROM.h>

/***** Configure the chosen CE,CS pins *****/
RF24 radio;
RF24Network network;
RF24Mesh mesh;

uint32_t displayTimer = 0;

void setup() {
RF24_init(&radio,7,8);
RF24N_init(&network,&radio);
RF24M_init(&mesh,&radio,&network);
  
  Serial.begin(115200);

  // Set the nodeID to 0 for the master node
  RF24M_setNodeID(&mesh,0);
  Serial.println(RF24M_getNodeID(&mesh));
  // Connect to the mesh
  RF24M_begin(&mesh);

}


void loop() {    

  // Call mesh.update to keep the network updated
  RF24M_update(&mesh);
  
  // In addition, keep the 'DHCP service' running on the master node so addresses will
  // be assigned to the sensor nodes
  RF24M_DHCP(&mesh);
  
  
  // Check for incoming data from the sensors
  if(RF24N_available(&network)){
    RF24NetworkHeader header;
    RF24N_peek(&network,&header);
    
    uint32_t dat=0;
    switch(header.type){
      // Display the incoming millis() values from the sensor nodes
      case 'M': RF24N_read(&network,&header,&dat,sizeof(dat)); Serial.println(dat); break;
      default: RF24N_read(&network,&header,0,0); Serial.println(header.type);break;
    }
  }
  
  if(millis() - displayTimer > 5000){
    displayTimer = millis();
    Serial.println(" ");
    Serial.println(F("********Assigned Addresses********"));
     for(int i=0; i<mesh.addrListTop; i++){
       Serial.print("NodeID: ");
       Serial.print(mesh.addrList[i].nodeID);
       Serial.print(" RF24Network Address: 0");
       Serial.println(mesh.addrList[i].address,OCT);
     }
    Serial.println(F("**********************************"));
  }
}
