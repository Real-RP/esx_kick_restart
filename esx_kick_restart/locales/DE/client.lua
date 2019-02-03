-- CONFIGURATION--

-- this will kick players after they do a while nothing (in seconds)
secondsUntilKick = 1 --leave on 1 second to make a fast restart.

--Do not edit if you do not know what you do--
--											--
	--			 Decoration <3			--
		--							--
			--					--
				--			--
					--	--
					
	local allowedToUse = false
	Citizen.CreateThread(function()
		TriggerServerEvent("kick_restart.getIsAllowed")
	end)

	RegisterNetEvent("kick_restart.returnIsAllowed")
	AddEventHandler("kick_restart.returnIsAllowed", function(isAllowed)
		allowedToUse = isAllowed
	end)
					
Citizen.CreateThread(function()
	while true do
		Wait(1000)

		playerPed = GetPlayerPed(-1)
		if playerPed then
			currentPos = GetEntityCoords(playerPed, true)

			if currentPos == prevPos then
				if time > 0 then
					if kickWarning and time == math.ceil(secondsUntilKick / 4) then
						TriggerEvent("chatMessage", "Warnung", {255, 0, 0}, "^1Du wirst gekickt in " .. time .. " Sekunden für einen sauberen Neustart des Servers!")
					end

					time = time - 1
				
				else
					TriggerServerEvent("kickall")
				end
			else
				time = secondsUntilKick
			end

			prevPos = currentPos
		end
	end
end)