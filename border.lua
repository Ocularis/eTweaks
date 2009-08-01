--Bottom Border Hooked to WorldFrame

local f = CreateFrame("Frame",nil,WorldFrame)
f:SetFrameStrata("MEDIUM")
f:SetWidth(1920) -- Set these to whatever height/width is needed 
f:SetHeight(12) -- for your Texture
local t = f:CreateTexture(nil,"BACKGROUND")
t:SetTexture(0, 0, 0 ,0.4)

t:SetAllPoints(f)
f.texture = t
f:SetPoint("BOTTOM", WorldFrame, "BOTTOM", 0, 0) -- Place it somewhere
f:Show() --And make it appear

local f2 = CreateFrame("Frame",nil,WorldFrame)
f2:SetFrameStrata("MEDIUM")
f2:SetWidth(1920) -- Set these to whatever height/width is needed 
f2:SetHeight(15) -- for your Texture
local t2 = f2:CreateTexture(nil,"BACKGROUND")
t2:SetTexture(0, 0, 0 ,0.4)

t2:SetAllPoints(f2)
f2.texture = t2
f2:SetPoint("BOTTOM", WorldFrame, "BOTTOM", 0, 0) -- Place it somewhere
f2:Show() --And make it appear


--Panel for hooking lynstats etc.

--[[

local f = CreateFrame("Frame",nil, UIParent)
f:SetFrameStrata("MEDIUM")
f:SetWidth(360) -- Set these to whatever height/width is needed 
f:SetHeight(15) -- for your Texture

local t = f:CreateTexture(nil,"BORDER")
t:SetTexture(0, 0, 0, 0.9)

t:SetAllPoints(f)
f.texture = t

f:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, 60) -- Place it somewhere
f:Show() --And make it appear

local f2 = CreateFrame("Frame",nil, UIParent)
f2:SetFrameStrata("LOW")
f2:SetWidth(362) -- Set these to whatever height/width is needed 
f2:SetHeight(17) -- for your Texture

local t2 = f2:CreateTexture(nil,"BACKGROUND")
t2:SetTexture(1, 1, 1, 0.6)

t2:SetAllPoints(f2)
f2.texture = t2

f2:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, 59) -- Place it somewhere
f2:Show() --And make it appear

]]
