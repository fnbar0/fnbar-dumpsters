local ESX = exports["es_extended"]:getSharedObject()

local searched = {}

RegisterNetEvent("fnbar-dumpster:searchedDumpster")
AddEventHandler("fnbar-dumpster:searchedDumpster", function(netid)
    local dumpster = NetworkGetEntityFromNetworkId(netid)
    local dumpsterPos = GetEntityCoords(dumpster)
    local dumpsterModel = GetEntityModel(dumpster)
    if not dumpster then return end 

    local found = false
    for _, dumpsterProp in ipairs(Config.DumpsterProps) do
        if dumpsterModel == joaat(dumpsterProp) then 
            found = true
            break
        end 
    end

    if not found then return end

    local xPlayer = ESX.GetPlayerFromId(source)
    local playerCoords = GetEntityCoords(GetPlayerPed(source))
    local FindChance = math.random(1, 100)

    if #(playerCoords - dumpsterPos) > 4.0 then return end

    if not searched[dumpster] then
        searched[dumpster] = {}
    elseif searched[dumpster].source then
        return
    end
    
    searched[dumpster].source = true
    

    if xPlayer then
        if FindChance <= Config.FindChance then
            local totalChance = 0
            for _, rarity in pairs(Config.Rarities) do
                totalChance = totalChance + rarity.chance
            end
            local randomChance = math.random() * totalChance
            local selectedRarity = nil
            for rarityName, rarity in pairs(Config.Rarities) do
                randomChance = randomChance - rarity.chance
                if randomChance <= 0 then
                    selectedRarity = rarityName  
                    break
                end
            end
            if not selectedRarity then
                xPlayer.showNotification(locales[Config.Locale].FoundNothing)
            else
                local randomItem = math.random(1,#Config.Rarities[selectedRarity].items)
                local item = Config.Rarities[selectedRarity].items[randomItem].item
                local quantity = math.random(Config.Rarities[selectedRarity].items[randomItem].minQuantity,Config.Rarities[selectedRarity].items[randomItem].maxQuantity)
                if item ~= "money" then
                    xPlayer.addInventoryItem(item, quantity)
                    xPlayer.showNotification(string.format("%s %dx %s", locales[Config.Locale].Found, quantity, ESX.GetItemLabel(item)))
                else 
                    xPlayer.addAccountMoney('money', quantity)
                    xPlayer.showNotification(string.format("%s %dx %s", locales[Config.Locale].Found, quantity, locales[Config.Locale].Money))
                end
            end
        else
            xPlayer.showNotification(locales[Config.Locale].FoundNothing)
        end
    else
        xPlayer.showNotification(locales[Config.Locale].FoundNothing)
    end
end)
