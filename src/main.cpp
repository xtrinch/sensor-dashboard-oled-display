#include "main.h"

//U8G2_R0 = no rotation
U8G2_PCD8544_84X48_1_4W_SW_SPI u8g2(U8G2_R0, GPIO_NUM_18, GPIO_NUM_23, GPIO_NUM_2, GPIO_NUM_4, GPIO_NUM_22);

void setup() {
  Serial.begin(9600);

  while (!Serial);

  setupEEPROM();

  // uncomment when you want to programmatically clear config
  // clearConfig();

  if (!configSaved()) {
    if (!setupAP()) {
      goToSleep();
    }

    listenForConfig();
    cleanupAP();
  }

  if (!setupWiFi()) {
    goToSleep();
  }

  if (!u8g2.begin()) {
    goToSleep();
  }
}

void loop() {
  StaticJsonDocument<200> jsonMeasurements = readMeasurements();
  serializeJsonPretty(jsonMeasurements, Serial);

  u8g2.firstPage();
  do {
    u8g2.setFont(u8g2_font_ncenB14_tr);
    u8g2.drawStr(0,24,"Hello World!");
  } while ( u8g2.nextPage() );

  delay(REFRESH_RATE * mS_TO_S_FACTOR); // 5 min = 300000ms
}