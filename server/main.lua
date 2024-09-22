local ESX = exports["es_extended"]:getSharedObject()

ESX.RegisterServerCallback("dumpsterCallback", function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    local FindChance = math.random(1, 100)
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
                cb(false)
            else
                local randomItem = math.random(1,#Config.Rarities[selectedRarity].items)
                local item = Config.Rarities[selectedRarity].items[randomItem].item
                local quantity = math.random(Config.Rarities[selectedRarity].items[randomItem].minQuantity,Config.Rarities[selectedRarity].items[randomItem].maxQuantity)
                if item ~= "money" then
                    xPlayer.addInventoryItem(item, quantity)
                    cb(true,ESX.GetItemLabel(item),quantity)
                else 
                    xPlayer.addAccountMoney('money', quantity)
                    cb(true,locales[Config.Locale].Money,quantity)
                end
            end
        else
          cb(false)
        end
    else
        cb(false)
    end
end)
