ESX = exports['es_extended']:getSharedObject()

RegisterNetEvent('esx:playerLoaded', function(xPlayer)
    ESX.PlayerData = xPlayer
    ESX.PlayerLoaded = true
end)

RegisterNetEvent('esx:onPlayerLogout', function()
    table.wipe(ESX.PlayerData)
    ESX.PlayerLoaded = false
end)

RegisterNetEvent('esx:setJob3', function(job3)
    ESX.PlayerData.job3 = job3
end)

RegisterNetEvent('oxshops:setProductPrice')
AddEventHandler('oxshops:setProductPrice', function(shop, slot)
    local input = lib.inputDialog(Strings.sell_price, {Strings.amount_input})
    local price
    if not input then price = 0 end
    price = tonumber(input[1])
    if price < 0 then price = 0 end
    TriggerEvent('ox_inventory:closeInventory')
    TriggerServerEvent('oxshops:setData', shop, slot, math.floor(price))
    lib.notify({
        title = Strings.success,
        description = (Strings.item_stocked_desc):format(price),
        type = 'success'
    })
end)

local function createBlip(coords, sprite, color, text, scale)
    local x,y,z = table.unpack(coords)
    local blip = AddBlipForCoord(x, y, z)
    SetBlipSprite(blip, sprite)
    SetBlipDisplay(blip, 4)
    SetBlipScale(blip, scale)
    SetBlipColour(blip, color)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(text)
    EndTextCommandSetBlipName(blip)
    return blip
end

CreateThread(function()
    local textUI, points = nil, {}
    while not ESX.PlayerLoaded do Wait(1000) end
    for k,v in pairs(Config.Shops) do
        local shopLoc = v.locations.shop.coords
        if not points[k] then points[k] = {} end
        points[k].shop = lib.points.new({
            coords = v.locations.shop.coords,
            distance = v.locations.shop.range,
            shop = k
        })
    end
end)

--================================================================================================
-- SHOP 01
--================================================================================================
-- Target PNJ Achat
Citizen.CreateThread(function()
local hash = GetHashKey("a_m_m_ktown_01")
RequestModel(hash)
while not HasModelLoaded(hash) do
    Wait(1)
end

local UwU = CreatePed(4, hash,  24.35, -1347.21, 28.50, 270.05, false, true)
FreezeEntityPosition(UwU, true)
SetEntityInvincible(UwU, true)
SetBlockingOfNonTemporaryEvents(UwU, true)

local options = {
    {
        name = 'Achat',
        event = 'necro:shop01',
        icon = 'fa-solid fa-road',
        label = 'Achat',
		distance = 1.6,
    },
}label = 'Gestion',
exports.ox_target:addLocalEntity(UwU, options)
end)

AddEventHandler('necro:shop01', function()
exports.ox_inventory:openInventory('shop', { type = 'shop01', id = 1 })
end)

exports.ox_target:addBoxZone({
    coords =  vector3(29.51, -1338.75, 29.3),
    size = vec3(0.6, 0.2, 0.1),
    rotation = 355,
    debug = false,
    options = {
        {
            name = 'Gestion',
            event = 'necro:bossshop01',
            icon = 'fa-solid fa-computer',
            label = 'Gestion',
			distance = 1.5,
        }
    }
})

AddEventHandler('necro:bossshop01', function()	
    if ESX.PlayerData.job3 and ESX.PlayerData.job3.name == 'shop01' then
	TriggerEvent('esx_society:openBossMenu3', 'shop01', function(data, menu)
	end, {wash = true})
	end
end)

-- Target Inventaire Boutique
exports.ox_target:addBoxZone({
    coords = vector3(23.98, -1339.06, 29.42),
    size = vec3(2.8, 1.0, 2.0),
    rotation = 90,
    debug = false,
    options = {
        {
            name = 'Stock',
            event = 'necro:invshop01',
            icon = 'fa-solid fa-computer',
            label = 'Stock',
			distance = 2,
        }
    }
})

AddEventHandler('necro:invshop01', function()
    if ESX.PlayerData.job3 and ESX.PlayerData.job3.name == 'shop01' then
    	exports.ox_inventory:openInventory('stash', 'shop01')
    end
end)-- Target Boss Action
--================================================================================================
-- SHOP 02
--================================================================================================
-- Target PNJ Achat
Citizen.CreateThread(function()
	local hash = GetHashKey("a_m_m_ktown_01")
    RequestModel(hash)
    while not HasModelLoaded(hash) do
        Wait(1)
    end
    
    local UwU = CreatePed(4, hash, -3038.94, 584.39, 6.91, 15.95, false, true)
    FreezeEntityPosition(UwU, true)
    SetEntityInvincible(UwU, true)
    SetBlockingOfNonTemporaryEvents(UwU, true)
    
    local options = {
        {
            name = 'Achat',
            event = 'necro:shop02',
            icon = 'fa-solid fa-road',
            label = 'Achat',
            distance = 1.6,
        },
    }
    exports.ox_target:addLocalEntity(UwU, options)
    end)
    
    AddEventHandler('necro:shop02', function()
    exports.ox_inventory:openInventory('shop', { type = 'shop02', id = 1 })
    end)
    
    exports.ox_target:addBoxZone({
        coords =  vector3(-3048.67, 586.73, 7.71),
    	size = vec3(0.6, 0.2, 0.1),
        rotation = 103,
        debug = false,
        options = {
            {
                name = 'Gestion',
                event = 'necro:bossshop02',
                icon = 'fa-solid fa-computer',
                label = 'Gestion',
                distance = 1.5,
            }
        }
    })
    
    AddEventHandler('necro:bossshop02', function()	
        if ESX.PlayerData.job3 and ESX.PlayerData.job3.name == 'shop02' then
        TriggerEvent('esx_society:openBossMenu3', 'shop02', function(data, menu)
        end, {wash = false})
        end
    end)
    
    -- Target Inventaire Boutique
    exports.ox_target:addBoxZone({
        coords = vector3(-3046.0, 582.0, 7.91),
    	size = vec3(2.0, 0.5, 2.0),
        rotation = 18,
        debug = false,
        options = {
            {
                name = 'Stock',
                event = 'necro:invshop02',
                icon = 'fa-solid fa-computer',
                label = 'Stock',
                distance = 2,
            }
        }
    })
    
    AddEventHandler('necro:invshop02', function()
        if ESX.PlayerData.job3 and ESX.PlayerData.job3.name == 'shop02' then
            exports.ox_inventory:openInventory('stash', 'shop02')
        end
    end)-- Target Boss Action
--================================================================================================
-- SHOP 03
--================================================================================================
-- Target PNJ Achat
Citizen.CreateThread(function()
    local hash = GetHashKey("a_m_m_ktown_01")
    RequestModel(hash)
    while not HasModelLoaded(hash) do
        Wait(1)
    end
    
    local UwU = CreatePed(4, hash, -3242.31, 999.92, 11.83, 349.88, false, true)
    FreezeEntityPosition(UwU, true)
    SetEntityInvincible(UwU, true)
    SetBlockingOfNonTemporaryEvents(UwU, true)
    
    local options = {
        {
            name = 'Achat',
            event = 'necro:shop03',
            icon = 'fa-solid fa-road',
            label = 'Achat',
            distance = 1.6,
        },
    }
    exports.ox_target:addLocalEntity(UwU, options)
    end)
    
    AddEventHandler('necro:shop03', function()
    exports.ox_inventory:openInventory('shop', { type = 'shop03', id = 1 })
    end)
    
    exports.ox_target:addBoxZone({
        coords =  vector3(-3250.37, 1005.73, 12.63),
    	size = vec3(0.6, 0.2, 0.1),
        rotation = 260,
        debug = false,
        options = {
            {
                name = 'Gestion',
                event = 'necro:bossshop03',
                icon = 'fa-solid fa-computer',
                label = 'Gestion',
                distance = 1.5,
            }
        }
    })
    
    AddEventHandler('necro:bossshop03', function()	
        if ESX.PlayerData.job3 and ESX.PlayerData.job3.name == 'shop03' then
        TriggerEvent('esx_society:openBossMenu3', 'shop03', function(data, menu)
        end, {wash = false})
        end
    end)
    
    -- Target Inventaire Boutique
    exports.ox_target:addBoxZone({
        coords = vector3(-3250.05, 999.85, 12.83),
    	size = vec3(1.5, 2.8, 2.0),
        rotation = 265,
        debug = false,
        options = {
            {
                name = 'Stock',
                event = 'necro:invshop03',
                icon = 'fa-solid fa-computer',
                label = 'Stock',
                distance = 2,
            }
        }
    })
    
    AddEventHandler('necro:invshop03', function()
        if ESX.PlayerData.job3 and ESX.PlayerData.job3.name == 'shop03' then
            exports.ox_inventory:openInventory('stash', 'shop03')
        end
    end)-- Target Boss Action
--================================================================================================
-- SHOP 04
--================================================================================================
-- Target PNJ Achat
Citizen.CreateThread(function()
    local hash = GetHashKey("a_m_m_ktown_01")
    RequestModel(hash)
    while not HasModelLoaded(hash) do
        Wait(1)
    end
    
    local UwU = CreatePed(4, hash, 1727.73, 6415.31, 34.04, 239.98, false, true)
    FreezeEntityPosition(UwU, true)
    SetEntityInvincible(UwU, true)
    SetBlockingOfNonTemporaryEvents(UwU, true)
    
    local options = {
        {
            name = 'Achat',
            event = 'necro:shop04',
            icon = 'fa-solid fa-road',
            label = 'Achat',
            distance = 1.6,
        },
    }
    exports.ox_target:addLocalEntity(UwU, options)
    end)
    
    AddEventHandler('necro:shop04', function()
    exports.ox_inventory:openInventory('shop', { type = 'shop04', id = 1 })
    end)
    
    exports.ox_target:addBoxZone({
        coords =  vector3(1736.18, 6420.66, 34.84),
        size = vec3(0.2, 0.5, 0.1),
        rotation = 239,
        debug = false,
        options = {
            {
                name = 'Gestion',
                event = 'necro:bossshop04',
                icon = 'fa-solid fa-computer',
                label = 'Gestion',
                distance = 1.5,
            }
        }
    })
    
    AddEventHandler('necro:bossshop04', function()	
        if ESX.PlayerData.job3 and ESX.PlayerData.job3.name == 'shop04' then
        TriggerEvent('esx_society:openBossMenu3', 'shop04', function(data, menu)
        end, {wash = false})
        end
    end)
    
    -- Target Inventaire Boutique
    exports.ox_target:addBoxZone({
        coords =  vector3(1730.85, 6422.5, 35.04),
    	size = vec3(3.0, 1.0, 2.0),
        rotation = 244,
        debug = false,
        options = {
            {
                name = 'Stock',
                event = 'necro:invshop04',
                icon = 'fa-solid fa-computer',
                label = 'Stock',
                distance = 2,
            }
        }
    })
    
    AddEventHandler('necro:invshop04', function()
        if ESX.PlayerData.job3 and ESX.PlayerData.job3.name == 'shop04' then
            exports.ox_inventory:openInventory('stash', 'shop04')
        end
    end)-- Target Boss Action
--================================================================================================
-- SHOP 05
--================================================================================================
-- Target PNJ Achat
Citizen.CreateThread(function()
    local hash = GetHashKey("a_m_m_ktown_01")
    RequestModel(hash)
    while not HasModelLoaded(hash) do
        Wait(1)
    end
    
    local UwU = CreatePed(4, hash, 1698.05, 4922.76, 41.06, 328.54, false, true)
    FreezeEntityPosition(UwU, true)
    SetEntityInvincible(UwU, true)
    SetBlockingOfNonTemporaryEvents(UwU, true)
    
    local options = {
        {
            name = 'Achat',
            event = 'necro:shop05',
            icon = 'fa-solid fa-road',
            label = 'Achat',
            distance = 1.6,
        },
    }
    exports.ox_target:addLocalEntity(UwU, options)
    end)
    
    AddEventHandler('necro:shop05', function()
    exports.ox_inventory:openInventory('shop', { type = 'shop05', id = 1 })
    end)
    
    exports.ox_target:addBoxZone({
        coords =  vector3(1707.17, 4921.6, 41.86),
        size = vec3(0.2, 0.5, 0.1),
        rotation = 230,
        debug = false,
        options = {
            {
                name = 'Gestion',
                event = 'necro:bossshop05',
                icon = 'fa-solid fa-computer',
                label = 'Gestion',
                distance = 1.5,
            }
        }
    })
    
    AddEventHandler('necro:bossshop05', function()	
        if ESX.PlayerData.job3 and ESX.PlayerData.job3.name == 'shop05' then
        TriggerEvent('esx_society:openBossMenu3', 'shop05', function(data, menu)
        end, {wash = false})
        end
    end)
    
    -- Target Inventaire Boutique
    exports.ox_target:addBoxZone({
        coords =  vector3(1699.68, 4920.21, 41.56),
    	size = vec3(0.6, 1.8, 1.0),
        rotation = 235,
        debug = false,
        options = {
            {
                name = 'Stock',
                event = 'necro:invshop05',
                icon = 'fa-solid fa-computer',
                label = 'Stock',
                distance = 2,
            }
        }
    })
    
    AddEventHandler('necro:invshop05', function()
        if ESX.PlayerData.job3 and ESX.PlayerData.job3.name == 'shop05' then
            exports.ox_inventory:openInventory('stash', 'shop05')
        end
    end)-- Target Boss Action
--================================================================================================
-- SHOP 06
--================================================================================================
-- Target PNJ Achat
Citizen.CreateThread(function()
    local hash = GetHashKey("a_m_m_ktown_01")
    RequestModel(hash)
    while not HasModelLoaded(hash) do
        Wait(1)
    end
 
    local UwU = CreatePed(4, hash, 1959.99, 3739.98, 31.34, 298.49, false, true)
    FreezeEntityPosition(UwU, true)
    SetEntityInvincible(UwU, true)
    SetBlockingOfNonTemporaryEvents(UwU, true)
    
    local options = {
        {
            name = 'Achat',
            event = 'necro:shop06',
            icon = 'fa-solid fa-road',
            label = 'Achat',
            distance = 1.6,
        },
    }
    exports.ox_target:addLocalEntity(UwU, options)
    end)
    
    AddEventHandler('necro:shop06', function()
    exports.ox_inventory:openInventory('shop', { type = 'shop06', id = 1 })
    end)
    
    exports.ox_target:addBoxZone({
        coords =  vector3(1960.16, 3749.95, 32.14),
        size = vec3(0.2, 0.5, 0.1),
        rotation = 115,
        debug = false,
        options = {
            {
                name = 'Gestion',
                event = 'necro:bossshop06',
                icon = 'fa-solid fa-computer',
                label = 'Gestion',
                distance = 1.5,
            }
        }
    })
    
    AddEventHandler('necro:bossshop06', function()	
        if ESX.PlayerData.job3 and ESX.PlayerData.job3.name == 'shop06' then
        TriggerEvent('esx_society:openBossMenu3', 'shop06', function(data, menu)
        end, {wash = false})
        end
    end)
    
    -- Target Inventaire Boutique
    exports.ox_target:addBoxZone({
        coords =  vector3(1955.77, 3746.36, 32.34),
    	size = vec3(2.0, 1.0, 2.0),
        rotation = 120,
        debug = false,
        options = {
            {
                name = 'Stock',
                event = 'necro:invshop06',
                icon = 'fa-solid fa-computer',
                label = 'Stock',
                distance = 2,
            }
        }
    })
    
    AddEventHandler('necro:invshop06', function()
        if ESX.PlayerData.job3 and ESX.PlayerData.job3.name == 'shop06' then
            exports.ox_inventory:openInventory('stash', 'shop06')
        end
    end)-- Target Boss Action
--================================================================================================
-- SHOP 07
--================================================================================================
-- Target PNJ Achat
Citizen.CreateThread(function()
    local hash = GetHashKey("a_m_m_ktown_01")
    RequestModel(hash)
    while not HasModelLoaded(hash) do
        Wait(1)
    end
    
    local UwU = CreatePed(4, hash,  549.09, 2671.31, 41.16, 95.84, false, true)
    FreezeEntityPosition(UwU, true)
    SetEntityInvincible(UwU, true)
    SetBlockingOfNonTemporaryEvents(UwU, true)
    
    local options = {
        {
            name = 'Achat',
            event = 'necro:shop07',
            icon = 'fa-solid fa-road',
            label = 'Achat',
            distance = 1.6,
        },
    }
    exports.ox_target:addLocalEntity(UwU, options)
    end)
    
    AddEventHandler('necro:shop07', function()
    exports.ox_inventory:openInventory('shop', { type = 'shop07', id = 1 })
    end)
    
    exports.ox_target:addBoxZone({
        coords =  vector3(545.19, 2662.19, 41.96),
        size = vec3(0.2, 0.5, 0.1),
        rotation = 93,
        debug = false,
        options = {
            {
                name = 'Gestion',
                event = 'necro:bossshop07',
                icon = 'fa-solid fa-computer',
                label = 'Gestion',
                distance = 1.5,
            }
        }
    })
    
    AddEventHandler('necro:bossshop07', function()	
        if ESX.PlayerData.job3 and ESX.PlayerData.job3.name == 'shop07' then
        TriggerEvent('esx_society:openBossMenu3', 'shop07', function(data, menu)
        end, {wash = false})
        end
    end)
    
    -- Target Inventaire Boutique
    exports.ox_target:addBoxZone({
        coords =  vector3(550.8, 2663.86, 42.16),
    	size = vec3(2.8, 2.0, 2.0),
        rotation = 85,
        debug = false,
        options = {
            {
                name = 'Stock',
                event = 'necro:invshop07',
                icon = 'fa-solid fa-computer',
                label = 'Stock',
                distance = 2,
            }
        }
    })
    
    AddEventHandler('necro:invshop07', function()
        if ESX.PlayerData.job3 and ESX.PlayerData.job3.name == 'shop07' then
            exports.ox_inventory:openInventory('stash', 'shop07')
        end
    end)-- Target Boss Action
--================================================================================================
-- SHOP 08
--================================================================================================
-- Target PNJ Achat
Citizen.CreateThread(function()
    local hash = GetHashKey("a_m_m_ktown_01")
    RequestModel(hash)
    while not HasModelLoaded(hash) do
        Wait(1)
    end
    
    local UwU = CreatePed(4, hash, 2677.96, 3279.27, 54.24, 320.88, false, true)
    FreezeEntityPosition(UwU, true)
    SetEntityInvincible(UwU, true)
    SetBlockingOfNonTemporaryEvents(UwU, true)
    
    local options = {
        {
            name = 'Achat',
            event = 'necro:shop08',
            icon = 'fa-solid fa-road',
            label = 'Achat',
            distance = 1.6,
        },
    }
    exports.ox_target:addLocalEntity(UwU, options)
    end)
    
    AddEventHandler('necro:shop08', function()
    exports.ox_inventory:openInventory('shop', { type = 'shop08', id = 1 })
    end)
    
    exports.ox_target:addBoxZone({
        coords =  vector3(2673.01, 3287.98, 55.04),
        size = vec3(0.2, 0.5, 0.1),
        rotation = 146,
        debug = false,
        options = {
            {
                name = 'Gestion',
                event = 'necro:bossshop08',
                icon = 'fa-solid fa-computer',
                label = 'Gestion',
                distance = 1.5,
            }
        }
    })
    
    AddEventHandler('necro:bossshop08', function()	
        if ESX.PlayerData.job3 and ESX.PlayerData.job3.name == 'shop08' then
        TriggerEvent('esx_society:openBossMenu3', 'shop08', function(data, menu)
        end, {wash = false})
        end
    end)
    
    -- Target Inventaire Boutique
    exports.ox_target:addBoxZone({
        coords =  vector3(2670.9, 3281.94, 55.24),
    	size = vec3(2.4, 3.0, 2.0),
        rotation = 240,
        debug = false,
        options = {
            {
                name = 'Stock',
                event = 'necro:invshop08',
                icon = 'fa-solid fa-computer',
                label = 'Stock',
                distance = 2,
            }
        }
    })
    
    AddEventHandler('necro:invshop08', function()
        if ESX.PlayerData.job3 and ESX.PlayerData.job3.name == 'shop08' then
            exports.ox_inventory:openInventory('stash', 'shop08')
        end
    end)-- Target Boss Action
--================================================================================================
-- SHOP 09
--================================================================================================
-- Target PNJ Achat
Citizen.CreateThread(function()
    local hash = GetHashKey("a_m_m_ktown_01")
    RequestModel(hash)
    while not HasModelLoaded(hash) do
        Wait(1)
    end
    
    local UwU = CreatePed(4, hash, 2557.19, 380.57, 107.62, 354.56, false, true)
    FreezeEntityPosition(UwU, true)
    SetEntityInvincible(UwU, true)
    SetBlockingOfNonTemporaryEvents(UwU, true)
    
    local options = {
        {
            name = 'Achat',
            event = 'necro:shop09',
            icon = 'fa-solid fa-road',
            label = 'Achat',
            distance = 1.6,
        },
    }
    exports.ox_target:addLocalEntity(UwU, options)
    end)
    
    AddEventHandler('necro:shop09', function()
    exports.ox_inventory:openInventory('shop', { type = 'shop09', id = 1 })
    end)
    
    exports.ox_target:addBoxZone({
        coords =  vector3(2548.84, 386.18, 108.42),
        size = vec3(0.2, 0.5, 0.1),
        rotation = 353,
        debug = false,
        options = {
            {
                name = 'Gestion',
                event = 'necro:bossshop09',
                icon = 'fa-solid fa-computer',
                label = 'Gestion',
                distance = 1.5,
            }
        }
    })
    
    AddEventHandler('necro:bossshop09', function()	
        if ESX.PlayerData.job3 and ESX.PlayerData.job3.name == 'shop09' then
        TriggerEvent('esx_society:openBossMenu3', 'shop09', function(data, menu)
        end, {wash = false})
        end
    end)
    
    -- Target Inventaire Boutique
    exports.ox_target:addBoxZone({
        coords =  vector3(2549.48, 379.72, 108.62),
    	size = vec3(2.6, 3.0, 2.0),
        rotation = 359,
        debug = false,
        options = {
            {
                name = 'Stock',
                event = 'necro:invshop09',
                icon = 'fa-solid fa-computer',
                label = 'Stock',
                distance = 2,
            }
        }
    })
    
    AddEventHandler('necro:invshop09', function()
        if ESX.PlayerData.job3 and ESX.PlayerData.job3.name == 'shop09' then
            exports.ox_inventory:openInventory('stash', 'shop09')
        end
    end)-- Target Boss Action
--================================================================================================
-- SHOP 10
--================================================================================================
-- Target PNJ Achat
Citizen.CreateThread(function()
    local hash = GetHashKey("a_m_m_ktown_01")
    RequestModel(hash)
    while not HasModelLoaded(hash) do
        Wait(1)
    end
    
    local UwU = CreatePed(4, hash, 372.29, 326.47, 102.57, 253.44, false, true)
    FreezeEntityPosition(UwU, true)
    SetEntityInvincible(UwU, true)
    SetBlockingOfNonTemporaryEvents(UwU, true)
    
    local options = {
        {
            name = 'Achat',
            event = 'necro:shop10',
            icon = 'fa-solid fa-road',
            label = 'Achat',
            distance = 1.6,
        },
    }
    exports.ox_target:addLocalEntity(UwU, options)
    end)
    
    AddEventHandler('necro:shop10', function()
    exports.ox_inventory:openInventory('shop', { type = 'shop10', id = 1 })
    end)
    
    exports.ox_target:addBoxZone({
        coords =  vector3(379.54, 333.5, 103.37),
        size = vec3(0.2, 0.5, 0.1),
        rotation = 251,
        debug = false,
        options = {
            {
                name = 'Gestion',
                event = 'necro:bossshop10',
                icon = 'fa-solid fa-computer',
                label = 'Gestion',
                distance = 1.5,
            }
        }
    })
    
    AddEventHandler('necro:bossshop10', function()	
        if ESX.PlayerData.job3 and ESX.PlayerData.job3.name == 'shop10' then
        TriggerEvent('esx_society:openBossMenu3', 'shop10', function(data, menu)
        end, {wash = false})
        end
    end)
    
    -- Target Inventaire Boutique
    exports.ox_target:addBoxZone({
        coords =  vector3(373.7, 333.98, 103.57),
    	size = vec3(2.8, 1.4, 2.0),
        rotation = 256,
        debug = false,
        options = {
            {
                name = 'Stock',
                event = 'necro:invshop10',
                icon = 'fa-solid fa-computer',
                label = 'Stock',
                distance = 2,
            }
        }
    })
    
    AddEventHandler('necro:invshop10', function()
        if ESX.PlayerData.job3 and ESX.PlayerData.job3.name == 'shop10' then
            exports.ox_inventory:openInventory('stash', 'shop10')
        end
    end)-- Target Boss Action