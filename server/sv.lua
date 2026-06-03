local function send(channel, title, message, type)
    local wbhkurl = dnj.hooks[channel]
    if not wbhkurl or wbhkurl == "" then
        wbhkurl = dnj.hooks['default']
    end

    local embedclr = dnj.colors[type]
    if not embedclr then
        embedclr = dnj.colors['info']
    end

    local edata = {
        {
            ["title"] = title,
            ["description"] = message,
            ["color"] = embedclr,
            ["footer"] = {
                ["text"] = os.date("%Y-%m-%d %H:%M:%S") .. " | dnj logs"
            }
        }
    }

    PerformHttpRequest(wbhkurl, function(err, text, headers) end, 'POST', json.encode({
        username = dnj.name,
        avatar_url = dnj.avatar,
        embeds = edata
    }), { ['Content-Type'] = 'application/json' })
end

exports('sendlog', send)