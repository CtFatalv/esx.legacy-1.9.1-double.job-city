---Will be true if the player is close to cayo perico
---@type boolean
local _isCloseToCayo = false

---Will be true if the minimap is loaded with SetToggleMinimapHeistIsland
---@type boolean
local _isCayoMinimapLoaded = false

---Checks coords to know if the player is close enough to cayo perico to be in need to load the minimap with SetToggleMinimapHeistIsland
Citizen.CreateThread(function()
    while true do
        ---Wether the player is actually close to cayo perico or not
        ---@type boolean
        local isCloseToCayo<const> = #(GetEntityCoords(PlayerPedId()) - vector3(4858.0, -5171.0, 2.0)) < 2200.0

        if _isCloseToCayo ~= isCloseToCayo then
            -- If the player is now close to cayo perico and was not, or vice versa
            -- Then we init our variables and unload the minimap
            _isCloseToCayo = isCloseToCayo
            _isCayoMinimapLoaded = isCloseToCayo

            -- switch radar interior
            SetToggleMinimapHeistIsland(_isCloseToCayo)
        end

        Wait(5000)
    end
end)

---Handle the minimap loading and unloading
CreateThread(function()
    while true do
        ---We don't need to do something every frame in every cases
        ---@type integer
        local wait = 500

        if IsPauseMenuActive() and not IsMinimapInInterior() then
            -- If the player is in the pause menu and not looking at an interior minimap
            if _isCayoMinimapLoaded then
                -- If the minimap was loaded with SetToggleMinimapHeistIsland, then we disable it
                _isCayoMinimapLoaded = false
                SetToggleMinimapHeistIsland(false)
            end
            -- We force load the cayo perico minimap
            SetRadarAsExteriorThisFrame()
            SetRadarAsInteriorThisFrame(GetHashKey("h4_fake_islandx"), 4700.0, -5145.0, 0, 0)
            wait = 0

        elseif not _isCayoMinimapLoaded and _isCloseToCayo then
            -- If the minimap is not loaded with SetToggleMinimapHeistIsland and the player is close to cayo perico, then we load it
            _isCayoMinimapLoaded = true
            SetToggleMinimapHeistIsland(true)
        end
        Wait(wait)
    end
end)

Citizen.CreateThread(function()
    while true do
		local pCoords = GetEntityCoords(GetPlayerPed(-1))		
			local distance1 = GetDistanceBetweenCoords(pCoords.x, pCoords.y, pCoords.z, 4840.571, -5174.425, 2.0, false)
			if distance1 < 2000.0 then
			Citizen.InvokeNative("0x9A9D1BA639675CF1", "HeistIsland", true)  -- load the map and removes the city
			--Citizen.InvokeNative("0x5E1460624D194A38", true) -- load the minimap/pause map and removes the city minimap/pause map
			else
			Citizen.InvokeNative("0x9A9D1BA639675CF1", "HeistIsland", false)
			--Citizen.InvokeNative("0x5E1460624D194A38", false)
			end
		Citizen.Wait(5000)
    end
end)