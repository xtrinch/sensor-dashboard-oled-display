# sensor-dashboard-oled-display

Reads sensor data from [sensor dashboard](http://sensor-dashboard.trina.si/) [backend](https://github.com/xtrinch/sensor-dashboard-nestjs-backend/) and displays it on a PCD8544 nokia OLED display.

Built with PlatformIO.

## Setup

1. Have a sensor dashboard backend running (see https://github.com/xtrinch/sensor-dashboard-nestjs-backend)
2. Copy `import_env.example.py` to `import_env.py` and define your sensor dashboard url.
3. When board boots connect to its WiFi called `beetleAP` with password `beetleAP`
4. Input your WiFi's SSID, password and sensor access token with visiting this URL `192.168.4.1/?ssid=mySSID&password=myPassword&access_token=mysensoraccesstoken`

## Components
- ESP32/ESP8266 dev board (I was using devkit v1)
- pushbutton (for resetting credentials & token)
- resistor
- 3.7V LiPo battery (or other)
- PCD8544 nokia OLED display