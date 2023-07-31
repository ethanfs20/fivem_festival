local restrictedAreaCenter = vector3(656.28, 580.85, 134.05) -- Update the restricted area center to a smaller position
local restrictedAreaSize = vector3(6.0, 2.0, 2.0) -- Update the restricted area size to a smaller value
local targetPosition = vector3(650.7, 580.97, 129.05)
local markerCoords = vector3(650.83, 580.82, 129.05)
local helpMessage = "Restricted Area! Press 'E' to go through."
local entryMessage = "You are now allowed to enter!"
local checkedIn = false
local distanceThreshold = 100.0 -- Define the distance threshold for being away from the restricted area

-- Function to check if the player is within the restricted area
function isInRestrictedArea(coords)
    return IsEntityInArea(PlayerPedId(), restrictedAreaCenter.x, restrictedAreaCenter.y, restrictedAreaCenter.z, restrictedAreaSize.x, restrictedAreaSize.y, restrictedAreaSize.z, 0, 1, 0)
end

-- Display the restricted help message and marker
function ShowRestrictedHelp(type)
    SetTextComponentFormat("STRING")
    AddTextComponentString(type)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
    DrawMarker(0, markerCoords.x, markerCoords.y, markerCoords.z, 0.0, 0.0, 0.0,
               0, 0.0, 0.0, 1.0, 1.0, 1.0, 255, 255, 255, 100, true, true, 2,
               true, false, false, false)
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        local distance = #(playerCoords - targetPosition)

        if isInRestrictedArea(playerCoords) and not checkedIn then
            if distance > 2.0 and distance <= distanceThreshold then
                -- Move the player towards the target position if not too close and not too far
                local speed = 2.0
                TaskGoStraightToCoord(playerPed, targetPosition.x,
                                      targetPosition.y, targetPosition.z, speed,
                                      -1, 0.0, 0.0)
            elseif distance > distanceThreshold then
                -- If the player is further than the threshold, set checkedIn to false
                checkedIn = false
            end
        else
            Citizen.Wait(1000)
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local playerCoords = GetEntityCoords(PlayerPedId())

        -- Check if the player is close enough to interact with the marker
        if #(playerCoords - markerCoords) < 2.0 and not checkedIn then
            ShowRestrictedHelp(helpMessage)

            -- Check if the 'E' key is pressed to go through
            if IsControlJustReleased(0, 38) then 
                checkedIn = true 
                ShowRestrictedHelp(entryMessage)
            end
        elseif checkedIn then
            break
        end
    end
end)
