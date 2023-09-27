local QBCore = exports['qb-core']:GetCoreObject()

RegisterNUICallback('close', function(data, cb)
    SetNuiFocus(false, false)
end)

RegisterNUICallback('donts', function(data, cb)
    QBCore.Functions.Notify('Yanlış Numara', "error")
end)

RegisterNUICallback('primary', function(data, cb)
    QBCore.Functions.Notify('Doğru Numara', "primary")
end)

RegisterNUICallback('get-callback', function(data, cb)
    SetNuiFocus(false, false)
    local passData = Config.Passwords[data.inputPass]
    if passData then
        if passData.isClient then
            TriggerEvent(passData.event, source)
        else
            TriggerServerEvent(passData.event, source)
        end
        cb({status = true})
    else
        cb({status = false})
    end
end)

RegisterNetEvent('eventNameFor1234', function()
print('atebabaa')
end)

function PasswordInput(data, callback)
    Callbackk = callback
    SetNuiFocus(true, true)
    SendNUIMessage({
        type = "open",
        data = data
    })
end

RegisterNetEvent('ate-nokia:usePhone')
AddEventHandler('ate-nokia:usePhone', function()
    SetNuiFocus(true, true)
    SendNUIMessage({
        type = "open",
        data = data -- Not: "data" değişkenini daha önceden tanımlamış olmanız gerekiyor, ya da doğrudan kullanmak istediğiniz değerleri burada tanımlayabilirsiniz.
    })
end)




exports('PasswordInput', PasswordInput)