do
  -- use pin 1 as the input pulse width counter
  local pin, pulse1, du, now, trig = 1, 0, 0, tmr.now, gpio.trig
  gpio.mode(pin,gpio.INT)
  local function pin1cb(level, pulse2)
    print( level, pulse2 - pulse1 )
    pulse1 = pulse2
    trig(pin, level == gpio.HIGH  and "down" or "up")
  end
  trig(pin, "down", pin1cb)
end

--[[
local pin=1
count=0
i=0 
gpio.mode(pin,gpio.INT)

 
local function fun()
  count=count+1
--  if ((count/80) == 0) then
    print(i)
--    i=i+1
--  end
end

gpio.trig(pin,"up",fun)
]]