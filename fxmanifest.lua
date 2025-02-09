fx_version "cerulean"
game "gta5"
author "fnbar"
description "Dumpster searching system made for ESX"
version "1.0"
lua54 'yes'

client_scripts {
    "client/main.lua" 
}

server_scripts {   
    "server/main.lua" 
}

shared_scripts {
    '@ox_lib/init.lua',
    "locales.lua",
    "config.lua"
}

