local _G, setmetatable = _G, setmetatable
local TMW = _G.TMW
local Action = _G.Action
local Create = Action.Create
local Listener = Action.Listener
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
    Halo = Create({ Type = "Spell", ID = 120644 }),
    QuakingPalm = Create({ Type = "Spell", ID = 107719 }),
    Insanity = Create({ Type = "Spell", ID = 129197 }),
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
local swaps = 0
local lastEnemyCount = 0
A[1] = nil
A[2] = nil
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
    swaps = 0
    local shadowOrbs = UnitPower("player", Enum.PowerType.ShadowOrbs) or 0
    local targetHP = Action.Unit(unit):HealthPercent()
    local swpRemain = Action.Unit(unit):HasDeBuffs(A.SWP.ID, true)
    local vtRemain = Action.Unit(unit):HasDeBuffs(A.VampTouch.ID, true)
    local dpRemain = Action.Unit(unit):HasDeBuffs(A.DevouringPlague.ID, true)
    local insanityRemain = Action.Unit(unit):HasDeBuffs(A.Insanity.ID, true)
    local isCastingVT = Action.Unit("player"):IsCasting() and Action.Unit("player"):IsCasting(A.VampTouch.ID)
    local channelingSpell = Action.Player:IsChanneling()
    local isChannelingMF = channelingSpell == GetSpellInfo(A.MindFlay.ID)
    if dpRemain == 0 and insanityRemain == 0 and A.PowerInfusion:IsReady(unit) and A.PowerInfusion:IsSpellInRange(unit) then
        if isChannelingMF then
            return A:Show(icon, Action.Const.STOPCAST)
        end
        return A.PowerInfusion:Show(icon)
    end
    if dpRemain == 0 and insanityRemain == 0 and A.ShadowFiend:IsReady(unit) and A.ShadowFiend:IsSpellInRange(unit) then
        if isChannelingMF then
            return A:Show(icon, Action.Const.STOPCAST)
        end
        return A.ShadowFiend:Show(icon)
    end
    if dpRemain == 0 and insanityRemain == 0 and A.Mindbender:IsReady(unit) and A.Mindbender:IsSpellInRange(unit) then
        if isChannelingMF then
            return A:Show(icon, Action.Const.STOPCAST)
        end
        return A.Mindbender:Show(icon)
    end
    if dpRemain == 0 and shadowOrbs < 3 and targetHP <= 20 and insanityRemain == 0 and A.SWD:IsReady(unit) and A.SWD:IsSpellInRange(unit) then
        if isChannelingMF then
            return A:Show(icon, Action.Const.STOPCAST)
        end
        return A.SWD:Show(icon)
    end
    if dpRemain == 0 and insanityRemain == 0 and A.SWP:IsSpellInRange(unit) then
        if not swpRemain or swpRemain <= 3 then
            if isChannelingMF then
                return A:Show(icon, Action.Const.STOPCAST)
            end
            return A.SWP:Show(icon)
        end
    end
    if dpRemain == 0 and insanityRemain == 0 and A.VampTouch:IsReady(unit) and A.VampTouch:IsSpellInRange(unit) and not isCastingVT and (swpRemain and swpRemain >= 3) then
        if not vtRemain or vtRemain <= 3 then
            if isChannelingMF then
                return A:Show(icon, Action.Const.STOPCAST)
            end
            return A.VampTouch:Show(icon)
        end
    end
    if dpRemain == 0 and shadowOrbs >= 3 and insanityRemain == 0 and A.DevouringPlague:IsReady(unit) and A.DevouringPlague:IsSpellInRange(unit) and (vtRemain and vtRemain >= 3) and (swpRemain and swpRemain >= 3) then
        if isChannelingMF then
            return A:Show(icon, Action.Const.STOPCAST)
        end
        return A.DevouringPlague:Show(icon)
    end
    if dpRemain == 0 and shadowOrbs < 3 and insanityRemain == 0 and A.MindBlast:IsReady(unit) and A.MindBlast:IsSpellInRange(unit) and (vtRemain and vtRemain >= 3) and (swpRemain and swpRemain >= 3) then
        if isChannelingMF then
            return A:Show(icon, Action.Const.STOPCAST)
        end
        return A.MindBlast:Show(icon)
    end
    if dpRemain == 0 and shadowOrbs < 3 and insanityRemain == 0 and A.Halo:IsTalentLearned() and A.Halo:GetCooldown() == 0 and A.MindFlay:IsSpellInRange(unit) and (vtRemain and vtRemain >= 3) and (swpRemain and swpRemain >= 3) then
        if isChannelingMF then
            return A:Show(icon, Action.Const.STOPCAST)
        end
        return A.Halo:Show(icon)
    end
    if dpRemain == 0 and shadowOrbs < 3 and insanityRemain == 0 and A.DivineStar:IsTalentLearned() and A.DivineStar:GetCooldown() == 0 and A.MindFlay:IsSpellInRange(unit) and (vtRemain and vtRemain >= 3) and (swpRemain and swpRemain >= 3) then
        if isChannelingMF then
            return A:Show(icon, Action.Const.STOPCAST)
        end
        return A.DivineStar:Show(icon)
    end
    if dpRemain == 0 and shadowOrbs < 3 and insanityRemain == 0 and A.Cascade:IsTalentLearned() and A.Cascade:GetCooldown() == 0 and A.MindFlay:IsSpellInRange(unit) and (vtRemain and vtRemain >= 3) and (swpRemain and swpRemain >= 3) then
        if isChannelingMF then
            return A:Show(icon, Action.Const.STOPCAST)
        end
        return A.Cascade:Show(icon)
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
    local nearbyEnemies = Action.MultiUnits:GetByRangeInCombat(40)
    if nearbyEnemies ~= lastEnemyCount then
        swaps = 0
        lastEnemyCount = nearbyEnemies
    end
    if nearbyEnemies >= 6 then
        swaps = 0
        if A.MindSear:IsReady(unit) and A.MindSear:IsSpellInRange(unit) then
            return A.MindSear:Show(icon)
        end
        return false
    end
    if nearbyEnemies >= 2 then
        local currentSWP = Action.Unit(unit):HasDeBuffs(A.SWP.ID, true)
        local currentVT = Action.Unit(unit):HasDeBuffs(A.VampTouch.ID, true)
        local isCastingVT = Action.Unit("player"):IsCasting() and Action.Unit("player"):IsCasting(A.VampTouch.ID)
        local enemiesMissingSWP = Action.MultiUnits:GetByRangeMissedDoTs(10, nil, A.SWP.ID, 6)
        local enemiesMissingVT = Action.MultiUnits:GetByRangeMissedDoTs(10, nil, A.VampTouch.ID, 6)
        local needsSWP = not currentSWP or currentSWP <= 3
        local needsVT = not currentVT or currentVT <= 3
        if needsSWP and enemiesMissingSWP > 0 and A.SWP:IsReady(unit) and A.SWP:IsSpellInRange(unit) then
            return A.SWP:Show(icon)
        end
        if needsVT and currentSWP and enemiesMissingVT > 0 and A.VampTouch:IsReady(unit) and A.VampTouch:IsSpellInRange(unit) and not isCastingVT then
            return A.VampTouch:Show(icon)
        end
        local currentTargetComplete = (not needsSWP) and (not needsVT)
        local totalTargetsNeedingDoTs = math.max(enemiesMissingSWP, enemiesMissingVT)
        if currentTargetComplete and totalTargetsNeedingDoTs > 0 and swaps < totalTargetsNeedingDoTs then
            swaps = swaps + 1
            return A:Show(icon, Action.Const.AUTOTARGET)
        end
        if nearbyEnemies == 5 then
            if A.MindSear:IsReady(unit) and A.MindSear:IsSpellInRange(unit) then
                return A.MindSear:Show(icon)
            end
        else
            return SingleTargetRotation(icon, unit)
        end
        if swaps >= nearbyEnemies then
            swaps = 0
        end
    end
    return false
end
local function BuffCheck(icon)
    local isInShadowForm = Action.Unit("player"):HasBuffs(A.ShadowForm.ID) > 0
    local hasInnerFire = Action.Unit("player"):HasBuffs(A.InnerFire.ID) > 0
    local hasPWF = Action.Unit("player"):HasBuffs(A.PWF.ID) > 0
    if not isInShadowForm and A.ShadowForm:IsReady() then
        return A.ShadowForm:Show(icon)
    end
    if not hasInnerFire and A.InnerFire:IsReady() then
        return A.InnerFire:Show(icon)
    end
    if not hasPWF and A.PWF:IsReady() then
        return A.PWF:Show(icon)
    end
    return false
end
local function MovementCheck(icon)
    if Action.Player:IsMoving() and A.AngelicFeather:IsReady() then
        return A.AngelicFeather:Show(icon)
    end
    return false
end
local function DefensiveCheck(icon)
    local playerHP = Action.Unit("player"):HealthPercent()
    local desperatePrayerHP = A.GetToggle(2, "DesperatePrayerHP")
    local dispersionHP = A.GetToggle(2, "DispersionHP")
    local useDispersion = A.GetToggle(2, "UseDispersion")
    if playerHP <= desperatePrayerHP and A.DesperatePrayer:IsReady() then
        return A.DesperatePrayer:Show(icon)
    end
    if useDispersion and playerHP <= dispersionHP and A.Dispersion:IsReady() then
        return A.Dispersion:Show(icon)
    end
    return false
end
A[3] = function(icon)
    local buffs = BuffCheck(icon)
    if buffs then
        return buffs
    end
    local defensive = DefensiveCheck(icon)
    if defensive then
        return defensive
    end
    local movement = MovementCheck(icon)
    if movement then
        return movement
    end
    local nearbyEnemies = Action.MultiUnits:GetByRange(40)
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

