resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'ESX Whitelist Enhanced'

version '1.3.0'

server_scripts {
	'@es_extended/locale.lua',
	'@mysql-async/lib/MySQL.lua',
	'config.lua',
	'locales/en.lua',
	'locales/fr.lua',
	'server/whitelist_sv.lua'
}

client_scripts {
	'client/whitelist_cl.lua'
}

dependencies {
	'es_extended',
	'mysql-async'
}