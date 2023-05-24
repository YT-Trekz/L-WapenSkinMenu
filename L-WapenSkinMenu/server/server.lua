ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterCommand(Config.Command, function(source, args)
    local identifier = GetPlayerIdentifiers(source)[1]

    if checkperm(identifier) then
	    TriggerClientEvent('L-WapenSkinMenu:skin', source)
	else
		msg(source)
    end	
end)

function msg(player)
	TriggerClientEvent('esx:showNotification', player, _U('geen_admin'))
end

function checkperm(psteam)
	for i,v in pairs(Config.Admins) do
		if psteam == v then
			return true
		end
	end
	return false
end