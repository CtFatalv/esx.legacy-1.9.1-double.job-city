-- Anti cops // ok
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(100)
        local myCoords = GetEntityCoords(GetPlayerPed(-1))
        ClearAreaOfCops(myCoords.x, myCoords.y, myCoords.z, 100.0, 0)
		ClearAreaOfPeds(324.24, -212.12, 36.83, 28.0, 1)
		ClearAreaOfPeds(-122.2, -1469.86, 4.83, 20.0, 1)
		ClearAreaOfPeds(117.1, -1290.83, 28.26, 20.0, 1)
		ClearAreaOfPeds(157.67, -1305.53, 29.20, 2.0, 1)
		ClearAreaOfPeds(153.65, -1314.23, 29.20, 2.0, 1)
		ClearAreaOfPeds(-1906.21, 2077.55, 140.41, 2.0, 1)
		ClearAreaOfPeds(-1868.60, 2063.20, 141.23, 2.0, 1)
    end
end)