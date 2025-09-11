local _G, setmetatable           = _G, setmetatable
local TMW = _G.TMW
local Action = _G.Action
local GetToggle = Action.GetToggle
local GetGCD = Action.GetGCD
local GetCurrentGCD = Action.GetCurrentGCD
local BurstIsON = Action.BurstIsON
local EnemyTeam = Action.EnemyTeam
local Player = Action.Player
local MultiUnits = Action.MultiUnits
local Unit = Action.Unit
local IsMounted = _G.IsMounted
local UnitCanAttack = _G.UnitCanAttack
local UnitDetailedThreatSituation = _G.UnitDetailedThreatSituation
local IsResting = _G.IsResting
local InCombatLockdown = _G.InCombatLockdown
local IsUsableSpell = _G.IsUsableSpell
local CombatLogGetCurrentEventInfo = _G.CombatLogGetCurrentEventInfo
local UnitGUID = _G.UnitGUID
local player = "player"
local target = "target"

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
local function TargetRotation(icon, unit)
    local targetUnit = Action.Unit(unit)
    if not A.IsUnitEnemy(unit) then
        return false
    end
    if not targetUnit:IsExists() then
        return false
    end
    if targetUnit:IsDead() then
        return false
    end
    if not A.MindBlast:IsSpellInRange(unit) then
        return false
    end
    local shadowOrbs = UnitPower("player", 6) or 0
    local targetHP = targetUnit:HealthPercent()
    local hasTwistOfFate = Action.Unit("player"):HasBuffs(A.TwistOfFate.ID) > 0
    local hasPowerInfusion = Action.Unit("player"):HasBuffs(A.PowerInfusion.ID) > 0
    local hasDivineInsight = Action.Unit("player"):HasBuffs(A.DivineInsight.ID) > 0
    local nearbyEnemies = Action.MultiUnits:GetByRange(10, 5)
    if nearbyEnemies >= 6 then
        if A.MindSear:IsReady(unit) and A.MindSear:IsSpellInRange(unit) then
            return A.MindSear:Show(icon)
        end
        return false
    end
    if A.PowerInfusion:IsReady(unit) and A.PowerInfusion:IsSpellInRange(unit) then
        return A.PowerInfusion:Show(icon)
    end
    if targetHP <= 20 and A.SWD:IsReady(unit) and A.SWD:IsSpellInRange(unit) then
        return A.SWD:Show(icon)
    end
    if shadowOrbs >= 3 and A.DevouringPlague:IsReady(unit) and A.DevouringPlague:IsSpellInRange(unit) then
        return A.DevouringPlague:Show(icon)
    end
    if A.MindBlast:IsReady(unit) and A.MindBlast:IsSpellInRange(unit) then
        return A.MindBlast:Show(icon)
    end
    if A.ShadowFiend:IsReady(unit) and A.ShadowFiend:IsSpellInRange(unit) then
        return A.ShadowFiend:Show(icon)
    end
    if A.Mindbender:IsReady(unit) and A.Mindbender:IsSpellInRange(unit) then
        return A.Mindbender:Show(icon)
    end
    if A.Halo:IsReady(unit) and A.Halo:IsSpellInRange(unit) then
        return A.Halo:Show(icon)
    end
    if A.DivineStar:IsReady(unit) and A.DivineStar:IsSpellInRange(unit) then
        return A.DivineStar:Show(icon)
    end
    if A.Cascade:IsReady(unit) and A.Cascade:IsSpellInRange(unit) then
        return A.Cascade:Show(icon)
    end
    local swpDuration = targetUnit:HasDeBuffs(A.SWP.ID)
    if A.SWP:IsReady(unit) and A.SWP:IsSpellInRange(unit) and swpDuration == 0 then
        return A.SWP:Show(icon)
    end
    local vtDuration = targetUnit:HasDeBuffs(A.VampTouch.ID)
    if A.VampTouch:IsReady(unit) and A.VampTouch:IsSpellInRange(unit) and vtDuration == 0 then
        return A.VampTouch:Show(icon)
    end
    if A.Solace:IsReady(unit) and A.Solace:IsSpellInRange(unit) then
        return A.Solace:Show(icon)
    end
    local dpDuration = targetUnit:HasDeBuffs(A.DevouringPlague.ID)
    if A.MindFlay:IsReady(unit) and A.MindFlay:IsSpellInRange(unit) and dpDuration > 0 then
        return A.MindFlay:Show(icon)
    end
    if nearbyEnemies >= 2 and A.MindSear:IsReady(unit) and A.MindSear:IsSpellInRange(unit) then
        return A.MindSear:Show(icon)
    end
    if A.MindFlay:IsReady(unit) and A.MindFlay:IsSpellInRange(unit) then
        return A.MindFlay:Show(icon)
    end
    return false
end

A[3] = function(icon)
    local isInShadowForm = Action.Unit("player"):HasBuffs(A.ShadowForm.ID) > 0
    local hasInnerFire = Action.Unit("player"):HasBuffs(A.InnerFire.ID) > 0
    if not isInShadowForm and A.ShadowForm:IsReady() then
        return A.ShadowForm:Show(icon)
    end
    if not hasInnerFire and A.InnerFire:IsReady() then
        return A.InnerFire:Show(icon)
    end
    return TargetRotation(icon, "target")
end
A[4] = nil
A[5] = nil
A[6] = nil
A[7] = nil
A[8] = nil

