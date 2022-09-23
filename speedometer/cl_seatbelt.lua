-- local isUiOpen = false 
-- local speedBuffer = {}
-- local velBuffer = {}
-- local SeatbeltON = false
-- local InVehicle = false


-- AddEventHandler('seatbelt:sounds', function(soundFile, soundVolume)
--   SendNUIMessage({
--     transactionType = 'playSound',
--     transactionFile = soundFile,
--     transactionVolume = soundVolume
--   })
-- end)

-- function IsCar(veh)
--   local vc = GetVehicleClass(veh)
--   return (vc >= 0 and vc <= 7) or (vc >= 9 and vc <= 12) or (vc >= 17 and vc <= 20)
-- end	

-- function Fwv(entity)
--   local hr = GetEntityHeading(entity) + 90.0
--   if hr < 0.0 then hr = 360.0 + hr end
--   hr = hr * 0.0174533
--   return { x = math.cos(hr) * 2.0, y = math.sin(hr) * 2.0 }
-- end
 
-- CreateThread(function()
-- 	while true do
--       Wait(1)
--     local ped = PlayerPedId()
--     local car = GetVehiclePedIsIn(ped)

--     if car ~= 0 and (InVehicle or IsCar(car)) then
--       InVehicle = true
--           if isUiOpen == false and not IsPlayerDead(PlayerId()) then
--               isUiOpen = true
--         end

--       if SeatbeltON then 
--         DisableControlAction(0, 75, true)  -- Disable exit vehicle when stop
--         DisableControlAction(27, 75, true) -- Disable exit vehicle when Driving
-- 	    end

--       speedBuffer[2] = speedBuffer[1]
--       speedBuffer[1] = GetEntitySpeed(car)
--                                                                                                               -- KM/H (must be have decimal value)
--       if not SeatbeltON and speedBuffer[2] ~= nil and GetEntitySpeedVector(car, true).y > 1.0 and speedBuffer[1] > (100.0 / 3.6) and (speedBuffer[2] - speedBuffer[1]) > (speedBuffer[1] * 0.255) then
--         local co = GetEntityCoords(ped)
--         local fw = Fwv(ped)
--         SetEntityCoords(ped, co.x + fw.x, co.y + fw.y, co.z - 0.47, true, true, true)
--         SetEntityVelocity(ped, velBuffer[2].x, velBuffer[2].y, velBuffer[2].z)
--         Wait(1)
--         SetPedToRagdoll(ped, 1000, 1000, 0, 0, 0, 0)
--       end
        
--       velBuffer[2] = velBuffer[1]
--       velBuffer[1] = GetEntityVelocity(car)
        
--       if IsControlJustReleased(0, 311) and GetLastInputMethod(0) then -- 311 = K
--           SeatbeltON = not SeatbeltON 
--           if SeatbeltON then
--             Wait(1)
--             TriggerEvent("seatbelt:sounds", "buckleceinture", 0.5)
--             isUiOpen = true 
--           else
--             TriggerEvent("seatbelt:sounds", "unbuckleceinture", 0.5)
--             isUiOpen = true  
--           end
--       end
      
--     elseif InVehicle then
--       InVehicle = false
--       SeatbeltON = false
--       speedBuffer[1], speedBuffer[2] = 0.0, 0.0
--       if isUiOpen == true and not IsPlayerDead(PlayerId()) then
--           if true then
--             --  print("pas dans le vehicle")
--           end
--           isUiOpen = false 
--         end
--       else
--         Wait(2500)
--     end
--   end
-- end)

-- CreateThread(function()
--   while true do
--     Wait(1)
--     local Vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
--     local VehSpeed = GetEntitySpeed(Vehicle) * 3.6

--         if not SeatbeltON and InVehicle and not IsPlayerDead(PlayerId()) and true then
--           if true and VehSpeed > 20 then -- Alarm Speed
--             TriggerEvent("seatbelt:sounds", "bipbip", 0.5)
--             ESX.ShowNotification('~y~SantanaRP~s~\n~r~Vous n\'etes pas attacher~s~\n~g~Appuyer sur <C>~y~K<C>~g~ pour vous attacher')
--             Wait(8000)
--           end
--         else
--           Wait(2500)
--       end
--   end
-- end)