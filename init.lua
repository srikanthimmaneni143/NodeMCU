--If you want you can set the uart baud by below function
--uart.setup(0, 230400, 8, 0, 1, 0)

--To Soft-Restart nodemcu
--node.restart()

_, reset_reason = node.bootreason()
if reset_reason == 0 then print("Power ON!") end
if reset_reason == 1 then print("hardware watchdog reset!") end
if reset_reason == 2 then print("exception reset!") end
if reset_reason == 3 then print("software watchdog reset!") end
if reset_reason == 4 then print("software restart!") end
if reset_reason == 5 then print("wake from deep sleep!") end
if reset_reason == 6 then print("external reset!") end


 wifi.eventmon.register(wifi.eventmon.STA_CONNECTED, function(T)
 print("\n\tSTA - CONNECTED".."\n\tSSID: "..T.SSID.."\n\tBSSID: "..
 T.BSSID.."\n\tChannel: "..T.channel)
 end)

 wifi.eventmon.register(wifi.eventmon.STA_DISCONNECTED, function(T)
 print("\n\tSTA - DISCONNECTED".."\n\tSSID: "..T.SSID.."\n\tBSSID: "..
 T.BSSID.."\n\treason: "..T.reason)
 end)

 wifi.eventmon.register(wifi.eventmon.STA_AUTHMODE_CHANGE, function(T)
 print("\n\tSTA - AUTHMODE CHANGE".."\n\told_auth_mode: "..
 T.old_auth_mode.."\n\tnew_auth_mode: "..T.new_auth_mode)
 end)

 wifi.eventmon.register(wifi.eventmon.STA_GOT_IP, function(T)
 print("\n\tSTA - GOT IP".."\n\tStation IP: "..T.IP.."\n\tSubnet mask: "..
 T.netmask.."\n\tGateway IP: "..T.gateway)
 end)

 wifi.eventmon.register(wifi.eventmon.STA_DHCP_TIMEOUT, function()
 print("\n\tSTA - DHCP TIMEOUT")
 end)

 wifi.eventmon.register(wifi.eventmon.AP_STACONNECTED, function(T)
 print("\n\tAP - STATION CONNECTED".."\n\tMAC: "..T.MAC.."\n\tAID: "..T.AID)
 end)

 wifi.eventmon.register(wifi.eventmon.AP_STADISCONNECTED, function(T)
 print("\n\tAP - STATION DISCONNECTED".."\n\tMAC: "..T.MAC.."\n\tAID: "..T.AID)
 end)

 wifi.eventmon.register(wifi.eventmon.AP_PROBEREQRECVED, function(T)
 print("\n\tAP - PROBE REQUEST RECEIVED".."\n\tMAC: ".. T.MAC.."\n\tRSSI: "..T.RSSI)
 end)

 wifi.eventmon.register(wifi.eventmon.WIFI_MODE_CHANGED, function(T)
 print("\n\tSTA - WIFI MODE CHANGED".."\n\told_mode: "..
 T.old_mode.."\n\tnew_mode: "..T.new_mode)
 end)

------------------------------------------------------------------------------
station_config={ssid='Redmi',pwd='12345678',save=true,auto=true}
--station_config={ssid='Kalavathi',pwd='9948838710',save=true,auto=true}

function wifi_setmode_station()
    wifi.setmode(wifi.STATION,true)
    if(wifi.sta.config(station_config) == true) then 
        print("WiFi Station mode setup Success\n") 
    end
--    wifi.sta.connect()  
--    wifi.sta.autoconnect(1)
end

wifi_setmode_station()

--print(wifi.ap.getip())

--print("init.lua file has completed initialization \nNote: Change the serial port baud to 115200\n")
