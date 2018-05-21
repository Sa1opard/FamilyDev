-- Configuration BDD
--require "resources/mysql-async/lib/MySQL"
--MySQL:open("127.0.0.1", "essentialmode", "root", "")

--====================================================================================
--  Teste si un joueurs a donnée ces infomation identitaire
--====================================================================================
function hasIdentity(source)
    local identifier = GetPlayerIdentifiers(source)[1]
    local executed_query, result = MySQL:executeQuery("select firstname, lastname from users where identifier = '@identifier'", {
        ['@identifier'] = identifier
    })
    local result = MySQL:getResults(executed_query, {"firstname", "lastname"})
    local user = result[1]
    return not (user['firstname'] == '' or user['lastname'] == '')
end

function getIdentity(source)
    local identifier = GetPlayerIdentifiers(source)[1]
    local executed_query, result = MySQL:executeQuery("select users.* , job.job_name as job  from users join job WHERE users.job = job.job_id and users.identifier = '@identifier'", {
        ['@identifier'] = identifier
    })
    local result = MySQL:getResults(executed_query, {"firstname", "lastname", "dateofbirth", "sex", "height", "job"})
    if #result == 1 then
        result[1]['id'] = source
        return result[1]
    else
        return nil
    end
end

function setIdentity(identifier, data)
    MySQL:executeQuery("UPDATE users SET nom = '@firstname', prenom = '@lastname', dateNaissance = '@dateofbirth', sexe = '@sex', taille = '@height' WHERE identifier = '@identifier'", {
        ['@firstname'] = data.firstname,
        ['@lastname'] = data.lastname,
        ['@dateofbirth'] = data.dateofbirth,
        ['@sex'] = data.sex,
        ['@height'] = data.height,
        ['@identifier'] = identifier
    })
    
end

function convertSQLData(data)
    return {
        firstname = data.firstname,
        lastname = data.lastname,
        sex = data.sex,
        dateofbirth = tostring(data.dateofbirth),
        -- dateNaissance = os.date("%x",os.time(data.dateNaissance)), -- mysql async 
        job = data.job,
        height = data.height,
        id = data.id
    }
end

function openIdentity(source, data)
    if data ~= nil then 
        TriggerClientEvent('gcIdentity:showIdentity', source, convertSQLData(data))
    end
end

AddEventHandler('es:playerLoaded', function(source)
    print('identity playerLoaded')
    local identity = getIdentity(source)
    for k,v in pairs(identity) do 
        print(k .. ' -> ' .. v)
    end
    if identity == nil or identity.firstname == '' then
        TriggerClientEvent('gcIdentity:showRegisterIdentity', source)
    else
    print('identity setIdentity')
        TriggerClientEvent('gcIdentity:setIdentity', source, convertSQLData(identity))
    end
end)

RegisterServerEvent('gcIdentity:openIdentity')
AddEventHandler('gcIdentity:openIdentity',function(other)
    local data = getIdentity(source)
    openIdentity(other, data)
end)

RegisterServerEvent('gcIdentity:openMeIdentity')
AddEventHandler('gcIdentity:openMeIdentity',function()
    local data = getIdentity(source)
    openIdentity(source, data)
end)


RegisterServerEvent('gcIdentity:setIdentity')
AddEventHandler('gcIdentity:setIdentity', function(data)
    setIdentity(GetPlayerIdentifiers(source)[1], data)
end)