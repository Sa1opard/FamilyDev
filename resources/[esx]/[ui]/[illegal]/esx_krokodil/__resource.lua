description 'esx_kroko'

version '1.0.0'

server_scripts {

  '@es_extended/locale.lua',
	'locales/fr.lua',
  'server/main.lua',
  'config.lua'

}

client_scripts {

  '@es_extended/locale.lua',
	'locales/fr.lua',
  'config.lua',
  'client/main.lua'

}
