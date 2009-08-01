
gdFont = CreateFrame("Frame", "gdFont");

local GD_FONT_NUMBER = "Interface\\AddOns\\eTweaks\\Fonts\\SKURRI.ttf";

function gdFont:ApplySystemFonts()

DAMAGE_TEXT_FONT = GD_FONT_NUMBER;

end

gdFont:SetScript("OnEvent",
		    function() 
		       if (event == "ADDON_LOADED") then
			  gdFont:ApplySystemFonts()
		       end
		    end);
gdFont:RegisterEvent("ADDON_LOADED");

gdFont:ApplySystemFonts()