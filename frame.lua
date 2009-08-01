
local raidaddons = {    -- Addons you use only in raids or groups
    "DBM-Core",
	"Recount",
	"oUF",
	}

local pvpaddons = {    -- Addons you use only in pvp
    "Recount",
}

--[[ Some slash commands ]]
SlashCmdList["CHANGEADDONS"] = function(s)
    if(s and s=="raid") then
        for i in pairs(pvpaddons) do
            DisableAddOn(pvpaddons[i])
        end
        for i in pairs(raidaddons) do
            EnableAddOn(raidaddons[i])
        end
        ReloadUI()
    elseif(s and s=="pvp") then
        for i in pairs(raidaddons) do
            DisableAddOn(raidaddons[i])
        end
        for i in pairs(pvpaddons) do
            EnableAddOn(pvpaddons[i])
        end
        ReloadUI()
    elseif(s and s=="solo") then
        for i in pairs(raidaddons) do
            DisableAddOn(raidaddons[i])
        end
        for i in pairs(pvpaddons) do
            DisableAddOn(pvpaddons[i])
        end
        ReloadUI()
    else
        print("|cff00ffffaSettings:|r Loading addon sets: /addons |cff00ffffset|r. Sets: raid, solo, pvp. Example: /addons |cff00ffffraid|r.")
        print("|cff00ffffaSettings:|r You can add or remove addons to sets by editing aSettings.lua file in aSettings addon folder.")
    end
end
SLASH_CHANGEADDONS1 = "/addons"

SlashCmdList["FRAME"] = function() print(GetMouseFocus():GetName()) end
SLASH_FRAME1 = "/gn"
SLASH_FRAME2 = "/frame"

SlashCmdList["GETPARENT"] = function() print(GetMouseFocus():GetParent():GetName()) end
SLASH_GETPARENT1 = "/gp"
SLASH_GETPARENT2 = "/parent"

SlashCmdList["RELOADUI"] = function() ReloadUI() end
SLASH_RELOADUI1 = "/rl"

SlashCmdList["RCSLASH"] = function() DoReadyCheck() end
SLASH_RCSLASH1 = "/rc"

SlashCmdList["TICKET"] = function() ToggleHelpFrame() end
SLASH_TICKET1 = "/ticket"
SLASH_TICKET2 = "/gm"

SlashCmdList["DISABLE_ADDON"] = function(s) DisableAddOn(s) end
SLASH_DISABLE_ADDON1 = "/dis"   -- You need to reload UI after enabling/disabling addon

SlashCmdList["ENABLE_ADDON"] = function(s) EnableAddOn(s) end
SLASH_ENABLE_ADDON1 = "/en"   -- You need to reload UI after enabling/disabling addon



-- How to use "smart mount" function:
-- Create a macro: /run Mountz(groundmount, flyingmount), replacing groundmount and flyingmount with names of mounts you want.
-- Example: /run Mountz("Black War Bear", "Plagued Proto-Drake")
-- Warning! If you have locale other than enGB, enUS or ruRU then you need to edit location names, check code below.
--[[ We like mounts! ]]
local DALARAN, UNDERBELLY, KRASUS, WINTERGRASP
local locale = GetLocale()
if(locale=="ruRU") then
	DALARAN = "???????"
	UNDERBELLY = "??????"
	KRASUS = "???????? ?????"
	WINTERGRASP = "????? ??????? ????"
--[[ Template for other locales
elseif(locale=="") then
	DALARAN = ""
	UNDERBELLY = ""
	KRASUS = ""
	WINTERGRASP = ""
]]
else
	DALARAN = "Dalaran" 
	UNDERBELLY = "The Underbelly"
	KRASUS = "Krasus' Landing" 
	WINTERGRASP = "Wintergrasp" 
end

function Mountz(groundmount, flyingmount)
    local num = GetNumCompanions("MOUNT")
    if not num or IsMounted() then
        Dismount()
        return
    end
    if CanExitVehicle() then 
        VehicleExit()
        return
    end
    local flyablex = (IsFlyableArea() and (not (GetZoneText()==DALARAN or GetZoneText()==WINTERGRASP) or GetSubZoneText()==KRASUS or GetSubZoneText()==UNDERBELLY) and (UnitLevel("player")>76 or GetCurrentMapContinent()==3))
    if IsAltKeyDown() then
        flyablex = not flyablex
    end
    for i=1, num, 1 do
        local _, info = GetCompanionInfo("MOUNT", i)
        if flyingmount and info == flyingmount and flyablex then
            CallCompanion("MOUNT", i)
            return
        elseif groundmount and info == groundmount and not flyablex then
            CallCompanion("MOUNT", i)
            return
        end
    end
end

-- Attempt to move the armored man