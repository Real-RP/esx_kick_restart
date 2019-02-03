	function getIdentity(source)
		local identifier = GetPlayerIdentifiers(source)[1]
		local result = MySQL.Sync.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {['@identifier'] = identifier})
		if result[1] ~= nil then
			local identity = result[1]
			
		return {
			identifier = identity['identifier'],
			group = identity['group']
		}
	else
		return nil
	end
end				

		RegisterCommand("kickall", function()
		RegisterServerEvent("kickall")
			AddEventHandler("kickall", function()
				local grupos = getIdentity(source)
			if grupos.group ~= 'user' then
				DropPlayer(source, "Alle Roleplay Situationen wurden automatisch beendet. Dein Fortschritt wurde gespeichert. Grund: Server Neustart")
			else
			    return nil
			end
			end)
		end)
				--Error Message if wrong resource name got used
if GetCurrentResourceName() ~= "esx_kick_restart" then
	print("                                             #")
	print("                                             ###")
	print("###### ###### ###### ###### ######  ##############")
	print("#      #    # #    # #    # #    #  ################    benenne '" .. GetCurrentResourceName() .. "' wieder um zu 'esx_kick_restart'")
	print("###    ###### ###### #    # ######  ##################  ansonsten")
	print("#      # ##   # ##   #    # # ##    ################    werden einige Funktionen möglicherweise nicht funktionieren!")
	print("###### #   ## #   ## ###### #   ##  ##############")
	print("                                             ###")
	print("                                             #")
end

				--TriggerServerEvent("kickall") <<<this is what get's executed in client.lua