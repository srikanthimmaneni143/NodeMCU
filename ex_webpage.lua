
server = net.createServer(net.TCP, 120) --Creating TCP server
flag_led=0
---Webpage script of HTML language
function SendHTML(sck) -- Send LED on/off HTML page
   htmlstring = "<!DOCTYPE html>\r\n"
   htmlstring = htmlstring.."<html>\r\n"
   htmlstring = htmlstring.."<head>\r\n"
   htmlstring = htmlstring.."<title>LED Control</title>\r\n"
   htmlstring = htmlstring.."</head>\r\n"
   htmlstring = htmlstring.."<body>\r\n"
   htmlstring = htmlstring.."<h1>LED</h1>\r\n"
   htmlstring = htmlstring.."<p>Click to switch LED on and off.</p>\r\n"
   htmlstring = htmlstring.."<form method=\"get\">\r\n"
  if (flag_led ==1)  then 
   htmlstring = htmlstring.."<input type=\"button\" value=\"LED OFF\" onclick=\"window.location.href='/ledoff'\">\r\n"
  else
   htmlstring = htmlstring.."<input type=\"button\" value=\"LED ON\" onclick=\"window.location.href='/ledon'\">\r\n"
  end
   htmlstring = htmlstring.."</form>\r\n"
   htmlstring = htmlstring.."</body>\r\n"
   htmlstring = htmlstring.."</html>\r\n"
   sck:send(htmlstring)
end

function receiver(sck, data)-- process callback on recive data from client
  if string.find(data, "GET /ledon")  then
   print("LED ON")
   flag_led=1
   SendHTML(sck)
--   gpio.write(LEDpin, gpio.HIGH)
  elseif string.find(data, "GET / ") or string.find(data, "GET /ledoff") then
   print("LED Off")
   flag_led=0
   SendHTML(sck)
--   gpio.write(LEDpin, gpio.LOW)
  else
   sck:send("<h2>Not found...!!</h2>")
   sck:on("sent", function(conn) conn:close() end)
  end
end

if server then
  server:listen(80, function(conn)-- listen to the port 80
  conn:on("receive", receiver)
  end)
end
