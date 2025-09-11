local _G, setmetatable           = _G, setmetatable
local TMW                        = _G.TMW
local Action                     = _G.Action
local CONST                      = Action.CONST
local ACTION_CONST_PRIEST_SHADOW = CONST.PRIEST_SHADOW
local unit                       = Action.Unit
local target                     = "target"

-- Defs i might need later

--local CNDT              = TMW.CNDT
--local Env               = CNDT.Env
--local Player            = Action.Player
--local BurstIsON         = Action.BurstIsON
--local MultiUnits        = Action.MultiUnits
--local ActiveUnitPlates  = MultiUnits:GetActiveUnitPlates()
--local GetToggle         = Action.GetToggle
--local player            = "player"
--local targettarget      = "targettarget"
--local mouseover         = "mouseover"
--local focustarget       = "focustarget"
--local focus             = "focus"



local A = setmetatable(Action[ACTION_CONST_PRIEST_SHADOW], { __index = Action })

A[1] = nil
A[2] = nil
A[3] = function(icon)
    
    local function DamageRotation(unit)         
        return A.MindFlay:Show(icon)        
    end
    
    if A.IsUnitEnemy(target) then
        unit = target        
        if DamageRotation(unit) then
            return true            
        end
    end
    
end
A[4] = nil
A[5] = nil
A[6] = nil
A[7] = nil
A[8] = nil

