
InstanceMap = {
    Deadmines = {
        Name = "Deadmines",
        Short = "DM",
        Keywords = { "dm", "vc", "dead%s*mines" },
        Exclude = { "east", "west", "north", "tribute" },
        Show = true,
    },
    WailingCaverns = {
        Name = "WailingCaverns",
        Short = "WC",
        Keywords = { "wailing%s*caverns", "wc" },
        Exclude = { },
        Show = true,
    },
    Shadowfang = {
        Name = "Shadowfang Keep",
        Short = "SFK",
        Keywords = { "shadowfang", "sfk" },
        Exclude = { },
        Show = true,
    },
    Stockades = {
        Name = "The Stockades",
        Short = "Stockade",
        Keywords = { "stockade", "stock" },
        Exclude = { },
        Show = true,
    },
    Blackfathom = {
        Name = "Blackfathom Deeps",
        Short = "BFD",
        Keywords = { "blackfathom%s*deeps", "bfd" },
        Exclude = { },
        Show = true,
    },
    RazorfenKraul = {
        Name = "Razorfen Kraul",
        Short = "RFK",
        Keywords = { "razorfen%s*kraul", "rfk" },
        Exclude = { },
        Show = true,
    },
    Scarlet = {
        Name = "Scarlet Monastery",
        Short = "SM",
        Keywords = { "scarlet", "sm", "lib", "arm", "cath" },
        Exclude = { },
        Show = true,
    },
    RazorfenDowns = {
        Name = "Razorfen Downs",
        Short = "RFD",
        Keywords = { "razorfen%s*downs", "rfd" },
        Exclude = { },
        Show = true,
    },
    Uldaman = {
        Name = "Uldaman",
        Short = "Ulda",
        Keywords = { "uldaman", "ulda" },
        Exclude = { },
        Show = true,
    },
    ZulFarrak = {
        Name = "Zul'Farrak",
        Short = "ZF",
        Keywords = { "zul.?farrak", "zf" },
        Exclude = { },
        Show = true,
    },
    Maraudon = {
        Name = "Maraudon",
        Short = "Mara",
        Keywords = { "maraudon", "mara" },
        Exclude = { },
        Show = true,
    },
    SunkenTemple = {
        Name = "Sunken Temple",
        Short = "ST",
        Keywords = { "sunken", "%s+st%s+", "%s+st$" },
        Exclude = { },
        Show = true,
    },
    BlackrockDepths = {
        Name = "Blackrock Depths",
        Short = "BRD",
        Keywords = { "brd", "blackrock%s+depths" },
        Exclude = { },
        Show = true,
    },
    Scholomalance = {
        Name = "Scholomalance",
        Short = "Scholo",
        Keywords = { "scholomalance", "scholo" },
        Exclude = { },
        Show = true,
    },
    Stratholme = {
        Name = "Stratholme",
        Short = "Strat",
        Keywords = { "stratholme", "strat" },
        Exclude = { },
        Show = true,
    },
    LBRS = {
        Name = "LBRS",
        Short = "LBRS",
        Keywords = { "lbrs" },
        Exclude = { },
        Show = true,
    },
    UBRS = {
        Name = "UBRS",
        Short = "UBRS",
        Keywords = { "ubrs" },
        Exclude = { },
        Show = true,
    },

    -- TBA
--    DireMaul = {
--        Name = "Dire Maul",
--        Short = "DM",
--        Keywords = { "dm", "tribute" },
--        Exclude = { "vc", "cleef" },
--        Show = true,
--    },
}

function printInstances()
    for id, instance in InstanceMap do
        print(instance.Name .. ": " .. instance.Short)
    end
end

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
