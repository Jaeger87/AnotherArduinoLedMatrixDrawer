#include <Wire.h>
#include "Adafruit_LEDBackpack.h"
#include "Adafruit_GFX.h"

Adafruit_8x8matrix matrix = Adafruit_8x8matrix();

static const uint8_t PROGMEM
jaeger[] =
{
B01111110,
B00011000,
B00011000,
B00011000,
B00011000,
B11011000,
B10011000,
B11111000
};


void setup() {
  matrix.begin(0x70);  // pass in the address

}

void loop() {
  matrix.clear();
  matrix.drawBitmap(0, 0, jaeger, 8, 8, LED_ON);
  matrix.writeDisplay();
  delay(500);

}
