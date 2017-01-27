
/** RF24Mesh_Example.ino by TMRh20

   This example sketch shows how to manually configure a node via RF24Mesh, and send data to the
   master node.
   The nodes will refresh their network address as soon as a single write fails. This allows the
   nodes to change position in relation to each other and the master node.
*/


#include "RF24.h"
#include "RF24Network_c.h"
#include "RF24Mesh_c.h"
#include "serial.h"


/**** Configure the nrf24l01 CE and CS pins ****/
//RF24 radio;
//RF24Network network;
//RF24Mesh mesh_;

/**
   User Configuration: nodeID - A unique identifier for each radio. Allows addressing
   to change dynamically with physical changes to the mesh.

   In this example, configuration takes place below, prior to uploading the sketch to the device
   A unique value from 1-255 must be configured for each node.
   This will be stored in EEPROM on AVR devices, so remains persistent between further uploads, loss of power, etc.

 **/
#define nodeID 1


uint32_t displayTimer = 0;

typedef struct{
  uint32_t ms;
  uint32_t counter;
}payload_t;

void setup() {

  RF24_init();//pins are defined in xc8_config.h
  RF24N_init();
  RF24M_init(); 
  
  Serial_begin(115200);
  //printf_begin();
  // Set the nodeID manually
  RF24M_setNodeID(nodeID);    
  // Connect to the mesh
  Serial_println(F("Connecting to the mesh..."));
  RF24M_begin(MESH_DEFAULT_CHANNEL, RF24_1MBPS, MESH_RENEWAL_TIMEOUT );

}



void loop() {

  RF24M_update();

  // Send to the master node every second
  if (millis() - displayTimer >= 1000) {
    displayTimer = millis();

    // Send an 'M' type message containing the current millis()
    if (!RF24M_write(&displayTimer, 'M', sizeof(displayTimer),0)) {

      // If a write fails, check connectivity to the mesh network
      if ( ! RF24M_checkConnection() ) {
        //refresh the network address
        Serial_println("Renewing Address");
        RF24M_renewAddress(MESH_RENEWAL_TIMEOUT);
      } else {
        Serial_println("Send fail, Test OK");
      }
    } else {
      Serial_print("Send OK: "); Serial_println(itoa_(displayTimer));
    }
  }

  while (RF24N_available()) {
    RF24NetworkHeader header;
    payload_t payload;
    RF24N_read( &header, &payload, sizeof(payload));
    Serial_print("Received packet #");
    Serial_print(itoa_(payload.counter));
    Serial_print(" at ");
    Serial_println(itoa_(payload.ms));
  }
}






