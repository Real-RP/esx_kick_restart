resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'
--this resource needs MySQL!

description 'Server Kick for Restart'

version '1.2.0'

client_script {

  'client.lua'

}


server_scripts {

  '@mysql-async/lib/MySQL.lua',
  'server.lua'

}