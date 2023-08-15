local Speakers = {}

function spawnProps(type)
    if type == "Speakers" then
        TriggerClientEvent("qb-djs:receiveSpeakers", -1)
    end
end

-- A function to check if a radio station is valid
function isValidStation(station)
    for i, validStation in ipairs(Config.validStations) do
        if station == validStation then return true end
    end
    return false
end

-- Triggered when "qb-djs:getEmitters" event is called
RegisterNetEvent("qb-djs:getSpeakers")
AddEventHandler("qb-djs:getSpeakers", function()
    local source = source
    if source then

    else
        print("Invalid player ID: " .. tostring(source))
    end
end)

-- Triggered when "pauseMusic" event is called
RegisterServerEvent('pauseMusic')
AddEventHandler('pauseMusic', function()
    local source = source
    if source then
        -- Sends the new radio station to the client
        TriggerClientEvent("pauseMusicOnEmitters", -1, Config.customEmittersData)
    else
        print("Invalid player ID: " .. tostring(source))
    end
end)

-- Triggered when "resumeMusic" event is called
RegisterServerEvent('resumeMusic')
AddEventHandler('resumeMusic', function()
    local source = source
    if source then
        -- Sends the new radio station to the client
        TriggerClientEvent("resumeMusicOnEmitters", -1,
            Config.customEmittersData)
    else
        print("Invalid player ID: " .. tostring(source))
    end
end)

-- Triggered when "changeRadioStation" event is called
RegisterServerEvent('changeRadioStation')
AddEventHandler('changeRadioStation', function(newStation)
    local source = source
    if source then
        -- Check if newStation is a valid radio station
        if isValidStation(newStation) then
            -- Sends the new radio station to the client
            TriggerClientEvent("changeRadioStationClient", -1, newStation)
        else
            print("Invalid radio station: " .. newStation)
        end
    else
        print("Invalid player ID: " .. tostring(source))
    end
end)
