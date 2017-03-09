
-- /lfg enables display of LFM messages for a given instance
SLASH_LFG_TOGGLE1 = "/lfg"
SlashCmdList["LFG_TOGGLE"] = function(msg)
    local instance = matchInstance(string.lower(msg))
    if not instance then
        print("Unknown instance " .. msg)
        return
    end

    print("LFG for " .. instance.Name)
end

-- /lfm enables display of LFG messages for a given instance
SLASH_LFM_TOGGLE1 = "/lfm"
SlashCmdList["LFM_TOGGLE"] = function(msg)
    if LFG_ShowLfg then
        print("Hiding LFG messages")
        LFG_ShowLfg = false
    else
        print("Showing LFG messages")
        LFG_ShowLfg = true
    end
end
