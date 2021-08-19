ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
ESX.RegisterServerCallback('sove:item', function(source, cb, item)
	local xPlayer = ESX.GetPlayerFromId(source)
	local qtty = xPlayer.getInventoryItem(item).count
	cb(qtty)
end)
function getIdentity(source)

	local result = MySQL.Sync.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {['@identifier'] = source})
	if result[1] ~= nil then
		local identity = result[1]

		return {
			identifier = identity['identifier'],
			firstname = identity['firstname'],
			lastname = identity['lastname'],
			dateofbirth = identity['dateofbirth'],
			sex = identity['sex'],
			height = identity['height']
			
		}
	else
		return nil
	end
end

Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(1000)
	local xPlayers = ESX.GetPlayers()

	for i=1, #xPlayers, 255 do
 		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
         if xPlayer.getInventoryItem('bodycam').count >= 1 then 
            local name = getIdentity(xPlayer.identifier)
			local prace = "ERROR"
			if (xPlayer.job.grade_label == "Recrut") then
				prace = "KADET"
				TriggerClientEvent('gdx_bodycam:show', xPlayers[i],' ' ..name.firstname  .. ' ' .. name.lastname, '' .. '['.. prace..']')
			elseif (xPlayer.job.grade_label == "Police Officer I") then
				prace = "PO I"
				TriggerClientEvent('gdx_bodycam:show', xPlayers[i],' ' ..name.firstname  .. ' ' .. name.lastname, '' .. '['.. prace..']')
			elseif (xPlayer.job.grade_label == "Police Officer II") then
				prace = "PO II"
				TriggerClientEvent('gdx_bodycam:show', xPlayers[i],' ' ..name.firstname  .. ' ' .. name.lastname, '' .. '['.. prace..']')
			elseif (xPlayer.job.grade_label == "Police Officer III") then
				prace = "PO III"
				TriggerClientEvent('gdx_bodycam:show', xPlayers[i],' ' ..name.firstname  .. ' ' .. name.lastname, '' .. '['.. prace..']')
			elseif (xPlayer.job.grade_label == "Police Sergeant I") then
				prace = "SERG I"
				TriggerClientEvent('gdx_bodycam:show', xPlayers[i],' ' ..name.firstname  .. ' ' .. name.lastname, '' .. '['.. prace..']')
			elseif (xPlayer.job.grade_label == "Police Sergeant II") then
				prace = "SERG II"
				TriggerClientEvent('gdx_bodycam:show', xPlayers[i],' ' ..name.firstname  .. ' ' .. name.lastname, '' .. '['.. prace..']')
			elseif (xPlayer.job.grade_label == "Police Lieutenant I") then
				prace = "LIET I"
				TriggerClientEvent('gdx_bodycam:show', xPlayers[i],' ' ..name.firstname  .. ' ' .. name.lastname, '' .. '['.. prace..']')
			elseif (xPlayer.job.grade_label == "Police Lieutenant II") then
				prace = "LIET II"
				TriggerClientEvent('gdx_bodycam:show', xPlayers[i],' ' ..name.firstname  .. ' ' .. name.lastname, '' .. '['.. prace..']')
			elseif (xPlayer.job.grade_label == "Police Captain") then
				prace = "CAPT"
				TriggerClientEvent('gdx_bodycam:show', xPlayers[i],' ' ..name.firstname  .. ' ' .. name.lastname, '' .. '['.. prace..']')
			elseif (xPlayer.job.grade_label == "Deputy Sheriff") then
				prace = "DEPT"
				TriggerClientEvent('gdx_bodycam:show', xPlayers[i],' ' ..name.firstname  .. ' ' .. name.lastname, '' .. '['.. prace..']')
			elseif (xPlayer.job.grade_label == "Commander") then
				prace = "COM"
				TriggerClientEvent('gdx_bodycam:show', xPlayers[i],' ' ..name.firstname  .. ' ' .. name.lastname, '' .. '['.. prace..']')
			elseif (xPlayer.job.grade_label == "Under Sheriff") then
				prace = "UND"
				TriggerClientEvent('gdx_bodycam:show', xPlayers[i],' ' ..name.firstname  .. ' ' .. name.lastname, '' .. '['.. prace..']')
			elseif (xPlayer.job.grade_label == "Sheriff") then
				prace = "SHRF"
				TriggerClientEvent('gdx_bodycam:show', xPlayers[i],' ' ..name.firstname  .. ' ' .. name.lastname, '' .. '['.. prace..']')
			elseif (xPlayer.job.grade_label == "Detective") then
				prace = "DET"
				TriggerClientEvent('gdx_bodycam:show', xPlayers[i],' ' ..name.firstname  .. ' ' .. name.lastname, '' .. '['.. prace..']')
			elseif (xPlayer.job.grade_label == "SWAT") then
				prace = "SWAT"
				TriggerClientEvent('gdx_bodycam:show', xPlayers[i],' ' ..name.firstname  .. ' ' .. name.lastname, '' .. '['.. prace..']')
			elseif (xPlayer.job.grade_label == "Police Deputy Chief") then
				prace = "DEPT"
				TriggerClientEvent('gdx_bodycam:show', xPlayers[i],' ' ..name.firstname  .. ' ' .. name.lastname, '' .. '['.. prace..']')
			elseif (xPlayer.job.grade_label == "Assistant Chief of Police") then
				prace = "ASSIS"
				TriggerClientEvent('gdx_bodycam:show', xPlayers[i],' ' ..name.firstname  .. ' ' .. name.lastname, '' .. '['.. prace..']')
			elseif (xPlayer.job.grade_label == "Chief of Police") then
				prace = "CHIEF"
				TriggerClientEvent('gdx_bodycam:show', xPlayers[i],' ' ..name.firstname  .. ' ' .. name.lastname, '' .. '['.. prace..']')
			end
		 else
			TriggerClientEvent('gdx_bodycam:close', xPlayers[i])
		end
	end
end
end)

AddEventHandler('esx:onRemoveInventoryItem', function(source, item, count)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	if item.name == 'bodycam' and item.count <= 0 then
	   TriggerClientEvent('gdx_bodycam:close', source)
	end
end)

ESX.RegisterUsableItem('bodycam', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('gdx_bodycam:bodycam', source)
end)