
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
			_source = source
				local grupos = getIdentity(source)
			if grupos.group ~= 'user' then
				DropPlayer(_source, 'All Roleplay situations ended automatically. Your progress has been saved. Reason: Server restart')		
			end
		end)
	end)

RegisterCommand("closeconnect", function()
			RegisterServerEvent("playerConnecting")
	AddEventHandler("playerConnecting", function()
	_source = source
		local grupos = getIdentity(source)
	if grupos.group ~= 'user' then
		SetGameType("SERVER CURRENTLY RESTARTING")
		DropPlayer(_source, 'Kick Reason: the server is currently restarting. please retry in a few minutes.') --message will work soon
		
			end
		end)
	end)

				
				
				
				--AddEventHandler("playerConnecting", function()
				--DropPlayer(_source, 'Kick Reason: the server is currently restarting. please retry in a few minutes.') --message will work soon
				--Error Message if wrong resource name got used
if GetCurrentResourceName() ~= "esx_kick_restart" then
	print("                                             #")
	print("                                             ###")
	print("###### ###### ###### ###### ######  ##############")
	print("#      #    # #    # #    # #    #  ################    Rename '" .. GetCurrentResourceName() .. "' back to 'esx_kick_restart'")
	print("###    ###### ###### #    # ######  ##################  otherwise")
	print("#      # ##   # ##   #    # # ##    ################    the Ressource will not work with some features!")
	print("###### #   ## #   ## ###### #   ##  ##############")
	print("                                             ###")
	print("                                             #")
end

				--TriggerServerEvent("kickall") <<<this is what get's executed in client.lua