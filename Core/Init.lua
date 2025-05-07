VUI = {}
VUI.modules = {}

-- Simple module loader
function VUI:RegisterModule(name, func)
    self.modules[name] = func
end

function VUI:Initialize()
    for name, initFunc in pairs(self.modules) do
        initFunc()
    end
end

-- Load event
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:RegisterEvent("PLAYER_LOGIN")

f:SetScript("OnEvent", function(_, event, addon)
    if event == "ADDON_LOADED" and addon == "VUI" then
        VUIDB = VUIDB or {}
        VUICharDB = VUICharDB or {}
    elseif event == "PLAYER_LOGIN" then
        VUI:Initialize()
    end
end)
