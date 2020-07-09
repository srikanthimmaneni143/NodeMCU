
server = net.createServer(net.TCP, 120) --Creating TCP server
flag_fan,flag_led,flag_tv = 0,0,0

---Webpage script of HTML language
function SendHTML(sck) -- Send LED on/off HTML page
   htmlstring = "<!DOCTYPE html>\r\n"
   htmlstring = htmlstring.."<html>\r\n"
   htmlstring = htmlstring.."<head>\r\n"
   htmlstring = htmlstring.."<title>LED Control</title>\r\n"
   htmlstring = htmlstring.."</head>\r\n"
   htmlstring = htmlstring.."<style>\r\n"
   htmlstring = htmlstring.."h1 {color: #2cc8ff;}\r\n"
   htmlstring = htmlstring.."p  {color: red;font-size:150%;text-align:center;background-color: powderblue;}\r\n"
   htmlstring = htmlstring..".button {\r\n"
   htmlstring = htmlstring.."border: none;\r\n"
   htmlstring = htmlstring.."color: white;\r\n"
   htmlstring = htmlstring.."padding: 16px 32px;\r\n"
   htmlstring = htmlstring.."text-align: center;\r\n"
   htmlstring = htmlstring.."text-decoration: none;\r\n"
   htmlstring = htmlstring.."display: inline-block;\r\n"
   htmlstring = htmlstring.."font-size: 16px;\r\n"
   htmlstring = htmlstring.."margin: 4px 2px;\r\n"
   htmlstring = htmlstring.."transition-duration: 0.4s;\r\n"
   htmlstring = htmlstring.."cursor: pointer;}\r\n"
   htmlstring = htmlstring..".button1 {\r\n"
   htmlstring = htmlstring.."background-color: white;\r\n"
   htmlstring = htmlstring.."color: black;\r\n"
  htmlstring = htmlstring.."border: 2px solid #008CBA;\r\n"
  htmlstring = htmlstring.."padding: 30px 30px;\r\n"
  htmlstring = htmlstring.."font-size: 30px;}\r\n"
  htmlstring = htmlstring..".button1:hover {\r\n"
  htmlstring = htmlstring.."background-color: #4CAF50;\r\n"
  htmlstring = htmlstring.."color: white;}\r\n"
  htmlstring = htmlstring..".button2 {\r\n"
  htmlstring = htmlstring.."background-color: white;\r\n"
  htmlstring = htmlstring.."color: black;\r\n"
  htmlstring = htmlstring.."border: 2px solid #008CBA;\r\n"
  htmlstring = htmlstring.."padding: 30px 30px;\r\n"
  htmlstring = htmlstring.."font-size: 30px;}\r\n"
  htmlstring = htmlstring..".button2:hover {\r\n"
  htmlstring = htmlstring.."background-color: #ff696a;\r\n"
  htmlstring = htmlstring.."color: white;}\r\n"
  htmlstring = htmlstring.."</style>\r\n"

  htmlstring = htmlstring..'<body style="background-color: #e6e6e6;">\r\n'
-------------------------------------------------------------  
  htmlstring = htmlstring.."<h1>LED </h1>\r\n"
  htmlstring = htmlstring..'<form method="get">\r\n'
  if (flag_led == 1)  then 
   htmlstring = htmlstring..'<input class="button button2" ; type="button" value="LED OFF" onclick="window.location.href=\'/ledoff\'">\r\n'
  else
   htmlstring = htmlstring..'<input class="button button1" ; type="button" value="LED ON" onclick="window.location.href=\'/ledon\'">\r\n'
  end
  htmlstring = htmlstring.."</form>\r\n"
-------------------------------------------------------------
-------------------------------------------------------------  
  htmlstring = htmlstring.."<h1>TV</h1>\r\n"
  htmlstring = htmlstring..'<form method="get">\r\n'
  if (flag_tv == 1)  then 
   htmlstring = htmlstring..'<input class="button button2" ; type="button" value="TV OFF" onclick="window.location.href=\'/tvoff\'">\r\n'
  else
   htmlstring = htmlstring..'<input class="button button1" ; type="button" value="TV ON" onclick="window.location.href=\'/tvon\'">\r\n'
  end
  htmlstring = htmlstring.."</form>\r\n"
---------------------------------------------------------------
  htmlstring = htmlstring.."<h1>FAN</h1>\r\n"
  htmlstring = htmlstring..'<form method="get">\r\n'
  if (flag_fan == 1)  then 
   htmlstring = htmlstring..'<input class="button button2" ; type="button" value="FAN OFF" onclick="window.location.href=\'/fanoff\'">\r\n'
  else
   htmlstring = htmlstring..'<input class="button button1" ; type="button" value="FAN ON" onclick="window.location.href=\'/fanon\'">\r\n'
  end
  htmlstring = htmlstring.."</form>\r\n"

------------------------------------------------------------------------------------  
   htmlstring = htmlstring.."</body>\r\n"
   htmlstring = htmlstring.."</html>\r\n"
   sck:send(htmlstring)
end

function receiver(sck, data)-- process callback on recive data from client
  if string.find(data, "GET /ledon")  then
      print('led on find')
      flag_led=1
      SendHTML(sck)

  elseif  string.find(data, "GET /ledoff") or string.find(data, "GET / ") then
      flag_led=0
      SendHTML(sck)
  elseif  string.find(data, "GET /tvon") then
       flag_tv=1
       SendHTML(sck)
  elseif  string.find(data, "GET /tvoff") or string.find(data, "GET / ") then
       flag_tv=0
       SendHTML(sck)
  elseif   string.find(data, "GET /fanon") then
       flag_fan=1
       SendHTML(sck)
  elseif  string.find(data, "GET /fanoff") or string.find(data, "GET / ") then
       flag_fan=0
       SendHTML(sck)
  
  else
   sck:send("<h2>Not found...!!</h2>")
   sck:on("sent", function(conn) conn:close() end)
  end
end

if server then
    print("Server\n")
  server:listen(80, function(conn)-- listen to the port 80
                print("Server listening\n")  
                conn:on("receive", receiver)
  end)
end
