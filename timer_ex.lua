

tim=tmr.create()
local i=

tim:register(3000,tmr.ALARM_AUTO,function(tim)
                                 print(i)
                                 i=i+1
                                 end)
tim:start()




--[[
--Alarm example
tim:alarm(2000,tmr.ALARM_AUTO,function(tim)
                              print(i)
                              i=i+1
                              end)
]]
