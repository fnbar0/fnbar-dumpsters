local ESX = exports["es_extended"]:getSharedObject()
local SearchedDumpsters = {}
local ped = PlayerPedId()
for i, dumpsterModel in ipairs(Config.DumpsterProps) do    
    if Config.Target == "qtarget" then
        exports.qtarget:AddTargetModel(joaat(dumpsterModel), {
            options = {
                    {
                        action = function(data)
                            entity = data.entity
                            if DoesEntityExist(entity) then
                                local alreadySearched = false
                                for _, searchedEntity in ipairs(SearchedDumpsters) do
                                    if searchedEntity == entity then
                                        alreadySearched = true
                                        break
                                    end
                                end
                                if alreadySearched then 
                                    return ESX.ShowNotification(locales[Config.Locale].AlreadySearched)
                                end
                                if not searching then 
                                    SearchDumpster(entity)
                                else 
                                    ESX.ShowNotification(locales[Config.Locale].CantNow)
                                end
                            end
                        end,
                        icon = "fa-solid fa-dumpster",
                        label = locales[Config.Locale].SearchDumpster,
                        num = 1
                    },                  
            },
            distance = 2
        })
    elseif Config.Target == "ox_target" then 
        exports.ox_target:addModel(joaat(dumpsterModel), {
             {
                onSelect = function(data)
                    entity = data.entity
                    if DoesEntityExist(entity) then
                        local alreadySearched = false
                        for _, searchedEntity in ipairs(SearchedDumpsters) do
                            if searchedEntity == entity then
                                alreadySearched = true
                                break
                            end
                        end
                        if alreadySearched then 
                            return ESX.ShowNotification(locales[Config.Locale].AlreadySearched)
                        end
                        if not searching then 
                            SearchDumpster(entity)
                        else 
                            ESX.ShowNotification(locales[Config.Locale].CantNow)
                        end
                    end
                end,
                icon = "fa-solid fa-dumpster",
                label = locales[Config.Locale].SearchDumpster,
             }
        })
    end
end

function SearchDumpster(entity)
    searching = true
    table.insert(SearchedDumpsters,entity)
    TaskStartScenarioInPlace(ped, "PROP_HUMAN_BUM_SHOPPING_CART", 0, true)
    Citizen.Wait(100)
    FreezeEntityPosition(ped,true)
    if lib.progressBar({
        duration = Config.SearchTime,
        label = locales[Config.Locale].SearchingDumpster,
        useWhileDead = false,
        canCancel = true,
        disable = {
            car = true,
        },
    }) 
    then   
        ESX.TriggerServerCallback("dumpsterCallback", function(found, item, quantity)
            if found then
                ESX.ShowNotification(string.format("%s%dx %s", locales[Config.Locale].Found, quantity, item))
            else
                ESX.ShowNotification(locales[Config.Locale].FoundNothing)
            end
        end)
    else 
        ESX.ShowNotification(locales[Config.Locale].Cancelled)
    end
    FreezeEntityPosition(ped,false)
    searching = false
    ClearPedTasks(ped)
end
