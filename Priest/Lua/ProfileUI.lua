local _G                         = _G
local Action                     = _G.Action
local A                          = Action

-- Defs I might need later

--local Player = Action.Player
--local Listener = Action.Listener
--local GetToggle = Action.GetToggle
--local GetSpellTexture = TMW.GetSpellTexture

A.Data.ProfileEnabled[A.CurrentProfile] = true 

A.Data.ProfileUI = {
    DateTime = "recently updated",
    [2] = {
        {
            {
                E = "Header",
                L = {
                    enUS = "Priest yeetlol",                        
                },
                S = 14,
            },
        },
    }
}

