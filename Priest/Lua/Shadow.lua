local _G, setmetatable           = _G, setmetatable
local TMW                        = _G.TMW
local Action                     = _G.Action
local Create                     = Action.Create

-- Defs i might need later

--local CNDT              = TMW.CNDT
--local Env               = CNDT.Env
--local Player            = Action.Player
--local BurstIsON         = Action.BurstIsON
--local MultiUnits        = Action.MultiUnits
--local ActiveUnitPlates  = MultiUnits:GetActiveUnitPlates()
--local GetToggle         = Action.GetToggle
--local player            = "player"
--local target            = "target"
--local targettarget      = "targettarget"
--local mouseover         = "mouseover"
--local focustarget       = "focustarget"
--local focus             = "focus"

Action[Action.PlayerClass] = {
    -- Base Abilities
    BindingHeal = Create({ Type = "Spell", ID = 32546 }),
    DispelMagic = Create({ Type = "Spell", ID = 528 }),
    Fade = Create({ Type = "Spell", ID = 586 }),
    FearWard = Create({ Type = "Spell", ID = 6346 }),
    FlashHeal = Create({ Type = "Spell", ID = 2061 }),
    HymnOfHope = Create({ Type = "Spell", ID = 64901 }),
    InnerFire = Create({ Type = "Spell", ID = 588 }),
    InnerWill = Create({ Type = "Spell", ID = 73413 }),
    LeapOfFaith = Create({ Type = "Spell", ID = 73325 }),
    Levitate = Create({ Type = "Spell", ID = 1706 }),
    MassDispel = Create({ Type = "Spell", ID = 32375 }),
    MassRessurection = Create({ Type = "Spell", ID = 83968 }),
    PWS = Create({ Type = "Spell", ID = 17 }),
    MindSear = Create({ Type = "Spell", ID = 48045 }),
    MindVision = Create({ Type = "Spell", ID = 2096 }),
    PWF = Create({ Type = "Spell", ID = 21562 }),
    POM = Create({ Type = "Spell", ID = 33076 }),
    PsychicScream = Create({ Type = "Spell", ID = 8122 }),
    Renew = Create({ Type = "Spell", ID = 139 }),
    Resurrection = Create({ Type = "Spell", ID = 2006 }),
    ShackleUndead = Create({ Type = "Spell", ID = 9484 }),
    SWD = Create({ Type = "Spell", ID = 32379 }),
    SWP = Create({ Type = "Spell", ID = 589 }),
    ShadowFiend = Create({ Type = "Spell", ID = 34433 }),
    Smite = Create({ Type = "Spell", ID = 585 }),   
    
    -- Shadow Abilities
    MindFlay = Create({ Type = "Spell", ID = 15407 }),
    MindBlast = Create({ Type = "Spell", ID = 8092 }),
    ShadowForm = Create({ Type = "Spell", ID = 15473 }),
    Silence = Create({ Type = "Spell", ID = 15487 }),
    MindSpike = Create({ Type = "Spell", ID = 73510 }),
    VampTouch = Create({ Type = "Spell", ID = 34914 }),
    Dispersion = Create({ Type = "Spell", ID = 47585 }),
    PsychicHorror = Create({ Type = "Spell", ID = 64044 }),
    VampEmbrace = Create({ Type = "Spell", ID = 15286 }),
    DevouringPlague = Create({ Type = "Spell", ID = 2944 }),
    VoidShift = Create({ Type = "Spell", ID = 142723 }),
    
    -- Buffs
    ShadowOrbs = Create({ Type = "Spell", ID = 95740 }),    
    
    -- Debuffs
    
    -- Talents
    VoidTendrils = Create({ Type = "Spell", ID = 108920 }),
    Psyfiend = Create({ Type = "Spell", ID = 108921 }),
    DominateMind = Create({ Type = "Spell", ID = 605 }),
    BodyandSoul = Create({ Type = "Spell", ID = 64129 }),
    AngelicFeather = Create({ Type = "Spell", ID = 121536 }),
    Phantasm = Create({ Type = "Spell", ID = 108942 }),
    FDCL = Create({ Type = "Spell", ID = 109186 }),
    Mindbender = Create({ Type = "Spell", ID = 123040 }),
    Solace = Create({ Type = "Spell", ID = 139139 }),
    DesperatePrayer = Create({ Type = "Spell", ID = 19236 }),
    SpectralGuise = Create({ Type = "Spell", ID = 112833 }),
    AngelicBulwark = Create({ Type = "Spell", ID = 108945 }),    
    TwistOfFate = Create({ Type = "Spell", ID = 109142 }),
    PowerInfusion = Create({ Type = "Spell", ID = 10060 }),
    DivineInsight = Create({ Type = "Spell", ID = 109175 }),
    Cascade = Create({ Type = "Spell", ID = 121135 }),
    DivineStar = Create({ Type = "Spell", ID = 110744 }),
    Halo = Create({ Type = "Spell", ID = 120517 }),
    
    -- Racials
    QuakingPalm = Create({ Type = "Spell", ID = 107719 }),
}

local A = setmetatable(Action[Action.PlayerClass], { __index = Action })

A[1] = nil
A[2] = nil
A[3] = function(icon)
    
    local function DamageRotation(unit)         
        return A.MindFlay
    end
    
    if A.IsUnitEnemy("target") then
        local unit = "target"
        local action = DamageRotation(unit)        
        if action then            
            return action:Show(icon)        
        end
    end    
end
A[4] = nil
A[5] = nil
A[6] = nil
A[7] = nil
A[8] = nil

