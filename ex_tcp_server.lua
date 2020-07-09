port=5555


server = net.createServer(net.TCP, 60)  --Creates the server

function receiver(sck, data)
    if data then
        print("The received data is: "..data)
    end
--    sck:send("\r\nLED ON")  --Send the data to connected client
--    sck:close()             -- Will terminate rhe connection and close the socket
end

print("The modules listening on port: "..port,"and on IP: 192.168.43.13 So you can connect on these details")


if server then
  server:listen(port, function(conn)  --Server listen for the clients if client connected then it executes the function
                       print("Got A client")
--                     print("The modules listening on port: "..port1,"and on IP: "..ip1,"So you can connect on these details")
--                     print("Connection established on port:\r\n"..port)
                     conn:send("Connection established\r\n")
                     conn:on("receive", receiver)
                     
                     end)
end 

