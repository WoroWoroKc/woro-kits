ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('woro-nick')
AddEventHandler('woro-nick', function(year, month, day)

    local name = GetPlayerName(source)

    if string.find(name, Config.ServerTag) then

        i, j = string.find(name, Config.ServerTag)
        local playerNick = string.sub(name, i, j)

        if playerNick == nil then
            playerNick = "nic" 
        end
        
        if playerNick == Config.ServerTag then
            dajitemy(source, year, month , day)
        end
    else
        TriggerClientEvent('esx:showNotification', source, "Nie masz w niku: "..Config.ServerTag)
    end
end)

function dajitemy(source, year, month, day)
	local xPlayer = ESX.GetPlayerFromId(source)


	local test = MySQL.Sync.fetchAll('SELECT * FROM woro_kity WHERE owner = @owner',
	{
		['@owner'] = xPlayer.identifier
	})

	while test == nil do
		Citizen.Wait(100)
	end


	if test[1] == nil then


        --Poza linijka 47 i 70 NIC NIE ZMIENIAJ!!!!!!!!!

        --Tutaj dodajesz itemy np: to co jest nizej da wam 10 jablek
        xPlayer.addInventoryItem("apple", "10")
        --Jak chcesz aby w kit dawal wiecej itemow to kopiujecie linijke


        local date = year.."-"..month.."-"..day
        MySQL.Async.execute('INSERT INTO woro_kity (owner, date) VALUES (@owner, @date)',
        {
    
            ['@owner']  = xPlayer.identifier,
            ['@date']  = date	
        })
        TriggerClientEvent('esx:showNotification', source, "Dzieki ze wspierasz nasz server")
	else
		
		if test[1].owner == xPlayer.identifier then
            local date = year.."-"..month.."-"..day
            if date == test[1].date then
                TriggerClientEvent('esx:showNotification', source, "Zestaw można odbierać co 1 dzień")
            else



                --Tutaj dodajesz itemy np: to co jest nizej da wam 10 jablek
                xPlayer.addInventoryItem("apple", "10")
                --Jak chcesz aby w kit dawal wiecej itemow to kopiujecie linijke



                TriggerClientEvent('esx:showNotification', source, "Dzieki ze wspierasz nasz server")
            end
		end
	end
	


end