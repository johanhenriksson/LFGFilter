
InstanceMap = {
    Deadmines = {
        Name = "Deadmines",
        Short = "DM",
        Keywords = { "dm", "vc", "dead%s*mines" },
        Exclude = { "east", "west", "north", "tribute" },
        LFG = true,
    },

    WailingCaverns = {
        Name = "WailingCaverns",
        Short = "WC",
        Keywords = { "wailing%s*caverns", "wc" },
        Exclude = { },
        LFG = true,
    },

    Shadowfang = {
        Name = "Shadowfang Keep",
        Short = "SFK",
        Keywords = { "shadowfang", "sfk" },
        Exclude = { },
        LFG = true,
    },

    Stockades = {
        Name = "The Stockades",
        Short = "Stockade",
        Keywords = { "stockade", "stock" },
        Exclude = { },
        LFG = true,
    },
    
    Blackfathom = {
        Name = "Blackfathom Deeps",
        Short = "BFD",
        Keywords = { "blackfathom%s*deeps", "bfd", "bdf" },
        Exclude = { },
        LFG = true,
    },

    RazorfenKraul = {
        Name = "Razorfen Kraul",
        Short = "RFK",
        Keywords = { "razorfen%s*kraul", "rfk", "rkf" },
        Exclude = { },
        LFG = true,
    },

    Gnomeregan = {
        Name = "Gnomeregan",
        Short = "Gnome",
        Keywords = { "gnomeregan", "gnome%a*" },
        Exclude = { },
        LFG = true,
    },

    Scarlet = {
        Name = "Scarlet Monastery",
        Short = "SM",
        Keywords = { "scarlet", "sm" },
        Exclude = { },
        LFG = true,
    },

    RazorfenDowns = {
        Name = "Razorfen Downs",
        Short = "RFD",
        Keywords = { "razorfen%s*downs", "rfd" },
        Exclude = { },
        LFG = true,
    },

    Uldaman = {
        Name = "Uldaman",
        Short = "Ulda",
        Keywords = { "uldaman", "ulda" },
        Exclude = { },
        LFG = true,
    },

    ZulFarrak = {
        Name = "Zul'Farrak",
        Short = "ZF",
        Keywords = { "zul.?farrak", "zf" },
        Exclude = { },
        LFG = true,
    },

    Maraudon = {
        Name = "Maraudon",
        Short = "Mara",
        Keywords = { "maraudon", "mara" },
        Exclude = { },
        LFG = true,
    },

    SunkenTemple = {
        Name = "Sunken Temple",
        Short = "ST",
        Keywords = { "sunken%s+temple", "%s+st%s+", "%s+st$" },
        Exclude = { },
        LFG = true,
    },

    BlackrockDepths = {
        Name = "Blackrock Depths",
        Short = "BRD",
        Keywords = { "brd", "blackrock%s+depths", "lava" },
        Exclude = { },
        LFG = true,
    },

    Scholomalance = {
        Name = "Scholomalance",
        Short = "Scholo",
        Keywords = { "scholomalance", "scholo" },
        Exclude = { },
        LFG = true,
    },

    Stratholme = {
        Name = "Stratholme",
        Short = "Strat",
        Keywords = { "stratholme", "strat" },
        Exclude = { },
        LFG = true,
    },

    LBRS = {
        Name = "LBRS",
        Short = "LBRS",
        Keywords = { "lbrs" },
        Exclude = { },
        LFG = true,
    },

    UBRS = {
        Name = "UBRS",
        Short = "UBRS",
        Keywords = { "ubrs", "urbs" },
        Exclude = { },
        LFG = true,
    },

    -- TBA
--    DireMaul = {
--        Name = "Dire Maul",
--        Short = "DM",
--        Keywords = { "dm", "tribute" },
--        Exclude = { "vc", "cleef" },
--        LFG = true,
--    },
--

    MoltenCore = {
        Name = "Molten Core",
        Short = "MC",
        Keywords = { "mc", "molten" },
        Exclude = { },
        LFG = true,
    },
}

function matchInstance(text)
    for id, instance in pairs(InstanceMap) do
        if instanceMatches(text, instance) then
            return instance
        end
    end
    return false
end

function instanceMatches(text, instance)
    local keywordFound = false
    for i, kw in pairs(instance.Keywords) do
        if string.find(text, kw) then
            keywordFound = true
            break
        end
    end

    if keywordFound then
        -- found a keyword. look for exclude words
        for i, kw in pairs(instance.Exclude) do
            if string.find(text, kw) then
                return false
            end
        end
        return true
    else
        return false
    end
end
