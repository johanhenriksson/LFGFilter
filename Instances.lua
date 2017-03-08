
InstanceMap = {
    Deadmines = {
        Name = "Deadmines",
        Short = "DM",
        Keywords = { "dm", "vc", "dead%s*mines" },
        Exclude = { "east", "west", "north", "tribute" },
    },

    WailingCaverns = {
        Name = "WailingCaverns",
        Short = "WC",
        Keywords = { "wailing%s*caverns", "wc" },
        Exclude = { },
    },

    Shadowfang = {
        Name = "Shadowfang Keep",
        Short = "SFK",
        Keywords = { "shadowfang", "sfk" },
        Exclude = { },
    },

    Stockades = {
        Name = "The Stockades",
        Short = "Stockade",
        Keywords = { "stockade", "stock" },
        Exclude = { },
    },
    
    Blackfathom = {
        Name = "Blackfathom Deeps",
        Short = "BFD",
        Keywords = { "blackfathom%s*deeps", "bfd", "bdf" },
        Exclude = { },
    },

    RazorfenKraul = {
        Name = "Razorfen Kraul",
        Short = "RFK",
        Keywords = { "razorfen%s*kraul", "rfk", "rkf" },
        Exclude = { },
    },

    Gnomeregan = {
        Name = "Gnomeregan",
        Short = "Gnome",
        Keywords = { "gnomeregan", "gnome%a*" },
        Exclude = { },
    },

    Scarlet = {
        Name = "Scarlet Monastery",
        Short = "SM",
        Keywords = { "scarlet", "sm", "%s+lib", "%s+arm", "cath" },
        Exclude = { },
    },

    RazorfenDowns = {
        Name = "Razorfen Downs",
        Short = "RFD",
        Keywords = { "razorfen%s*downs", "rfd" },
        Exclude = { },
    },

    Uldaman = {
        Name = "Uldaman",
        Short = "Ulda",
        Keywords = { "uldaman", "ulda" },
        Exclude = { },
    },

    ZulFarrak = {
        Name = "Zul'Farrak",
        Short = "ZF",
        Keywords = { "zul.?farrak", "zf" },
        Exclude = { },
    },

    Maraudon = {
        Name = "Maraudon",
        Short = "Mara",
        Keywords = { "maraudon", "mara" },
        Exclude = { },
    },

    SunkenTemple = {
        Name = "Sunken Temple",
        Short = "ST",
        Keywords = { "sunken", "%s+st%s+", "%s+st$" },
        Exclude = { },
    },

    BlackrockDepths = {
        Name = "Blackrock Depths",
        Short = "BRD",
        Keywords = { "brd", "blackrock%s+depths", "lava" },
        Exclude = { },
    },

    Scholomalance = {
        Name = "Scholomalance",
        Short = "Scholo",
        Keywords = { "scholomalance", "scholo" },
        Exclude = { },
    },

    Stratholme = {
        Name = "Stratholme",
        Short = "Strat",
        Keywords = { "stratholme", "strat" },
        Exclude = { },
    },

    LBRS = {
        Name = "LBRS",
        Short = "LBRS",
        Keywords = { "lbrs" },
        Exclude = { },
    },

    UBRS = {
        Name = "UBRS",
        Short = "UBRS",
        Keywords = { "ubrs", "urbs" },
        Exclude = { },
    },

    -- TBA
--    DireMaul = {
--        Name = "Dire Maul",
--        Short = "DM",
--        Keywords = { "dm", "tribute" },
--        Exclude = { "vc", "cleef" },
--    },
--

    MoltenCore = {
        Name = "Molten Core",
        Short = "MC",
        Keywords = { "mc", "molten" },
        Exclude = { },
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
