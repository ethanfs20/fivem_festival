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
<<<<<<< HEAD
        if type == "new" then
            -- Sends custom emitter data to the source only
            TriggerClientEvent("spawnCustomEmittersClient", source,
                Config.customEmittersData)
        else
            -- Sends custom emitter data to all clients
            TriggerClientEvent("spawnCustomEmittersClient", -1,
                Config.customEmittersData)
        end
=======

>>>>>>> 72e210b047d2e282a7a0c0cab7ea24ad4e509820
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
<<<<<<< HEAD

-- Command to spawn the custom emitters at their specified coordinates (/boom)
RegisterCommand("startfestival", function(source, args)
    local player = source
    if source then
        print("Spawning custom emitters for player " .. player)
        -- Triggers the client event to spawn custom emitters for the player
        TriggerClientEvent("spawnCustomEmittersClient", -1,
            Config.customEmittersData)
    else
        print("Invalid player ID: " .. tostring(source))
    end
end, true)

-- Command to pause music
RegisterCommand("pausemusic", function(source, args)
    local player = source
    if source then
        TriggerClientEvent("pauseMusicOnEmitters", -1,
            Config.customEmittersData)
    else
        print("Invalid player ID: " .. tostring(source))
    end
end, true)

-- Command to resume music
RegisterCommand("resumemusic", function(source, args)
    local player = source
    if source then
        TriggerClientEvent("resumeMusicOnEmitters", -1,
            Config.customEmittersData)
    else
        print("Invalid player ID: " .. tostring(source))
    end
end, true)

-- Command to change the radio station for all emitters (/changeradio <radiostation>)
RegisterCommand("changeradio", function(source, args)
    local player = source
    if source then
        if #args == 1 then
            local newStation = args[1]
            if isValidStation(newStation) then
                -- Triggers the client event to change the radio station for all emitters
                TriggerClientEvent("changeRadioStationClient", -1,
                    newStation)
                print("Radio station changed to: " .. newStation)
            else
                print("Invalid radio station: " .. newStation)
            end
        else
            print("Usage: /changeradio <radiostation>")
        end
    else
        print("Invalid player ID: " .. tostring(source))
    end
end, true)
=======
>>>>>>> 72e210b047d2e282a7a0c0cab7ea24ad4e509820
