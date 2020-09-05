Import("env")

env.Append(CPPDEFINES=[
  ("SLEEP_SECONDS", 300),
  # ("WIFI_SSID", "GNX3B7B4D"),
	# ("WIFI_PASSWORD", "TDS9ULEWW2FQ"),
  # ("SENSOR_ACCESS_TOKEN", "2fe570e8-2c32-4603-95cd-416a02362aae"),
  ("SENSOR_DASHBOARD_URL", "sensor-dashboard.trina.si"),
  ("ONBOARD_WIFI_SSID", "beetleAP"),
  ("ONBOARD_WIFI_PASSWORD", "beetleAP")
])