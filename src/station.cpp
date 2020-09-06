#include "station.h"

HTTPClient http;

bool setupWiFi() {
  int wifiRetriesLeft = 50;

  Config credentials = readConfig();

  WiFi.begin(credentials.ssid.c_str(), credentials.password.c_str());

  while (WiFi.status() != WL_CONNECTED && wifiRetriesLeft > 0) {
    delay(500);
    Serial.println("Connecting to WiFi with SSID " + credentials.ssid + " and password " + credentials.password);
    wifiRetriesLeft -= 1;
  }

  if (wifiRetriesLeft <= 0 || WiFi.status() != WL_CONNECTED) {
    Serial.println("Could not connect to WiFi.");
    return false;
  }
  
  Serial.println("Connected to WiFi");

  return true;
}

StaticJsonDocument<800> readMeasurements() {
  http.begin("http://" + String(CFG_SENSOR_DASHBOARD_URL) + "/api/measurements/display");

  http.addHeader("Accept", "application/json");
  http.addHeader("Authorization", readFromEEPROM("access_token"));
  int httpResponseCode = http.GET();

  if (httpResponseCode > 0 && httpResponseCode < 400) {
    Serial.print("HTTP Response code: ");
    Serial.println(httpResponseCode);
    String payload = http.getString();

    StaticJsonDocument<800> doc;
    deserializeJson(doc, payload.c_str());
    //Serial.println(payload);
    http.end();
    return doc;
  }
  else {
    Serial.print("Error code: ");
    String payload = http.getString();
    Serial.println(httpResponseCode);
    Serial.println(payload);
    http.end();
  }
}