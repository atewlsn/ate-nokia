fx_version "adamant"
game "gta5"
lua54 'yes'

author 'atexdenizwp'
description 'nokia phone'

ui_page "ui/index.html"
files{
    "ui/*",
}

server_scripts {
    'server.lua'
}

client_scripts {
    'config.lua',
    'main_cl.lua'
}
shared_script 'config.lua'