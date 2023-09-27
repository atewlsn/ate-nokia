local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem('nokia_phone', function(source)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player then
        TriggerClientEvent('ate-nokia:usePhone', source)
    end
end)
