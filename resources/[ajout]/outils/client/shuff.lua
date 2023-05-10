-- /shuff // ok
Citizen.CreateThread(function()
	while ESX == nil do
	  TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
	  Citizen.Wait(1)
	end
  end)
  
  local disableShuffle = true
  function disableSeatShuffle(flag)
	  disableShuffle = flag
  end
  
  Citizen.CreateThread(function()
	  while true do
		  Citizen.Wait(10)
		  if IsPedInAnyVehicle(GetPlayerPed(-1), false) and disableShuffle then
			  if GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0) == GetPlayerPed(-1) then
				  if GetIsTaskActive(GetPlayerPed(-1), 165) then
					  SetPedIntoVehicle(GetPlayerPed(-1), GetVehiclePedIsIn(GetPlayerPed(-1), false), 0)
				  end
			  end
		  end
	  end
  end)