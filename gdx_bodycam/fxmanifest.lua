fx_version 'adamant'
games { 'gta5' }

client_scripts {
	'client.lua'
}

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'server.lua'
}


files {
    'ui/app.js',
    'ui/index.html',
    'ui/style.css',
}

ui_page {
    'ui/index.html'
}