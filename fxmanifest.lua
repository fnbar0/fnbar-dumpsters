fx_version "cerulean"
game "gta5"
author "fnbar"
description "Dumpster searching system made for ESX"
version "1.0"
lua54 'yes'

client_scripts {
    "config.lua",     
    "locales.lua",   
    "client/main.lua" 
}

server_scripts {
    "config.lua",    
    "locales.lua",    
    "server/main.lua" 
}

shared_script '@ox_lib/init.lua'

