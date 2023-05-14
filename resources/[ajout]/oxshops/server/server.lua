ESX = exports['es_extended']:getSharedObject()
local swapHook, buyHook

CreateThread(function()
    while ESX == nil do Wait() end
    for k,_ in pairs(Config.Shops) do
        TriggerEvent('esx_society:registerSociety', k, k, 'society_'..k, 'society_'..k, 'society_'..k, {type = 'public'})
    end
end) 

CreateThread(function()
	while GetResourceState('ox_inventory') ~= 'started' do Wait(1000) end
	for k,v in pairs(Config.Shops) do
		local stash = {
			id = k,
			label = v.label..' '..Strings.inventory,
			slots = 50,
			weight = 100000,
		}
		exports.ox_inventory:RegisterStash(stash.id, stash.label, stash.slots, stash.weight)
		local items = exports.ox_inventory:GetInventoryItems(k, false)
		local stashItems = {}
		if items and items ~= {} then
			for k,v in pairs(items) do
				if v and v.name then
					stashItems[#stashItems + 1] = { name = v.name, metadata = v.metadata, count = v.count, price = (v.metadata.shopData.price or 0) }
				end
			end
			local x,y,z = table.unpack(v.locations.shop.coords)
			exports.ox_inventory:RegisterShop(k, {
				name = v.label,
				inventory = stashItems,
				locations = {
					vec3(x,y,z),
				}
			})
		end
	end
	swapHook = exports.ox_inventory:registerHook('swapItems', function(payload)
		for k,v in pairs(Config.Shops) do
			if payload.fromInventory == k then
				TriggerEvent('oxshops:refreshShop', k)
			elseif payload.toInventory == k and tonumber(payload.fromInventory) ~= nil then
				TriggerClientEvent('oxshops:setProductPrice', payload.fromInventory, k, payload.toSlot)
			end
		end
	end, {})

	buyHook = exports.ox_inventory:registerHook('buyItem', function(payload)
		local metadata = payload.metadata
		 if metadata?.shopData then
			 local price = metadata.shopData.price
			 local count = payload.count
			 exports.ox_inventory:RemoveItem(metadata.shopData.shop, payload.itemName, payload.count)
			 TriggerEvent('esx_addonaccount:getSharedAccount', 'society_'..metadata.shopData.shop, function(account)
			 account.addMoney(price*count)
			 end)
		 end
	 end, {})
end)

RegisterNetEvent('oxshops:refreshShop', function(shop)
	Wait(250)
	local items = exports.ox_inventory:GetInventoryItems(shop, false)
	local stashItems = {}
	for k,v in pairs(items) do
		if v and v.name then
			local metadata = v.metadata
			if metadata?.shopData then
				stashItems[#stashItems + 1] = { name = v.name, metadata = metadata, count = v.count, price = metadata.shopData.price }
			end
		end
	end
	exports.ox_inventory:RegisterShop(shop, {
		name = Config.Shops[shop].label,
		inventory = stashItems,
		locations = {
			Config.Shops[shop].locations.shop.coords,
		}
	})
end)

RegisterNetEvent('oxshops:setData', function(shop, slot, price)
	local item = exports.ox_inventory:GetSlot(shop, slot)
	if not item then return end
	local metadata = item.metadata
	metadata.shopData = {
		shop = shop,
		price = price
	}
	exports.ox_inventory:SetMetadata(shop, slot, metadata)
	TriggerEvent('oxshops:refreshShop', shop)
end)

RegisterServerEvent('oxshops:addshop01')
AddEventHandler('oxshops:addshop01', function()
  local source = source
  local xPlayer = ESX.GetPlayerFromId(source)
      xPlayer.setJob3('shop01', 1)
end)

RegisterServerEvent('oxshops:addshop02')
AddEventHandler('oxshops:addshop02', function()
  local source = source
  local xPlayer = ESX.GetPlayerFromId(source)
      xPlayer.setJob3('shop02', 1)
end)

RegisterServerEvent('oxshops:addshop03')
AddEventHandler('oxshops:addshop03', function()
  local source = source
  local xPlayer = ESX.GetPlayerFromId(source)
      xPlayer.setJob3('shop03', 1)
end)

RegisterServerEvent('oxshops:addshop04')
AddEventHandler('oxshops:addshop04', function()
  local source = source
  local xPlayer = ESX.GetPlayerFromId(source)
      xPlayer.setJob3('shop04', 1)
end)

RegisterServerEvent('oxshops:addshop05')
AddEventHandler('oxshops:addshop05', function()
  local source = source
  local xPlayer = ESX.GetPlayerFromId(source)
      xPlayer.setJob3('shop05', 1)
end)

RegisterServerEvent('oxshops:addshop06')
AddEventHandler('oxshops:addshop06', function()
  local source = source
  local xPlayer = ESX.GetPlayerFromId(source)
      xPlayer.setJob3('shop06', 1)
end)

RegisterServerEvent('oxshops:addshop07')
AddEventHandler('oxshops:addshop07', function()
  local source = source
  local xPlayer = ESX.GetPlayerFromId(source)
      xPlayer.setJob3('shop07', 1)
end)

RegisterServerEvent('oxshops:addshop08')
AddEventHandler('oxshops:addshop08', function()
  local source = source
  local xPlayer = ESX.GetPlayerFromId(source)
      xPlayer.setJob3('shop08', 1)
end)

RegisterServerEvent('oxshops:addshop09')
AddEventHandler('oxshops:addshop09', function()
  local source = source
  local xPlayer = ESX.GetPlayerFromId(source)
      xPlayer.setJob3('shop09', 1)
end)

RegisterServerEvent('oxshops:addshop10')
AddEventHandler('oxshops:addshop10', function()
  local source = source
  local xPlayer = ESX.GetPlayerFromId(source)
      xPlayer.setJob3('shop10', 1)
end)
