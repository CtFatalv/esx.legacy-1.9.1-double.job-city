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
  
  RegisterNetEvent("SeatShuffle")
  AddEventHandler("SeatShuffle", function()
	  if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
		  disableSeatShuffle(false)
		  Citizen.Wait(5000)
		  disableSeatShuffle(true)
	  else
		  CancelEvent()
	  end
  end)
  
  RegisterCommand("shuff", function(source, args, raw) --change command here
	  TriggerEvent("SeatShuffle")
  end, false) --False, allow everyone to run it
  
  -- touche w // resource_manifest_version '77731fab-63ca-442c-a67b-abc70f28dfa5' -- test
  local isRadarExtended = false
  
  Citizen.CreateThread(function()
	  while true do
		  Wait( 1 )
		  -- extend minimap on keypress
		  if IsControlJustPressed( 0, 20 ) then
			  if not isRadarExtended then
				  SetRadarBigmapEnabled( true, false )
				  isRadarExtended = true
				  Citizen.CreateThread(function()
					  run = true
					  while run do
						  for i = 0, 500 do
							  Wait(1)
							  if not isRadarExtended then
								  run = false
								  break
							  end
						  end
						  SetRadarBigmapEnabled( false, false )
						  isRadarExtended = false
					  end
				  end)
			  else
				  SetRadarBigmapEnabled( false, false )
				  isRadarExtended = false
			  end
		  end
	  end
  end)