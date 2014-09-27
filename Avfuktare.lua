--[[
%% autostart
%% properties
19 ui.Label1.value
%% globals
--]]
--19 value = ID of humidity sensor

--Beskrivning
--Om luftfuktighet är över 66.0%, Starta avfuktare
--Om luftfuktighet är under 64.0%, Stoppa avfuktare
        
        if fibaro:countScenes() > 1 then fibaro:abort(); end
	local humidity = fibaro:getValue(19, "ui.Label1.value")
	local humStart = "66" --Starta avfuktare om över %
	local humStopp = "64" --Stoppa avfuktaren om under %
	local avfuktare = 13 --Min Powerplug
	
		--fibaro:debug("Check of humidity, right now: "..humidity.."%.")
	if (humidity > humStart) then --Om luftfuktighet är över 66, starta avfuktare
      fibaro:call(avfuktare, "turnOn") --Starta avfuktare
		fibaro:sleep(300*1000)--Pausa i 5 minuter
	end
             
	if (humidity < humStopp) then --Om luftfuktighet är under 64, stoppa avfuktare
	fibaro:call(avfuktare, "turnOff") --Stoppa av avfuktare
		fibaro:sleep(300*1000)--Pausa i 5 minuter
	end
