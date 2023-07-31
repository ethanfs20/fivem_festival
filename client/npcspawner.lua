-- Function to spawn a ped with given parameters and perform scenario
function SpawnPed(model, coords, heading, scenario)
    RequestModel(model)
    while not HasModelLoaded(model) do Citizen.Wait(0) end

    local ped = CreatePed(4, model, coords.x, coords.y, coords.z, heading, false, true)
    if DoesEntityExist(ped) then
        SetEntityAsMissionEntity(ped, true, true)
        SetEntityInvincible(ped, true) -- Make the ped invincible (cannot be damaged)
        SetEntityHeading(ped, heading)
        SetBlockingOfNonTemporaryEvents(ped, true)
        SetModelAsNoLongerNeeded(model)
        PlaceObjectOnGroundProperly(ped)
        Citizen.Wait(1000)
        TaskStartScenarioInPlace(ped, scenario, 0, true)
    end
end

-- Loop through the PedList table and spawn each ped
Citizen.CreateThread(function()
    for pedType, pedData in pairs(Config.PedList) do
        if pedType ~= "Grounds" then
            if type(pedData) == "table" then
                for _, data in ipairs(pedData) do
                    SpawnPed(data.model, data.coords, data.heading, data.scenario)
                    Citizen.Wait(1000) -- Add a delay to avoid spawning all peds at once
                end
            end
        end
    end
end)
