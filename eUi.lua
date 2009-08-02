--[[ sThreatMeter settings ]]
local UploadThreat = function()
    if(sThreatMeter_Data) then table.wipe(sThreatMeter_Data) end

    sThreatMeter_Data = {
        ["MyThreatIndicator"] = {1, 0, 0},
        ["Direction"] = "down",
        ["Point"] = {"RIGHT", nil, "RIGHT", -398.2596913779626, -86.65374466981308},
        ["Animation"] = 1,
        ["Color"] = {1, 1, 1, 1},
        ["FontShadowAlpha"] = 0,
        ["Texture"] = "Interface\\Addons\\eTex\\MyMedia\\Bars\\Empt.tga",
        ["Width"] = 240,
        ["TextRight"] = "$name",
        ["Font"] = {"Interface\\Addons\\eTex\\MyMedia\\Fonts\\MARK.TTF", 9, "OUTLINE"},
        ["TextLeft"] = "$perc : $shortvalue",
        ["Spacing"] = 0,
        ["Height"] = 15,
        ["Bars"] = 5,
        ["BackgroundColor"] = {0.5, 0.5, 0.5, 0.7},
        ["MyThreatIndicatorColor"] = {0.3, 0.5, 0.3},
    }
    
    sThreatMeter_Data["eUi_setiings"] = true
end

--[[ DBM settings ]]
local _, class = UnitClass("player")
local t = RAID_CLASS_COLORS[class]
local r, g, b = t.r, t.g, t.b

local UploadBoss = function()
    if(DBM_SavedOptions) then table.wipe(DBM_SavedOptions) end

    DBM_SavedOptions = {
        ["ShowMinimapButton"] = false,
        ["ShowWarningsInChat"] = true,
        ["RangeFramePoint"] = "CENTER",
        ["RaidWarningSound"] = "Sound\\Doodad\\BellTollNightElf.wav",
        ["SpecialWarningSound"] = "Sound\\Spells\\PVPFlagTaken.wav",
        ["AutoRespond"] = true,
        ["StatusEnabled"] = true,
        ["RaidWarningPosition"] = {["Y"] = -22, ["X"] = 0, ["Point"] = "TOP"},
        ["Enabled"] = true,
        ["RangeFrameX"] = 20,
        ["RangeFrameY"] = -100,
        ["WarningIconLeft"] = false,
        ["WarningColors"] = {{["b"] = b, ["g"] = g, ["r"] = r,},
                             {["b"] = b, ["g"] = g, ["r"] = r,},
                             {["b"] = b, ["g"] = g, ["r"] = r,},
                             {["b"] = b, ["g"] = g, ["r"] = r,},},
        ["WarningIconRight"] = false,
        ["ShowFakedRaidWarnings"] = false,
        ["ShowMinimapButton"] = true,
        ["HPFramePoint"] = "TOPLEFT",
        ["HPFrameX"] = 100,
        ["HPFrameY"] = -180,
        ["SpamBlockRaidWarning"] = true,
        ["SpamBlockBossWhispers"] = false,
        ["HideBossEmoteFrame"] = false,
    }

    if(DBT_SavedOptions) then table.wipe(DBT_SavedOptions) end

    DBT_SavedOptions = {
        ["DBM"] = {
            ["StartColorR"] = 0.5137254901960784,
            ["StartColorG"] = 1,
            ["StartColorB"] = 0.4588235294117647,
            ["EndColorR"] = 0.5607843137254902,
            ["EndColorG"] = 1,
            ["EndColorB"] = 0.4588235294117647,
            ["Scale"] = 1,
            ["Width"] = 325,
            ["TimerX"] = 196.3231020780078,
            ["TimerY"] = 245.3734326926976,
            ["BarXOffset"] = 0,
            ["BarYOffset"] = -3,
            ["IconLeft"] = false,
            ["IconRight"] = false,
            ["ExpandUpwards"] = true,
            ["Texture"] = "Interface\\Addons\\eTex\\MyMedia\\Bars\\dP.tga",
            ["HugeBarsEnabled"] = false,
            ["HugeBarXOffset"] = 0,
            ["HugeBarYOffset"] = 0,
            ["HugeWidth"] = 200,
            ["HugeTimerY"] = -190,
            ["HugeTimerPoint"] = "TOPLEFT",
            ["HugeTimerX"] = 150,
            ["HugeScale"] = 1.05,
            ["TimerPoint"] = "BOTTOMLEFT",
        },
    }

    DBM_SavedOptions["eUi_setiings"] = true
    DBM_SavedOptions["ShowMinimapButton"] = false
end

--[[ Slash commands handling ]]
local pr = function(msg)
    print("|cff00ffffALZA UI:|r", tostring(msg))
end

SLASH_eUi1 = "/eUi"
SlashCmdList["eUi"] = function(msg)
    if(msg=="boss") then
        UploadBoss()
        ReloadUI()
    elseif(msg=="threat") then
        UploadThreat()
        ReloadUI()
    elseif(msg=="all") then
        UploadBoss()
        UploadThreat()
        ReloadUI()
    else
        pr("use |cff00ffff/eUi boss|r to upload DBM settings.")
        pr("use |cff00ffff/eUi threat|r to upload sThreatMeter2 settings.")
        pr("use |cff00ffff/eUi all|r to apply all settings at once.")
    end
end

--[[ Report that everything is ok ]]
local f = CreateFrame"Frame"
f:RegisterEvent"PLAYER_LOGIN"
f:SetScript("OnEvent", function()
    if(DBM_SavedOptions and DBM_SavedOptions["eUi_setiings"]) then
        pr("DBM settings changed.")
    end
    if(sThreatMeter_Data and sThreatMeter_Data["eUi_setiings"]) then
        pr("sThreatMeter2 settings changed.")
    end
end)