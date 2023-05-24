ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
	ESX.PlayerLoaded = true
end)

RegisterNetEvent('esx:onPlayerLogout')
AddEventHandler('esx:onPlayerLogout', function()
	ESX.PlayerLoaded = false
	ESX.PlayerData = {}
end)

RegisterNetEvent('L-WapenSkinMenu:skin')
AddEventHandler('L-WapenSkinMenu:skin', function(source)
    GunMenu(source)
end)

function GunMenu(source)
	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'weapon_color', {
		title = _U('gun_menu'),
		align = Config.MenuAlign,
		elements = {
			{label = _U('black_coler'),  value = 0 },
			{label = _U('green_coler'),  value = 1 },
	    	{label = _U('gold_coler'), 	 value = 2 },
	    	{label = _U('pink_coler'), 	 value = 3 },
	    	{label = _U('bronze_coler'), value = 4 },
	    	{label = _U('blue_coler'), 	 value = 5 },
	    	{label = _U('orange_coler'), value = 6 },
	    	{label = _U('silder_coler'), value = 7 }
		}
	}, function(data, menu)
      	if data.current.value then
			TriggerEvent('L-WapenSkinMenu:kleur', data.current.value)
        	menu.close()
		end
	end, function(data, menu)
		menu.close()
	end)
end

RegisterNetEvent('L-WapenSkinMenu:kleur')
AddEventHandler('L-WapenSkinMenu:kleur', function(resultaat)
  local speler 	= GetPlayerPed(-1)
  local pistool = GetSelectedPedWeapon(speler)
	SetPedWeaponTintIndex(speler, pistool, resultaat)
end)