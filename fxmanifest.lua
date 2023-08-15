fx_version 'cerulean'
game 'gta5'

author 'Ethan4t0r'
description 'Festival script for FiveM'
version '1.0.0'

client_scripts { 'shared/config.lua', 'client/client.lua', 'client/npcspawner.lua', 'client/checkpoint.lua',
    'client/djbooth.lua' }
server_scripts { 'shared/config.lua', 'server/server.lua', 'server/commands.lua' }

ui_page 'html/index.html'

files {
    'html/index.html', 'html/index.css', 'html/index.js', 'html/radio.css',
    'html/imgs/WestCoastClassics-GTAV-Logo.png',
    'html/imgs/RadioLosSantos-GTAV-Logo.png',
    'html/imgs/NonStopPopFM-GTAV-Logo.png',
    'html/imgs/IFruitRadio-GTAO-Logo.png',
    'html/imgs/MusicLockerRadio-GTAO-Logo.png', 'html/imgs/WCTR-GTAV-Logo.png',
    'html/imgs/FlyLoFM-GTAV-Logo.png'
}
