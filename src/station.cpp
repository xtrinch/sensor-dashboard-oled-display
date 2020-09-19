#include "station.h"

HTTPClient http;

bool setupWiFi() {
  int wifiRetriesLeft = WIFI_CONNECT_RETRIES;

  char ssid[60];
  readFromEEPROM(ssid, "ssid");
  char password[60];
  readFromEEPROM(password, "password");

  WiFi.begin(ssid, password);

  while (WiFi.status() != WL_CONNECTED && wifiRetriesLeft > 0) {
    delay(500);
    ardprintf("Station: Connecting with SSID %s", ssid);
    ardprintf("Station: Connecting with password %s", password);

    wifiRetriesLeft -= 1;
  }

  if (wifiRetriesLeft <= 0 || WiFi.status() != WL_CONNECTED) {
    ardprintf("Station: Could not connect to WiFi.");
    return false;
  }
  
  ardprintf("Station: Connected to WiFi");

  http.begin("http://" + String(CFG_SENSOR_DASHBOARD_URL) + "/api/measurements/multi");
  return true;
}

StaticJsonDocument<800> readMeasurements() {
  StaticJsonDocument<800> doc;

  http.begin("http://" + String(CFG_SENSOR_DASHBOARD_URL) + "/api/measurements/display");

  http.addHeader("Accept", "application/json");
  char accessToken[60];
  readFromEEPROM(accessToken, "access_token");

  http.addHeader("Authorization", accessToken);
  int httpResponseCode = http.GET();

  if (httpResponseCode > 0 && httpResponseCode < 400) {
    Serial.print("HTTP Response code: ");
    Serial.println(httpResponseCode);
    String payload = http.getString();

    deserializeJson(doc, payload.c_str());
    //Serial.println(payload);
    http.end();
  }
  else {
    Serial.print("Error code: ");
    String payload = http.getString();
    Serial.println(httpResponseCode);
    Serial.println(payload);
    http.end();
  }

  return doc;
}