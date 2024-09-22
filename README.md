# fnbar-dumpsters
FiveM lua script that allows players to search dumpsters all around the map.


## Resource Installation
* Download the repository
* Put the `fnbar-dumpsters` folder in your resources directory
* Add `ensure fnbar-dumpsters` to your server config

## Dependencies
| Resource | Description | Download |
|----------|-------------|----------|
| ox_lib | Used for the progressbar while searching dumpster. | https://github.com/overextended/ox_lib |
| ESX | Framework handling inventory items and money accounts. | https://github.com/esx-framework/esx_core |
| ox_target/qtarget | Resources that allow to target specific dumpster entity. | https://github.com/overextended/qtarget https://github.com/overextended/ox_target |


## Configuration

In config file you can set bunch of things, like chances, language or search time.
To add new language simply go to `locales.lua` and add new language just like the other ones are included. Then go to config.lua and change locale to the one you just made.
