
/** RF24Mesh_Example.ino by TMRh20

   This example sketch shows how to manually configure a node via RF24Mesh, and send data to the
   master node.
   The nodes will refresh their network address as soon as a single write fails. This allows the
   nodes to change position in relation to each other and the master node.
*/


#include "RF24.h"
#include "RF24Network.h"
#include "RF24Mesh.h"

//#include <printf.h>


/**** Configure the nrf24l01 CE and CS pins ****/
RF24 radio;
RF24Network network;
RF24Mesh mesh;

/**
   User Configuration: nodeID - A unique identifier for each radio. Allows addressing
   to change dynamically with physical changes to the mesh.

   In this example, configuration takes place below, prior to uploading the sketch to the device
   A unique value from 1-255 must be configured for each node.
   This will be stored in EEPROM on AVR devices, so remains persistent between further uploads, loss of power, etc.

 **/
#define nodeID 1


uint32_t displayTimer = 0;

struct payload_t {
  unsigned long ms;
  unsigned long counter;
};

void setup() {

  RF24_init(&radio,7, 8);
  RF24N_init(&network,&radio);
  RF24M_init(&mesh,&radio,&network); 
  
  Serial.begin(115200);
  //printf_begin();
  // Set the nodeID manually
  RF24M_setNodeID(&mesh,nodeID);
  // Connect to the mesh
  Serial.println(F("Connecting to the mesh..."));
  RF24M_begin(&mesh);
}



void loop() {

  RF24M_update(&mesh);

  // Send to the master node every second
  if (millis() - displayTimer >= 1000) {
    displayTimer = millis();

    // Send an 'M' type message containing the current millis()
    if (!RF24M_write(&mesh,&displayTimer, 'M', sizeof(displayTimer))) {

      // If a write fails, check connectivity to the mesh network
      if ( ! RF24M_checkConnection(&mesh) ) {
        //refresh the network address
        Serial.println("Renewing Address");
        RF24M_renewAddress(&mesh);
      } else {
        Serial.println("Send fail, Test OK");
      }
    } else {
      Serial.print("Send OK: "); Serial.println(displayTimer);
    }
  }

  while (RF24N_available(&network)) {
    RF24NetworkHeader header;
    payload_t payload;
    RF24N_read(&network, &header, &payload, sizeof(payload));
    Serial.print("Received packet #");
    Serial.print(payload.counter);
    Serial.print(" at ");
    Serial.println(payload.ms);
  }
}






