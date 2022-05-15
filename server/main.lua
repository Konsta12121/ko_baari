local PlayersHarvesting, PlayersHarvesting2, PlayersHarvesting3, PlayersCrafting, PlayersCrafting2, PlayersCrafting3  = {}, {}, {}, {}, {}, {}

if Config.MaxInService ~= -1 then
	TriggerEvent('esx_service:activateService', 'baari', Config.MaxInService)
end

TriggerEvent('esx_phone:registerNumber', 'baari', _U('baari_customer'), true, true)
TriggerEvent('esx_society:registerSociety', 'baari', 'baari', 'society_baari', 'society_baari', 'society_baari', {type = 'private'})

local function Harvest(source)
	SetTimeout(4000, function()

		if PlayersHarvesting[source] == true then
			local xPlayer = ESX.GetPlayerFromId(source)
			local GazBottleQuantity = xPlayer.getInventoryItem('gazbottle').count

			if GazBottleQuantity >= 5 then
				TriggerClientEvent('esx:showNotification', source, _U('you_do_not_room'))
			else
				xPlayer.addInventoryItem('gazbottle', 1)
				Harvest(source)
			end
		end

	end)
end

RegisterServerEvent('esx_baarijob:aloitakasaus')
AddEventHandler('esx_baarijob:aloitakasaus', function()
	local _source = source
	PlayersHarvesting[_source] = true
	TriggerClientEvent('esx:showNotification', _source, _U('recovery_gas_can'))
	Harvest(source)
end)

RegisterServerEvent('esx_baarijob:lopetakasaus')
AddEventHandler('esx_baarijob:lopetakasaus', function()
	local _source = source
	PlayersHarvesting[_source] = false
end)

local function Harvest2(source)
	SetTimeout(4000, function()

		if PlayersHarvesting2[source] == true then
			local xPlayer = ESX.GetPlayerFromId(source)
			local FixToolQuantity = xPlayer.getInventoryItem('fixtool').count

			if FixToolQuantity >= 5 then
				TriggerClientEvent('esx:showNotification', source, _U('you_do_not_room'))
			else
				xPlayer.addInventoryItem('fixtool', 1)
				Harvest2(source)
			end
		end

	end)
end

RegisterServerEvent('esx_baarijob:aloitakasaus2')
AddEventHandler('esx_baarijob:aloitakasaus2', function()
	local _source = source
	PlayersHarvesting2[_source] = true
	TriggerClientEvent('esx:showNotification', _source, _U('recovery_repair_tools'))
	Harvest2(_source)
end)

RegisterServerEvent('esx_baarijob:lopetakasaus2')
AddEventHandler('esx_baarijob:lopetakasaus2', function()
	local _source = source
	PlayersHarvesting2[_source] = false
end)

local function Harvest3(source)
	SetTimeout(4000, function()

		if PlayersHarvesting3[source] == true then
			local xPlayer = ESX.GetPlayerFromId(source)
			local CaroToolQuantity = xPlayer.getInventoryItem('carotool').count
			if CaroToolQuantity >= 5 then
				TriggerClientEvent('esx:showNotification', source, _U('you_do_not_room'))
			else
				xPlayer.addInventoryItem('carotool', 1)
				Harvest3(source)
			end
		end

	end)
end

RegisterServerEvent('esx_baarijob:aloitakasaus3')
AddEventHandler('esx_baarijob:aloitakasaus3', function()
	local _source = source
	PlayersHarvesting3[_source] = true
	TriggerClientEvent('esx:showNotification', _source, _U('recovery_body_tools'))
	Harvest3(_source)
end)

RegisterServerEvent('esx_baarijob:lopetakasaus3')
AddEventHandler('esx_baarijob:lopetakasaus3', function()
	local _source = source
	PlayersHarvesting3[_source] = false
end)

local function Craft(source)
	SetTimeout(4000, function()

		if PlayersCrafting[source] == true then
			local xPlayer = ESX.GetPlayerFromId(source)
			local GazBottleQuantity = xPlayer.getInventoryItem('gazbottle').count

			if GazBottleQuantity <= 0 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_gas_can'))
			else
				xPlayer.removeInventoryItem('gazbottle', 1)
				xPlayer.addInventoryItem('blowpipe', 1)
				Craft(source)
			end
		end

	end)
end

RegisterServerEvent('esx_baarijob:aloitarakennus')
AddEventHandler('esx_baarijob:aloitarakennus', function()
	local _source = source
	PlayersCrafting[_source] = true
	TriggerClientEvent('esx:showNotification', _source, _U('assembling_blowtorch'))
	Craft(_source)
end)

RegisterServerEvent('esx_baarijob:stopCraft')
AddEventHandler('esx_baarijob:stopCraft', function()
	local _source = source
	PlayersCrafting[_source] = false
end)

local function Craft2(source)
	SetTimeout(4000, function()

		if PlayersCrafting2[source] == true then
			local xPlayer = ESX.GetPlayerFromId(source)
			local FixToolQuantity = xPlayer.getInventoryItem('fixtool').count

			if FixToolQuantity <= 0 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_repair_tools'))
			else
				xPlayer.removeInventoryItem('fixtool', 1)
				xPlayer.addInventoryItem('fixkit', 1)
				Craft2(source)
			end
		end

	end)
end

RegisterServerEvent('esx_baarijob:aloitarakennus2')
AddEventHandler('esx_baarijob:aloitarakennus2', function()
	local _source = source
	PlayersCrafting2[_source] = true
	TriggerClientEvent('esx:showNotification', _source, _U('assembling_repair_kit'))
	Craft2(_source)
end)

RegisterServerEvent('esx_baarijob:stopCraft2')
AddEventHandler('esx_baarijob:stopCraft2', function()
	local _source = source
	PlayersCrafting2[_source] = false
end)

local function Craft3(source)
	SetTimeout(4000, function()

		if PlayersCrafting3[source] == true then
			local xPlayer = ESX.GetPlayerFromId(source)
			local CaroToolQuantity = xPlayer.getInventoryItem('carotool').count

			if CaroToolQuantity <= 0 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_body_tools'))
			else
				xPlayer.removeInventoryItem('carotool', 1)
				xPlayer.addInventoryItem('carokit', 1)
				Craft3(source)
			end
		end

	end)
end

RegisterServerEvent('esx_baarijob:aloitarakennus3')
AddEventHandler('esx_baarijob:aloitarakennus3', function()
	local _source = source
	PlayersCrafting3[_source] = true
	TriggerClientEvent('esx:showNotification', _source, _U('assembling_body_kit'))
	Craft3(_source)
end)

RegisterServerEvent('esx_baarijob:stopCraft3')
AddEventHandler('esx_baarijob:stopCraft3', function()
	local _source = source
	PlayersCrafting3[_source] = false
end)

RegisterServerEvent('esx_baarijob:onNPCJobMissionCompleted')
AddEventHandler('esx_baarijob:onNPCJobMissionCompleted', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local total   = math.random(Config.NPCJobEarnings.min, Config.NPCJobEarnings.max);

	if xPlayer.job.grade >= 3 then
		total = total * 2
	end

	TriggerEvent('esx_addonaccount:getSharedAccount', 'society_baari', function(account)
		account.addMoney(total)
	end)

	TriggerClientEvent("esx:showNotification", _source, _U('your_comp_earned').. total)
end)

ESX.RegisterUsableItem('blowpipe', function(source)
	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('blowpipe', 1)

	TriggerClientEvent('esx_baarijob:onHijack', _source)
	TriggerClientEvent('esx:showNotification', _source, _U('you_used_blowtorch'))
end)

ESX.RegisterUsableItem('fixkit', function(source)
	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('fixkit', 1)

	TriggerClientEvent('esx_baarijob:onFixkit', _source)
	TriggerClientEvent('esx:showNotification', _source, _U('you_used_repair_kit'))
end)

ESX.RegisterUsableItem('carokit', function(source)
	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('carokit', 1)

	TriggerClientEvent('esx_baarijob:onCarokit', _source)
	TriggerClientEvent('esx:showNotification', _source, _U('you_used_body_kit'))
end)

RegisterServerEvent('esx_baarijob:getStockItem')
AddEventHandler('esx_baarijob:getStockItem', function(itemName, count)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_baari', function(inventory)
		local item = inventory.getItem(itemName)

		-- is there enough in the society?
		if count > 0 and item.count >= count then

			-- can the player carry the said amount of x item?
			if xPlayer.canCarryItem(itemName, count) then
				inventory.removeItem(itemName, count)
				xPlayer.addInventoryItem(itemName, count)
				xPlayer.showNotification(_U('have_withdrawn', count, item.label))
			else
				xPlayer.showNotification(_U('player_cannot_hold'))
			end
		else
			xPlayer.showNotification(_U('invalid_quantity'))
		end
	end)
end)

ESX.RegisterServerCallback('esx_baarijob:getStockItems', function(source, cb)
	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_baari', function(inventory)
		cb(inventory.items)
	end)
end)

RegisterServerEvent('esx_baarijob:putStockItems')
AddEventHandler('esx_baarijob:putStockItems', function(itemName, count)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_baari', function(inventory)
		local item = inventory.getItem(itemName)
		local playerItemCount = xPlayer.getInventoryItem(itemName).count

		if item.count >= 0 and count <= playerItemCount then
			xPlayer.removeInventoryItem(itemName, count)
			inventory.addItem(itemName, count)
		else
			xPlayer.showNotification(_U('invalid_quantity'))
		end

		xPlayer.showNotification(_U('have_deposited', count, item.label))
	end)
end)

ESX.RegisterServerCallback('esx_baarijob:getPlayerInventory', function(source, cb)
	local xPlayer    = ESX.GetPlayerFromId(source)
	local items      = xPlayer.inventory

	cb({items = items})
end)
