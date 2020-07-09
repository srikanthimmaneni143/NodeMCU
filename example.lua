host="io.adafruit.com"
port=1883
clientid,user,password = '1','sri8352', 'aio_pWyq97vP5rzmJcgBucpiTLumVE85'

---Creating the client
client = mqtt.Client(clientid, 120, user, password)

-- setup Last Will and Testament (optional)
-- Broker will publish a message with qos = 0, retain = 0, data = "offline"
client:lwt("/lwt", "offline    Not known", 0, 0)

---Registering the call back functions for specific events
--client:on("connect", function(client) print ("connected") end)
--client:on("connfail", function(client, reason) print ("connection failed", reason) end)
client:on("offline", function(client) print ("offline") end)

-- on publish overflow receive event
--[[client:on("overflow", function(client, topic, data)
                        print(topic .. " partial overflowed message: " .. data )
                      end)
]]                    
  -- on publish message receive event
client:on("message", function(client, topic, data)
                        print(topic .. ":" )
                        if data ~= nil then
                          print(data)
                        end
                      end)                  
                    
 client:connect(host,port,false,function(client) print("Connection Establshed")
         -- subscribe topic with qos = 0
--         client:subscribe("/topic", 0, function(client) print("subscribe success") end) 
        -- publish a message with data = hello, QoS = 0, retain = 0
        client:publish("sri8352/feeds/fun", "3rd one", 0, 0, function(client) print("sent") end)
        end,
        
function(client, reason)
  print("failed reason: " .. reason)
end)    
 
 
 
 
 --client:publish("sri8352/feeds/new-feed","FromNnodemcu",0,0,function(client) print('Sent') end )
                    
                    