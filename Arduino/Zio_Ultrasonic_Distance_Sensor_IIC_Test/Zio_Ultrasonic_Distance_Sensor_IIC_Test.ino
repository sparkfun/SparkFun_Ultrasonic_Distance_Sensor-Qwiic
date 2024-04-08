// Zio_Ultrasonic_Distance_Sensor_IIC_Test
  
#include <Wire.h>
#define PERIPH_ADDR 0x2F
#define BEGIN_MEASURE 0x01
uint8_t distance_H=0;
uint8_t distance_L=0;
uint16_t distance=0;
     
void setup() {

  Wire.begin(); 

  Serial.begin(115200);  
  Serial.println("Ultrasonic Distance Sensor - Example 1 Basic Distance Sensing.");

  Wire.beginTransmission(PERIPH_ADDR); 
    uint8_t error = Wire.endTransmission();
  if(error != 0){    
    Serial.print("Communication failed:");
    Serial.println(error, HEX);
    while(1);
  }

  Serial.println("Communication established.");

}

void loop() {
  Serial.println("Sending command.");
  Wire.beginTransmission(PERIPH_ADDR);
  Wire.write(BEGIN_MEASURE);              
  Wire.endTransmission();    

  delay(20);

  Serial.println("Requesting distance.");
  Wire.requestFrom(PERIPH_ADDR, 2);
  delay(20);
  while (Wire.available()) { 
  distance_H = Wire.read(); 
  distance_L = Wire.read();  
  distance = (uint16_t)distance_H<<8;
  distance = distance|distance_L; 

  Serial.println("Distance: ");
  Serial.print(distance);         
  Serial.println("mm"); 
  delay(100);
 }
}
