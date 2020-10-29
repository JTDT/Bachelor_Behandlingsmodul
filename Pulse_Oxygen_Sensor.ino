/* Inspiration from SparkFun Electronics code example, Author: Elias Santistevan
 * Link: https://learn.sparkfun.com/tutorials/sparkfun-pulse-oximeter-and-heart-rate-monitor-hookup-guide?_ga=2.252180672.859433163.1600682315-2052719516.1600682315

 This board requires I-squared-C connections but also connections to the reset
 and mfio pins. When using the device keep LIGHT and CONSISTENT pressure on the
 sensor. Otherwise you may crush the capillaries in your finger which results
 in bad or no results. A summary of the hardware connections are as follows: 
 SDA -> SDA
 SCL -> SCL
 RESET -> PIN 4
 MFIO -> PIN 5

 If you run into an error code check the following table to help diagnose your
 problem: 
 1 = Unavailable Command
 2 = Unavailable Function
 3 = Data Format Error
 4 = Input Value Error
 5 = Try Again
 255 = Error Unknown
*/

#include <SparkFun_Bio_Sensor_Hub_Library.h>
#include <Wire.h>

// Reset pin, MFIO pin
int resPin = 4;
int mfioPin = 5;

// Pulse width and sample rate
int pulseWidthVal;
int sampleVal;

// Takes address, reset pin, and MFIO pin.
SparkFun_Bio_Sensor_Hub bioHub(resPin, mfioPin); 

bioData body;  

void setup(){

  Serial.begin(115200);

  Wire.begin();
  int result = bioHub.begin();
//  if (result == 0) // Zero errors!
//    Serial.println("Sensor started!");
//  else
//    Serial.println("Could not communicate with the sensor!!!");
// 
//  Serial.println("Configuring Sensor...."); 
  int error = bioHub.configBpm(MODE_ONE); // Configuring just the BPM settings. 
//  if(error == 0){ // Zero errors!
//    Serial.println("Sensor configured.");
//  }
//  else {
//    Serial.println("Error configuring sensor.");
//    Serial.print("Error: "); 
//    Serial.println(error); 
//  }
//
//  // Data lags a bit behind the sensor, if you're finger is on the sensor when
//  // it's being configured this delay will give some time for the data to catch
//  // up. 
//  Serial.println("Loading up the buffer with data....");
  
//  // Check the pulse width  
//  pulseWidthVal = bioHub.readPulseWidth();
//  Serial.print("Pulse Width: ");
//  Serial.println(pulseWidthVal);
//
//  // Check sample rate.
//  sampleVal = bioHub.readSampleRate();
//  Serial.print("Sample rate is set to: ");
//  Serial.println(sampleVal); 
  
  delay(4000); 
  
}

void loop(){

    // Information from the readBpm function will be saved to our "body"
    // variable.  
    body = bioHub.readBpm();
    Serial.print(body.heartRate); 
    Serial.print(":");
    Serial.print(body.oxygen); 
    Serial.print(":");
    Serial.print(body.confidence); 
    Serial.print(":");
    Serial.print(body.status); 
    Serial.println(); // acts as terminator - distinguish data sets
    // Slow it down or your heart rate will go up trying to keep up
    // with the flow of numbers - every 2 seconds 
    delay(2000); // dette skal ændres når ekg implementeres
}
