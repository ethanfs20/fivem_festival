local isPlayerInDJBooth = false

-- The rest of your existing client-side code
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        local playerHeading = GetEntityHeading(playerPed)
        local distanceToDJBooth = Vdist(playerCoords, Config.djbooth.coords)

        if not IsEntityDead(playerPed) then -- Check if the player is not dead
            if distanceToDJBooth <= Config.djbooth.markerRadius then
                BeginTextCommandDisplayHelp("STRING")
                AddTextComponentSubstringPlayerName(
                    "Press ~INPUT_CONTEXT~ to enter/exit the DJ booth")
                EndTextCommandDisplayHelp(0, false, true, -1)

                if IsControlJustReleased(0, 38) then
                    if not isPlayerInDJBooth then
                        isPlayerInDJBooth = true
                        ui = true

                        RequestAnimDict(Config.djbooth.animDict)
                        while not HasAnimDictLoaded(Config.djbooth.animDict) do
                            Citizen.Wait(0)
                        end
                        TaskPlayAnim(playerPed, Config.djbooth.animDict,
                                     Config.djbooth.animName, 8.0, -8.0, -1, 1,
                                     0, false, false, false)

                        -- Start second animation
                        RequestAnimDict(Config.djbooth.animDict2)
                        while not HasAnimDictLoaded(Config.djbooth.animDict2) do
                            Citizen.Wait(0)
                        end
                        TaskPlayAnim(playerPed, Config.djbooth.animDict2,
                                     Config.djbooth.animName2, 8.0, -8.0, -1, 1,
                                     0, false, false, false)
                        SendNUIMessage({showUI = true})
                        SetNuiFocus(true, true)
                    else
                        isPlayerInDJBooth = false
                        ClearPedTasks(playerPed)
                        ClearPedSecondaryTask(playerPed)
                        SendNUIMessage({showUI = false})
                        SetNuiFocus(false, false)
                    end
                end
            end

            if not isPlayerInDJBooth then
                DrawMarker(0, Config.djbooth.coords.x, Config.djbooth.coords.y,
                           Config.djbooth.coords.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0,
                           1.0, 1.0, 1.0, 255, 255, 255, 100, true, true, 2,
                           true, false, false, false)
            end
        end
    end
end)
