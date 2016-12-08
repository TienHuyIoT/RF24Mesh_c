 
 
 /** RF24Mesh_Example_Master.ino by TMRh20
  * 
  * Note: This sketch only functions on -Arduino Due-
  *
  * This example sketch shows how to manually configure a node via RF24Mesh as a master node, which
  * will receive all data from sensor nodes.
  *
  * The nodes can change physical or logical position in the network, and reconnect through different
  * routing nodes as required. The master node manages the address assignments for the individual nodes
  * in a manner similar to DHCP.
  *
  */
  
#include "RF24Mesh_c/RF24Mesh_c.h"  
#include <RF24_c/RF24_c.h>
#include <RF24Network_c/RF24Network_c.h>


//RF24 radio;  
//RF24Network network;
//RF24Mesh mesh;



int main(int argc, char** argv) {

RF24_init2(RPI_V2_GPIO_P1_15, BCM2835_SPI_CS0, BCM2835_SPI_SPEED_8MHZ);  
RF24N_init();
RF24M_init();
  
  // Set the nodeID to 0 for the master node
  RF24M_setNodeID(0);
  // Connect to the mesh
  printf("start\n");
  RF24M_begin( MESH_DEFAULT_CHANNEL, RF24_1MBPS, MESH_RENEWAL_TIMEOUT );
  RF24_printDetails();

while(1)
{
  
  // Call network.update as usual to keep the network updated
  RF24M_update();

  // In addition, keep the 'DHCP service' running on the master node so addresses will
  // be assigned to the sensor nodes
  RF24M_DHCP();
  
  
  // Check for incoming data from the sensors
  while(RF24N_available()){
//    printf("rcv\n");
    RF24NetworkHeader header;
    RF24N_peek(&header);
    
    uint32_t dat=0;
    switch(header.type){
      // Display the incoming millis() values from the sensor nodes
      case 'M': RF24N_read(&header,&dat,sizeof(dat)); 
                printf("Rcv %u from 0%o\n",dat,header.from_node);
                 break;
      default:  RF24N_read(&header,0,0); 
                printf("Rcv bad type %d from 0%o\n",header.type,header.from_node); 
                break;
    }
  }
delay(2);
  }
return 0;
}

      
      
      
