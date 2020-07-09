--server_link = "https://nodemcu.readthedocs.io/en/master/modules/http/" -- set server URL

net.dns.resolve("www.electronicwings.com", function(sk, ip)
    if (ip == nil) then print("DNS fail!") else print(ip) end
end)

--[[
function GetFromThingSpeak()-- callback function for get data
http.get(server_link,nil,
function(code, data)
    if (code < 0) then
     print("HTTP request failed")
    else
     print(code, data)
    end
  end)
end
GetFromThingSpeak()

]]
-- call get function after each 10 second
--tmr.alarm(1, 10000, 1, function() GetFromThingSpeak() end)

--[[
http.post('http://httpbin.org/post',
  'Content-Type: application/json\r\n',
  '{"hello":"world"}',
  function(code, data)
    if (code < 0) then
      print("HTTP request failed")
    else
      print(code, data)
    end
  end)
]]
