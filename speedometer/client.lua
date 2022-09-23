TriggerEvent('YnS::esx:getSharedObject', function(obj) ESX = obj end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10)
		local DisableHud = false
		local Sleep = true
		local Ped = PlayerPedId()
		if(IsPedInAnyVehicle(Ped)) and (not IsPauseMenuActive()) then
			local PedCar = GetVehiclePedIsIn(Ped, false)
			if PedCar and GetPedInVehicleSeat(PedCar, -1) == Ped then
				Sleep = false
					-- Speed AND Fuel
					carSpeed = math.ceil(GetEntitySpeed(PedCar) * 3.6)
					fuel = GetVehicleFuelLevel(PedCar)
					SendNUIMessage({
						showhud = true,
						showfuel = true,
						fuel = fuel,
						speed = carSpeed
					})
					if fuel < 15.0 then 
						ESX.ShowNotification('~s~SantanaRP~s~\n~r~Votre véhicule n\'a bientôt plus d\'essence~s~\n~g~Aller faire le plein')
						Wait(20000)
					end
				Sleep = true
			else
				DisableHud = true
			end
		else
			DisableHud = true 
		end
		if DisableHud then 
			SendNUIMessage({
				showhud = false
			})
		end
		if Sleep then
			Citizen.Wait(50)
		end
	end
end)