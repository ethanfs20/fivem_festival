ui = false;

local Speakers = {}

function SpawnSpeakers(emitterCoords, heading, emitterName)
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
    table.insert(Speakers,
        { entity = customEmitter, emitterName = emitterName })
end

RegisterNetEvent("qb-djs:receiveSpeakers")
AddEventHandler("qb-djs:receiveSpeakers", function()
    for _, data in ipairs(Config.speakers) do
        SpawnSpeakers(data.coords, data.heading, data.emitterType)
    end
end)


RegisterNetEvent("changeRadioStationClient")
AddEventHandler("changeRadioStationClient", function(newStation)
    -- Change the radio station of the speaker in Speakers table
    Config.currentRadioStation = newStation
    for _, emitterData in ipairs(Speakers) do
        if DoesEntityExist(emitterData.entity) then
            SetEmitterRadioStation(emitterData.emitterName,
                Config.currentRadioStation)
        end
    end

    print("Radio station changed to: " .. Config.currentRadioStation)
end)

RegisterNetEvent("resumeMusicOnEmitters")
AddEventHandler("resumeMusicOnEmitters", function()
    for _, emitterData in ipairs(Speakers) do
        if DoesEntityExist(emitterData.entity) then
            SetStaticEmitterEnabled(emitterData.emitterName, true)
        end
    end

    print("Stopped all audio on emitters")
end)

RegisterNetEvent("pauseMusicOnEmitters")
AddEventHandler("pauseMusicOnEmitters", function()
    for _, emitterData in ipairs(Speakers) do
        if DoesEntityExist(emitterData.entity) then
            SetStaticEmitterEnabled(emitterData.emitterName, false)
        end
    end

    print("Stopped all audio on emitters")
end)

RegisterNUICallback('closeMenu', function(data)
    ui = false
    SendNUIMessage({ showUI = false })
    SetNuiFocus(false, false)
end)

RegisterNUICallback('changeRadioStation', function(data)
    TriggerServerEvent("changeRadioStation", data.station)
end)

RegisterNUICallback('pauseMusic',
    function(data) TriggerServerEvent("pauseMusic") end)

RegisterNUICallback('resumeMusic',
    function(data) TriggerServerEvent("resumeMusic") end)

RegisterNUICallback('startFestival', function(data)
    TriggerServerEvent("setupEmitters", 'all')
end)
