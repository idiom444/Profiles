local _G, setmetatable           = _G, setmetatable
local TMW = _G.TMW
local Action = _G.Action
local Create = Action.Create
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
    ShadowOrbs = Create({ Type = "Spell", ID = 95740 }),    
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
    QuakingPalm = Create({ Type = "Spell", ID = 107719 }),
    Lightweave = Create({ Type = "Spell", ID = 55637 }),
    Darkglow = Create({ Type = "Spell", ID = 55775 }),
    SynapseSprings = Create({ Type = "Spell", ID = 96230 }),
    JadeSpirit = Create({ Type = "Spell", ID = 104993 }),
    Windsong = Create({ Type = "Spell", ID = 104423 }),
    WindsongCrit = Create({ Type = "Spell", ID = 104424 }),
    WindsongHaste = Create({ Type = "Spell", ID = 104425 }),
    WindsongMastery = Create({ Type = "Spell", ID = 104426 }),
    LightOfTheCosmos = Create({ Type = "Spell", ID = 126659 }),
    RelicOfYuLon = Create({ Type = "Spell", ID = 126577 }),
    JadeMagistrateFigurine = Create({ Type = "Spell", ID = 126605 }),
    BlossomOfPureSnow = Create({ Type = "Spell", ID = 126588 }),
    VisionOfThePredator = Create({ Type = "Spell", ID = 138703 }),
    Bloodlust = Create({ Type = "Spell", ID = 2825 }),
    Heroism = Create({ Type = "Spell", ID = 32182 }),
    TimeWarp = Create({ Type = "Spell", ID = 80353 }),
    AncientHysteria = Create({ Type = "Spell", ID = 90355 }),
    SkullBanner = Create({ Type = "Spell", ID = 114203 }),
}

local A = setmetatable(Action[Action.PlayerClass], { __index = Action })

A[1] = nil
A[2] = nil
local lastDamageCalculation = 0
local lastBuffCount = 0
local damageIncreaseThreshold = 0.15

local function getCurrentSpellPower()
    local intellect = UnitStat("player", 4) or 0
    local spellPower = intellect * 1.0
    local baseSpellPower = GetSpellBonusDamage(6) or 0
    spellPower = spellPower + baseSpellPower
    return spellPower
end

local function getCurrentCritChance()
    local critRating = GetCombatRating(9) or 0
    local critChance = critRating / 600
    return critChance
end

local function calculateCurrentDamage()
    local spellPower = getCurrentSpellPower()
    local critChance = getCurrentCritChance()
    local baseDamage = spellPower * (1 + critChance)
    return baseDamage
end

local function hasNewBuffs()
    local currentBuffCount = 0
    local i = 1
    while UnitBuff("player", i) do
        currentBuffCount = currentBuffCount + 1
        i = i + 1
    end
    if currentBuffCount ~= lastBuffCount then
        lastBuffCount = currentBuffCount
        return true
    end
    return false
end

local function shouldSnapshotDoT(unit, dotID, currentDotRemain)
    if currentDotRemain > 3 then
        return false
    end
    if hasNewBuffs() then
        local currentDamage = calculateCurrentDamage()
        local damageIncrease = (currentDamage - lastDamageCalculation) / lastDamageCalculation
        lastDamageCalculation = currentDamage
        if damageIncrease >= damageIncreaseThreshold then
            return true
        end
    end
    return false
end

if lastDamageCalculation == 0 then
    lastDamageCalculation = calculateCurrentDamage()
end

local function SingleTargetRotation(icon, unit)
    if not A.IsUnitEnemy(unit) then
        return false
    end
    if not Action.Unit(unit):IsExists() then
        return false
    end
    if Action.Unit(unit):IsDead() then
        return false
    end
    if not A.MindBlast:IsSpellInRange(unit) then
        return false
    end
    local shadowOrbs = UnitPower("player", Enum.PowerType.ShadowOrbs) or 0
    local targetHP = Action.Unit(unit):HealthPercent()
    local hasTwistOfFate = Action.Unit("player"):HasBuffs(A.TwistOfFate.ID) > 0
    local hasPowerInfusion = Action.Unit("player"):HasBuffs(A.PowerInfusion.ID) > 0
    local hasDivineInsight = Action.Unit("player"):HasBuffs(A.DivineInsight.ID) > 0
    local swpRemain = Action.Unit(unit):HasDeBuffs(A.SWP.ID, true)
    local vtRemain = Action.Unit(unit):HasDeBuffs(A.VampTouch.ID, true)
    local dpRemain = Action.Unit(unit):HasDeBuffs(A.DevouringPlague.ID, true)
    local isCastingVT = Action.Unit("player"):IsCasting() and Action.Unit("player"):IsCasting(A.VampTouch.ID)
    local isChannelingMF = UnitChannelInfo("player") == GetSpellInfo(A.MindFlay.ID)
    
    if A.PowerInfusion:IsReady(unit) and A.PowerInfusion:IsSpellInRange(unit) then
        if isChannelingMF then
            Action.StopCasting()
        end
        return A.PowerInfusion:Show(icon)
    end
    if targetHP <= 20 and A.SWD:IsReady(unit) and A.SWD:IsSpellInRange(unit) then
        if isChannelingMF then
            Action.StopCasting()
        end
        return A.SWD:Show(icon)
    end
    if A.SWP:IsReady(unit) and A.SWP:IsSpellInRange(unit) then
        if not swpRemain or swpRemain <= 3 then
            if isChannelingMF then
                Action.StopCasting()
            end
            return A.SWP:Show(icon)
        else
            local shouldSnapshot = shouldSnapshotDoT(unit, A.SWP.ID, swpRemain)
            if shouldSnapshot then
                if isChannelingMF then
                    Action.StopCasting()
                end
                return A.SWP:Show(icon)
            end
        end
    end
    if A.VampTouch:IsReady(unit) and A.VampTouch:IsSpellInRange(unit) and not isCastingVT then
        if not vtRemain or vtRemain <= 3 then
            if isChannelingMF then
                Action.StopCasting()
            end
            return A.VampTouch:Show(icon)
        else
            local shouldSnapshot = shouldSnapshotDoT(unit, A.VampTouch.ID, vtRemain)
            if shouldSnapshot then
                if isChannelingMF then
                    Action.StopCasting()
                end
                return A.VampTouch:Show(icon)
            end
        end
    end
    if shadowOrbs >= 3 and A.DevouringPlague:IsReady(unit) and A.DevouringPlague:IsSpellInRange(unit) then
        if isChannelingMF then
            Action.StopCasting()
        end
        return A.DevouringPlague:Show(icon)
    end
    if A.MindBlast:IsReady(unit) and A.MindBlast:IsSpellInRange(unit) then
        if isChannelingMF then
            Action.StopCasting()
        end
        return A.MindBlast:Show(icon)
    end
    if dpRemain and dpRemain > 0 and A.MindFlay:IsReady(unit) and A.MindFlay:IsSpellInRange(unit) then
        return A.MindFlay:Show(icon)
    end
    if A.ShadowFiend:IsReady(unit) and A.ShadowFiend:IsSpellInRange(unit) then
        if isChannelingMF then
            Action.StopCasting()
        end
        return A.ShadowFiend:Show(icon)
    end
    if A.Mindbender:IsReady(unit) and A.Mindbender:IsSpellInRange(unit) then
        if isChannelingMF then
            Action.StopCasting()
        end
        return A.Mindbender:Show(icon)
    end
    if A.Halo:IsReady(unit) and A.Halo:IsSpellInRange(unit) then
        if isChannelingMF then
            Action.StopCasting()
        end
        return A.Halo:Show(icon)
    end
    if A.DivineStar:IsReady(unit) and A.DivineStar:IsSpellInRange(unit) then
        if isChannelingMF then
            Action.StopCasting()
        end
        return A.DivineStar:Show(icon)
    end
    if A.Cascade:IsReady(unit) and A.Cascade:IsSpellInRange(unit) then
        if isChannelingMF then
            Action.StopCasting()
        end
        return A.Cascade:Show(icon)
    end
    if A.Solace:IsReady(unit) and A.Solace:IsSpellInRange(unit) then
        if isChannelingMF then
            Action.StopCasting()
        end
        return A.Solace:Show(icon)
    end
    if A.MindFlay:IsReady(unit) and A.MindFlay:IsSpellInRange(unit) then
        return A.MindFlay:Show(icon)
    end
    return false
end

local function AoERotation(icon, unit)
    if not A.IsUnitEnemy(unit) then
        return false
    end
    if not Action.Unit(unit):IsExists() then
        return false
    end
    if Action.Unit(unit):IsDead() then
        return false
    end
    if not A.MindSear:IsSpellInRange(unit) then
        return false
    end
    local nearbyEnemies = Action.MultiUnits:GetByRange(10, 5)
    if nearbyEnemies >= 6 then
        if A.MindSear:IsReady(unit) and A.MindSear:IsSpellInRange(unit) then
            return A.MindSear:Show(icon)
        end
        return false
    end
    if nearbyEnemies >= 2 and A.MindSear:IsReady(unit) and A.MindSear:IsSpellInRange(unit) then
        return A.MindSear:Show(icon)
    end
    return false
end

local function BuffCheck()
    local isInShadowForm = Action.Unit("player"):HasBuffs(A.ShadowForm.ID) > 0
    local hasInnerFire = Action.Unit("player"):HasBuffs(A.InnerFire.ID) > 0
    if not isInShadowForm and A.ShadowForm:IsReady() then
        return A.ShadowForm:Show(icon)
    end
    if not hasInnerFire and A.InnerFire:IsReady() then
        return A.InnerFire:Show(icon)
    end
    return false
end

A[3] = function(icon)
    local buffs = BuffCheck()
    if buffs then
        return buffs
    end
    local nearbyEnemies = Action.MultiUnits:GetByRange(10, 5)
    local rotationSpell = nearbyEnemies >= 2 and AoERotation(icon,"target") or SingleTargetRotation(icon, "target")
    if rotationSpell then
        return rotationSpell
    end
end
A[4] = nil
A[5] = nil
A[6] = nil
A[7] = nil
A[8] = nil

