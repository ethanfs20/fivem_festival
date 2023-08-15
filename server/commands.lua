
-- Command to spawn the custom emitters at their specified coordinates (/boom)
RegisterCommand("startfestival", function(source, args)
    local player = source
    if source then
        -- Spawn the speakers
        spawnProps("Speakers")
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
