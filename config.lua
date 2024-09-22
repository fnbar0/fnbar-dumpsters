Config = {}
Config.Locale = 'en' -- en/pl
Config.Framework = 'ESX' -- Right now works only with ESX.
Config.SearchTime = 5000 -- Time in miliseconds to search the dumpster.
Config.Target = 'qtarget' -- ox_target/qtarget
Config.FindChance = 100 -- Chance to find anything in dumpster.

Config.Rarities = { -- You can change chance of getting these rarities after succesfully searching dumpster and items that can drop, aswell their quantities.
    ['Common'] = {
        chance = 50,
        items = {
            { item = "water", minQuantity = 1, maxQuantity = 3 },
            { item = "bread", minQuantity = 1, maxQuantity = 2 }
        }
    },
    ['Rare'] = {
        chance = 30,
        items = {
            { item = "WEAPON_KNIFE", minQuantity = 1, maxQuantity = 1 },
            { item = "bread", minQuantity = 1, maxQuantity = 3 },
            { item = "money", minQuantity = 50, maxQuantity = 200 }
        }
    },
    ['Epic'] = {
        chance = 15,
        items = {
            { item = "WEAPON_PISTOL", minQuantity = 1, maxQuantity = 1 },
            { item = "bread", minQuantity = 1, maxQuantity = 3 },
            { item = "money", minQuantity = 100, maxQuantity = 500 }
        }
    },
    ['Legendary'] = {
        chance = 5,
        items = {
            { item = "water", minQuantity = 2, maxQuantity = 5 },
            { item = "bread", minQuantity = 1, maxQuantity = 4 },
            { item = "money", minQuantity = 500, maxQuantity = 1000 }
        }
    }
	-- You can add more rarities if you want.
}


Config.DumpsterProps = { -- List of targetable props that can be searched. I suggest this site to find dumpster prop names / https://gtahash.ru/
	"prop_dumpster_01a",
	"prop_dumpster_02a",
	"prop_dumpster_4a",
	"prop_bin_08a",
	"prop_dumpster_4b"
}





