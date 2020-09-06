#include "main.h"

U8G2_PCD8544_84X48_1_4W_SW_SPI u8g2(U8G2_R2, GPIO_NUM_18, GPIO_NUM_23, GPIO_NUM_2, GPIO_NUM_4, GPIO_NUM_22);

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
  StaticJsonDocument<800> jsonMeasurements = readMeasurements();
  serializeJsonPretty(jsonMeasurements, Serial);
  JsonObject documentRoot = jsonMeasurements.as<JsonObject>();
  // for (JsonPair keyValue : documentRoot) {
  //   Serial.println(keyValue.key().c_str());
  //   Serial.println(keyValue.value().as<char*>());
  // }

  int lineHeight = 8;

  u8g2.firstPage();
  do {
    u8g2.setFont(u8g2_font_4x6_tr);

    int sensorIndex = 1;
    for (JsonPair keyValue : documentRoot) {
      JsonObject measurementRoot = keyValue.value().as<JsonObject>();
      JsonObject measurementInfo = measurementRoot.getMember("info").as<JsonObject>();
      JsonObject measurements = measurementRoot.getMember("measurements").as<JsonObject>();

      // sensor name; e.g. living room sensor
      char * displayName = new char[30];
      sprintf(displayName, "%s:", measurementInfo.getMember("displayName").as<char *>());
      u8g2.drawStr(0, sensorIndex*lineHeight, displayName);

      int measurementTypeIndex = 0;
      for (JsonPair measurementKeyValue : measurements) {
        // measurement type; e.g. temperature
        const char * measurementName = measurementKeyValue.key().c_str();
        u8g2.drawStr(0, (sensorIndex+1+measurementTypeIndex)*lineHeight, measurementName);

        // measurement value; e.g. 26 (degrees)
        char * measurementStr = new char[5];
        sprintf(measurementStr,"%.1f", measurementKeyValue.value().getMember("measurement").as<double>());
        u8g2.drawStr(305, (sensorIndex+1 + measurementTypeIndex)*lineHeight, measurementStr);

        // measurement unit; e.g. C
        const char * measurementUnit = measurementKeyValue.value().getMember("measurementTypeUnit").as<char *>();
        u8g2.drawStr(328, (sensorIndex+1 + measurementTypeIndex)*lineHeight, measurementUnit);

        measurementTypeIndex += 1;
      }

      sensorIndex += (measurementTypeIndex + 1);
    }

  } while ( u8g2.nextPage() );

  delay(REFRESH_RATE * mS_TO_S_FACTOR); // 5 min = 300000ms
}