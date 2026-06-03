--[[ USAGE EXAMPLE (SERVER SIDE) : ]]

AddEventHandler('dnj:example', function()
RegisterNetEvent('dnj:example')
    local playername = GetPlayerName(source)
    local item = "money"
    local count = 10
    exports.ox_inventory:AddItem(source, item, count)
    exports['dnj_logs']:sendlog(
    --- @param dnjhooks string
    'example', -- dnj.hooks {['example'] = "webhook"}
    'test - test', -- webhook title
    'Hráč **' .. playername .. '** dostal předmět **' .. item .. '**. Počet : **'.. count .. '**x.', -- webhook description
    --- @param type string 'info' | 'success' | 'error' | 'warning'
    'info' -- dnj.colors
    )
end)