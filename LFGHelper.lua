ignoreList = {
    "dm",
    "wc",
    "stockade",
    "sfk",
    "rfk",
    "gnomer", "gnomeregan",
    "sm", "lib", "cath", "arm",
    "rfd",
    "ulda",
    "zf",
}

local showLfg = false
local showLfm = true

-- helper function to print
function print(msg)
    DEFAULT_CHAT_FRAME:AddMessage(msg)
end

-- Frame OnEvent Callback
function frameEventHandler()
    if event == "CHAT_MSG_CHANNEL" then
        onChannelMessage(arg1, arg2, arg9)
    end
end

-- create a dummy frame to listen for chat events
local eventFrame = CreateFrame("Frame", "LFGHelper", UIParent)
eventFrame:RegisterEvent("CHAT_MSG_CHANNEL")
eventFrame:SetScript("OnEvent", frameEventHandler)

--

-- Channel Chat Message Handler
function onChannelMessage(msg, sender, channel)
    text = string.lower(msg)
    kind = determineMessageKind(text)

    if kind == "LFM" then
        instance = matchInstance(text)
        if not instance then
            print("could not match instance: " .. text)
        else
            print("[" .. kind .."] " .. playerLink(sender) .. " " .. instance.Name .. " (" .. cleanText(msg, instance) .. ")")
        end
    end


    if (kind == "LFG" and showLfg) or (kind == "LFM" and showLfm) or kind=="Possible" then
    end
end

function determineMessageKind(text)
    if string.find(text, "lfg") then
        return "LFG"
    end

    if string.find(text, "lf(%d*)m") then
        return "LFM"
    end

    -- we're still too naive
    if string.find(text, "lf") and not string.find(text, "lfw") then
        return "Possible"
    end

    return false
end

function playerLink(name)
    link = "|cffffc0c0|Hplayer:" .. name .. "|h[" .. name .. "]|h|r";
    return string.gsub(link, "|", "\124")
end

function cleanText(text, instance)
    -- remove lfg/lfm
    text = string.gsub(text, "[lL][fF]%d*[mM]%s*", "")
    text = string.gsub(text, "[lL][fF][gG]%s*", "")

    -- remove instance keywords
    for id, kw in pairs(instance.Keywords) do
        idx_start, idx_end = string.find(string.lower(text), kw)
        if idx_start then
            text = string.sub(text, 0, idx_start - 1) .. string.sub(text, idx_end + 1)
        end
    end

    -- trim until letter
    text = string.gsub(text, "^[^%a]*", "")
    text = string.gsub(text, "[^%a]*$", "")
    return text
end

function findClasses(text)
end
