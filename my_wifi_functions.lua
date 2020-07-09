ap_cfg={ssid='Srikanth',pwd='12345678',auth=wifi.WPA2_PSK,hidden=false,save=true}
station_config={ssid='Redmi',pwd='12345678',save=true,auto=true}


-----------------------------------------------------------------------------
------------------------------------------------------------------------------
function wifi_setmode_station()
    wifi.setmode(wifi.STATION,true)
    if(wifi.sta.config(station_config) == true) then 
        print("WiFi Station mode setup Success\n") 
    end
    wifi.sta.connect()  
    wifi.sta.autoconnect(1)
end
------------------------------------------------------------------------------
-----------------------------------------------------------------------------
function wifi_setmode_ap()
    wifi.setmode(wifi.SOFTAP,true)
    if(wifi.ap.config(ap_cfg) == true) then
        print("WiFi AP mode setup Success\n") 
    end     
end
-----------------------------------------------------------------------------
------------------------------------------------------------------------------
function wifi_initialize()
    --This table contains the data of IP address, Net mask and Gateway 
    --We can set these parameters by callling wifi.ap.setip(cfg) this function
    ip_cfg =
    {
    ip="192.168.1.1",
    netmask="255.255.255.0",
    gateway="192.168.1.1"
    }

    --Setting the Station ip adderess
    --wifi.sta.setip(ip_cfg)

    --Setting the AP ip adderess
    --wifi.ap.setip(ip_cfg)


    --Country details setting
    country_info={country='IN',start_ch=1,end_ch=5,policy=wifi.COUNTRY_AUTO}

    --Setting the wifi soft parameters 
    wifi.setcountry(country_info)

    --Setting the physical mode of wifi
    wifi.setphymode(wifi.PHYMODE_G)

    
end
------------------------------------------------------------------------------
------------------------------------------------------------------------------
function set_ap_mac(mac)
    ---Sets MAC address mac: is a string
    wifi.ap.setmac(mac) --Tres if success otherwise false
end
------------------------------------------------------------------------------
------------------------------------------------------------------------------
function print_ap_mac()
    ---Gets MAC address
    print(wifi.ap.getmac())
end
------------------------------------------------------------------------------
------------------------------------------------------------------------------
function print_ap_ip()
    ---Gets IP address and Netmask
    print(wifi.ap.getip())
end
------------------------------------------------------------------------------
------------------------------------------------------------------------------
function print_sta_mac()
    ---Gets MAC address
    print(wifi.sta.getmac())
end
------------------------------------------------------------------------------
------------------------------------------------------------------------------
function print_sta_ip()
    ---Gets IP address and Netmask
    print(wifi.sta.getip())
end
------------------------------------------------------------------------------
------------------------------------------------------------------------------
function print_countryinfo()
for k,v in pairs(wifi.getcountry()) do
    print(k,':',v)
end
------------------------------------------------------------------------------
------------------------------------------------------------------------------
function print_ap_clientinfo()
    ---Gets client list MAC and IP
    table={}
    table=wifi.ap.getclient()
    for mac,ip in pairs(table) do
    print(mac,ip)
end
------------------------------------------------------------------------------
------------------------------------------------------------------------------
function print_ap_config()
    ---Gets the saved configuration 
    table={}
    table=wifi.ap.getconfig(true)
    for k,v in pairs(table) do
        print(k,v)
    end
end
------------------------------------------------------------------------------
function print_ap_client_list()
    ---Prints the connected list of connected devices 
    for mac,ip in pairs(wifi.ap.getclient()) do
        print(mac,ip)
    end
end
------------------------------------------------------------------------------

function print_sta_host()
    ---Prints the connected host device name(SSID 
        print(wifi.sta.gethostname())
end
------------------------------------------------------------------------------




--print(wifi.getchannel()..'\n')
--print(wifi.getdefaultmode()..'\n')
