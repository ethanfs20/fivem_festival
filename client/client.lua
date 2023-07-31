local customEmitters = {}
local ui = false;

function CreateCustomEmitter(emitterCoords, heading, emitterName)
    local modelHash = GetHashKey("stt_prop_speakerstack_01a")
    RequestModel(modelHash)
    while not HasModelLoaded(modelHash) do Citizen.Wait(0) end
    local customEmitter = CreateObject(modelHash, emitterCoords.x,
                                       emitterCoords.y, emitterCoords.z, true,
                                       true, true)
    local rotation = vector3(0.0, 0.0, heading)
    SetEntityRotation(customEmitter, rotation.x, rotation.y, rotation.z, 1, true)
    PlaceObjectOnGroundProperly(customEmitter)
    SetEntityAsMissionEntity(customEmitter, true, true)
    SetModelAsNoLongerNeeded(modelHash)
    SetStaticEmitterEnabled(emitterName, true)
    LinkStaticEmitterToEntity(emitterName, customEmitter)
    SetEmitterRadioStation(emitterName, Config.currentRadioStation)
    table.insert(customEmitters,
                 {entity = customEmitter, emitterName = emitterName})
end

RegisterNetEvent("spawnCustomEmittersClient")
AddEventHandler("spawnCustomEmittersClient", function(emittersData)
    for _, data in ipairs(emittersData) do
        CreateCustomEmitter(data.coords, data.heading, data.emitterName)
    end
end)

RegisterNetEvent("changeRadioStationClient")
AddEventHandler("changeRadioStationClient", function(newStation)
    Config.currentRadioStation = newStation
    for _, emitterData in ipairs(customEmitters) do
        if DoesEntityExist(emitterData.entity) then
            SetEmitterRadioStation(emitterData.emitterName,
                                   Config.currentRadioStation)
        end
    end

    print("Radio station changed to: " .. Config.currentRadioStation)
end)

RegisterNetEvent("resumeMusicOnEmitters")
AddEventHandler("resumeMusicOnEmitters", function()
    for _, emitterData in ipairs(customEmitters) do
        if DoesEntityExist(emitterData.entity) then
            SetStaticEmitterEnabled(emitterData.emitterName, true)
        end
    end

    print("Stopped all audio on emitters")
end)

RegisterNetEvent("pauseMusicOnEmitters")
AddEventHandler("pauseMusicOnEmitters", function()
    for _, emitterData in ipairs(customEmitters) do
        if DoesEntityExist(emitterData.entity) then
            SetStaticEmitterEnabled(emitterData.emitterName, false)
        end
    end

    print("Stopped all audio on emitters")
end)

AddEventHandler("onClientMapStart", function()
    Citizen.Wait(20000)
    TriggerServerEvent("setupEmitters")
end)

RegisterCommand('festivalmenu', function()
    ui = not ui
    if ui then
        SendNUIMessage({showUI = true})
        SetNuiFocus(true, true)
    else
        SendNUIMessage({showUI = false})
        SetNuiFocus(false, false)
    end
end)

RegisterNUICallback('closeMenu', function(data, cb)
    ui = false
    SendNUIMessage({showUI = false})
    SetNuiFocus(false, false)
end)

RegisterNUICallback('changeRadioStation', function(data, cb)
    TriggerServerEvent("changeRadioStation", data.station)
end)

RegisterNUICallback('pauseMusic',
                    function(data, cb) TriggerServerEvent("pauseMusic") end)

RegisterNUICallback('resumeMusic',
                    function(data, cb) TriggerServerEvent("resumeMusic") end)

RegisterNUICallback('startFestival', function(data, cb)
    TriggerServerEvent("setupEmitters", 'all')
end)
