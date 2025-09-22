local _G, setmetatable = _G, setmetatable
local TMW = _G.TMW
local Action = _G.Action
local Create = Action.Create

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
    VoidShift = Create({ Type = "Spell", ID = 108968 }),
    ShadowOrbs = Create({ Type = "Spell", ID = 95740 }),
    VoidTendrils = Create({ Type = "Spell", ID = 108920 }),
    Psyfiend = Create({ Type = "Spell", ID = 108921 }),
    DominateMind = Create({ Type = "Spell", ID = 605 }),
    BodyandSoul = Create({ Type = "Spell", ID = 64129 }),
    AngelicFeather = Create({ Type = "Spell", ID = 121536 }),
    Phantasm = Create({ Type = "Spell", ID = 108942 }),
    FDCL = Create({ Type = "Spell", ID = 109186 }),
    Mindbender = Create({ Type = "Spell", ID = 123040 }),
    Solace = Create({ Type = "Spell", ID = 129250 }),
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
    HolyFire = Create({ Type = "Spell", ID = 14914 }),
    DarkIntent = Create({ Type = "Spell", ID = 109773 }),
    ChakraSerenity = Create({
        Type = "Spell",
        ID = 81208,
        Desc = "Chakra: Serenity",
        FixedTexture = 133658,
    }),
    ChakraSanctuary = Create({
        Type = "Spell", 
        ID = 81206,
        Desc = "Chakra: Sanctuary",
        FixedTexture = 133663,
    }),
    ChakraChastise = Create({
        Type = "Spell",
        ID = 81209,
        Desc = "Chakra: Chastise",
        FixedTexture = 133653,
    }),
    CircleOfHealing = Create({ Type = "Spell", ID = 34861 }),
    PrayerOfHealing = Create({ Type = "Spell", ID = 596 }),
    PrayerOfMending = Create({ Type = "Spell", ID = 33076 }),
    Lightwell = Create({ Type = "Spell", ID = 126135 }),
    DivineHymn = Create({ Type = "Spell", ID = 64843 }),
    Purify = Create({Type = "Spell", ID = 527}),
    HolyWordChastise = Create({
        Type = "Spell",
        ID = 88625,
        Desc = "Holy Word: Chastise",
        FixedTexture = 133650,
    }),
    HolyWordSanctuary = Create({
        Type = "Spell", 
        ID = 88685,
        Desc = "Holy Word: Sanctuary",
        FixedTexture = 133650,
    }),
    HolyWordSerenity = Create({
        Type = "Spell",
        ID = 88684,
        Desc = "Holy Word: Serenity", 
        FixedTexture = 133648 ,
    }),
    Penance = Create({Type = "Spell", ID = 47540}),
    PenanceDMG = Create({Type = "Spell", ID = 11416}),
    SpiritShell = Create({Type = "Spell", ID = 109964}),
    ArchAngel = Create({Type = "Spell", ID = 81700}),
    Evangelism = Create({Type = "Spell", ID = 81661}),
}

local A = setmetatable(Action[Action.PlayerClass], { __index = Action })

local currentSpec = Action.PlayerSpec
local lastEnemyCount = 0
local pomStackCount = 0
local vtCastStarted = false
local hymnCastStarted = false

local function getDotDuration(spellID)
    local baseDuration = 0
    local baseTickInterval = 0
    
    if spellID == A.VampTouch.ID then
        baseDuration = 15
        baseTickInterval = 3
    elseif spellID == A.SWP.ID then
        baseDuration = 18
        baseTickInterval = 3
    elseif spellID == A.DevouringPlague.ID then
        baseDuration = 6
        baseTickInterval = 2
    else
        return baseDuration
    end
    
    local hastePercent = GetCombatRatingBonus(CR_HASTE_SPELL) or 0
    local adjustedTickInterval = baseTickInterval / (1 + (hastePercent / 100))
    local numTicks = math.floor(baseDuration / adjustedTickInterval)
    local actualDuration = numTicks * adjustedTickInterval
    
    return actualDuration
end

local function shouldApplyDot(unit, spellID)
    local ttd = Action.Unit(unit):TimeToDie()
    local dotDuration = getDotDuration(spellID)
    return ttd > dotDuration
end

local function enemiesMissingSWPWithTTD()
    local count = 0
    local activeUnitPlates = Action.MultiUnits:GetActiveUnitPlates()
    
    for namePlateUnitID in pairs(activeUnitPlates) do
        local unit = Action.Unit(namePlateUnitID)
        if unit:IsEnemy() and 
           unit:IsExists() and 
           not unit:IsDead() and 
           not unit:IsTotem() and
           shouldApplyDot(namePlateUnitID, A.SWP.ID) then
            local swpRemain = unit:HasDeBuffs(A.SWP.ID, true)
            if not swpRemain or swpRemain < 3 then
                count = count + 1
            end
        end
    end
    
    return count
end

local function enemiesMissingVTWithTTD()
    local count = 0
    local activeUnitPlates = Action.MultiUnits:GetActiveUnitPlates()
    
    for namePlateUnitID in pairs(activeUnitPlates) do
        local unit = Action.Unit(namePlateUnitID)
        if unit:IsEnemy() and 
           unit:IsExists() and 
           not unit:IsDead() and 
           not unit:IsTotem() and
           shouldApplyDot(namePlateUnitID, A.VampTouch.ID) then
            local vtRemain = unit:HasDeBuffs(A.VampTouch.ID, true)
            if not vtRemain or vtRemain < 3 then
                count = count + 1
            end
        end
    end
    
    return count
end

local function totalTargetsNeedingDoTsWithTTD()
    return math.max(enemiesMissingSWPWithTTD(), enemiesMissingVTWithTTD())
end

local function dpCheck(unit)
    local dpRemain = Action.Unit(unit):HasDeBuffs(A.DevouringPlague.ID, true)
    local insanityRemain = Action.Unit(unit):HasDeBuffs(A.Insanity.ID, true)
    return dpRemain == 0 and insanityRemain == 0
end

local function vtCheck(unit)
    local vtRemain = Action.Unit(unit):HasDeBuffs(A.VampTouch.ID, true)
    return vtRemain and vtRemain >= 3
end

local function swpCheck(unit)
    local swpRemain = Action.Unit(unit):HasDeBuffs(A.SWP.ID, true)
    return swpRemain and swpRemain >= 3
end

local function swpNeedsRefresh(unit)
    local swpRemain = Action.Unit(unit):HasDeBuffs(A.SWP.ID, true)
    return not swpRemain or swpRemain < 3
end

local function vtNeedsRefresh(unit)
    local vtRemain = Action.Unit(unit):HasDeBuffs(A.VampTouch.ID, true)
    return not vtRemain or vtRemain < 3
end

local function talentCheck(spell)
    return spell:IsTalentLearned() and spell:GetCooldown() == 0
end

local function currentTargetComplete(unit)
    return not swpNeedsRefresh(unit) and not vtNeedsRefresh(unit)
end

local function enemiesWithinRangeOfTarget(targetUnit, range)
    local count = 0
    local activeUnitPlates = Action.MultiUnits:GetActiveUnitPlates()
    local rangeSquared = range * range
    
    for namePlateUnitID in pairs(activeUnitPlates) do
        local unit = Action.Unit(namePlateUnitID)
        if unit:IsEnemy() and 
        unit:IsExists() and 
        not unit:IsDead() and 
        not unit:IsTotem() then
            
            local distanceSquared = UnitDistanceSquared(namePlateUnitID, targetUnit)
            if distanceSquared and distanceSquared <= rangeSquared then
                count = count + 1
            end
        end
    end
    
    if Action.Unit("target"):IsEnemy() and targetUnit == "target" then
        count = count + 1
    end
    
    return count
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
    local channelingSpell = Action.Player:IsChanneling()
    local isChannelingMF = channelingSpell == GetSpellInfo(A.MindFlay.ID)
    local isMoving = Action.Player:IsMoving()

    if dpCheck(unit) and A.PowerInfusion:IsReady(unit) and A.PowerInfusion:IsSpellInRange(unit) and not isMoving then
        if isChannelingMF then
            return A:Show(icon, Action.Const.STOPCAST)
        end
        return A.PowerInfusion:Show(icon)
    end
    if dpCheck(unit) and A.BurstIsON(unit) and A.ShadowFiend:IsReady(unit) and A.ShadowFiend:IsSpellInRange(unit) then
        if isChannelingMF then
            return A:Show(icon, Action.Const.STOPCAST)
        end
        return A.ShadowFiend:Show(icon)
    end
    if dpCheck(unit) and A.BurstIsON(unit) and A.Mindbender:IsReady(unit) and A.Mindbender:IsSpellInRange(unit) then
        if isChannelingMF then
            return A:Show(icon, Action.Const.STOPCAST)
        end
        return A.Mindbender:Show(icon)
    end
    
    if dpCheck(unit) and A.SWP:IsSpellInRange(unit) and swpNeedsRefresh(unit) and shouldApplyDot(unit, A.SWP.ID) then
        if isChannelingMF then
            return A:Show(icon, Action.Const.STOPCAST)
        end
        return A.SWP:Show(icon)
    end

    if dpCheck(unit) and A.VampTouch:IsSpellInRange(unit) and swpCheck(unit) and A.LastPlayerCastID ~= A.VampTouch.ID and not vtCastStarted and not isMoving and shouldApplyDot(unit, A.VampTouch.ID) then
        if vtNeedsRefresh(unit) then
            if isChannelingMF then
                return A:Show(icon, Action.Const.STOPCAST)
            end
            return A.VampTouch:Show(icon)
        end
    end
    
    if dpCheck(unit) and shadowOrbs >= 3 and A.DevouringPlague:IsSpellInRange(unit) and vtCheck(unit) and swpCheck(unit) and shouldApplyDot(unit, A.DevouringPlague.ID) and not isMoving then
        if isChannelingMF then
            return A:Show(icon, Action.Const.STOPCAST)
        end
        return A.DevouringPlague:Show(icon)
    end
    
    if dpCheck(unit) and shadowOrbs < 3 and targetHP <= 20 and A.SWD:IsReady(unit) and A.SWD:IsSpellInRange(unit) then
        if isChannelingMF then
            return A:Show(icon, Action.Const.STOPCAST)
        end
        return A.SWD:Show(icon)
    end
    if dpCheck(unit) and shadowOrbs < 3 and A.MindBlast:IsReady(unit) and A.MindBlast:IsSpellInRange(unit) and vtCheck(unit) and swpCheck(unit) and not isMoving then
        if isChannelingMF then
            return A:Show(icon, Action.Const.STOPCAST)
        end
        return A.MindBlast:Show(icon)
    end
    if dpCheck(unit) and talentCheck(A.Halo) and (vtCheck(unit)or isMoving) and swpCheck(unit) then
        if isChannelingMF then
            return A:Show(icon, Action.Const.STOPCAST)
        end
        return A.Halo:Show(icon)
    end
    if dpCheck(unit) and talentCheck(A.DivineStar) and (vtCheck(unit)or isMoving) and swpCheck(unit) then
        if isChannelingMF then
            return A:Show(icon, Action.Const.STOPCAST)
        end
        return A.DivineStar:Show(icon)
    end
    if dpCheck(unit) and talentCheck(A.Cascade) and (vtCheck(unit)or isMoving) and swpCheck(unit) then
        if isChannelingMF then
            return A:Show(icon, Action.Const.STOPCAST)
        end
        return A.Cascade:Show(icon)
    end
    
    if A.MindFlay:IsReady(unit) and A.MindFlay:IsSpellInRange(unit) and not isMoving then        
        return A.MindFlay:Show(icon)
    end
    
    if isMoving and A.AngelicFeather:IsReady() then
        return A.AngelicFeather:Show(icon)
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
    local nearbyEnemies10Yard = enemiesWithinRangeOfTarget(unit, 10)
    local isMoving = Action.Player:IsMoving()
    
    if nearbyEnemies ~= lastEnemyCount then
        lastEnemyCount = nearbyEnemies
    end
    if nearbyEnemies >= 6 and nearbyEnemies10Yard >= 6 then
        if A.MindSear:IsReady(unit) and A.MindSear:IsSpellInRange(unit) and not isMoving then
            return A.MindSear:Show(icon)
        end
        return false
    end
    if nearbyEnemies >= 2 then        
        if swpNeedsRefresh(unit) and enemiesMissingSWPWithTTD() > 0 and A.SWP:IsReady(unit) and A.SWP:IsSpellInRange(unit) and shouldApplyDot(unit, A.SWP.ID) then
            return A.SWP:Show(icon)
        end
        
        if vtNeedsRefresh(unit) and swpCheck(unit) and not isMoving and enemiesMissingVTWithTTD() > 0 and A.VampTouch:IsReady(unit) and A.VampTouch:IsSpellInRange(unit) and not vtCastStarted and shouldApplyDot(unit, A.VampTouch.ID) then
            return A.VampTouch:Show(icon)
        end
        
        if currentTargetComplete(unit) and totalTargetsNeedingDoTsWithTTD() > 0 then
            return A:Show(icon, Action.Const.AUTOTARGET)
        end
        
        if nearbyEnemies == 5 and nearbyEnemies10Yard >= 5 then
            if A.MindSear:IsReady(unit) and A.MindSear:IsSpellInRange(unit) and not isMoving then
                return A.MindSear:Show(icon)
            end
        else
            return SingleTargetRotation(icon, unit)
        end
    end
    return false
end

local function isTank(unit)
    local role = UnitGroupRolesAssigned(unit)
    return role == "TANK"
end

local function getTankForPoM()
    local members = A.HealingEngine.GetMembersAll()
    if not members or #members == 0 then
        return nil
    end
    
    for _, member in ipairs(members) do
        local unit = member.Unit
        local isTankUnit = isTank(unit) or member.Role == "TANK"
        if isTankUnit and member.isSelectAble then
            local unitObj = Action.Unit(unit)
            if unitObj:IsExists() and not unitObj:IsDead() and A.PrayerOfMending:IsSpellInRange(unit) then
                return unit
            end
        end
    end
    
    -- If no tank found, return first available player
    for _, member in ipairs(members) do
        if member.isPlayer and member.isSelectAble then
            local unitObj = Action.Unit(member.Unit)
            if unitObj:IsExists() and not unitObj:IsDead() and A.PrayerOfMending:IsSpellInRange(member.Unit) then
                return member.Unit
            end
        end
    end
    
    return nil
end

local function getGroupForPoH(groupNumber)
    local members = A.HealingEngine.GetMembersAll()
    if not members or #members == 0 then
        return nil
    end
    
    local groupMembers = {}
    for _, member in ipairs(members) do
        if member.isPlayer then
            local unitID = member.Unit
            local actualGroupNumber = 1
            
            if IsInRaid() then
                local raidIndex = nil
                if string.find(unitID, "raid") then
                    raidIndex = tonumber(string.match(unitID, "raid(%d+)"))
                end
                
                if raidIndex then
                    local name, _, subgroup = GetRaidRosterInfo(raidIndex)
                    if name then
                        actualGroupNumber = subgroup
                    end
                end
            end
            
            if actualGroupNumber == groupNumber then
                table.insert(groupMembers, {
                    unit = unitID,
                    member = member,
                    healthPercentage = member.realHP
                })
            end
        end
    end
    
    if #groupMembers == 0 then
        return nil
    end
    
    -- Find the member with lowest health in this group
    local lowestHealth = 100
    local bestTarget = nil
    for _, memberData in ipairs(groupMembers) do
        if memberData.healthPercentage < lowestHealth and A.PrayerOfHealing:IsSpellInRange(memberData.unit) then
            lowestHealth = memberData.healthPercentage
            bestTarget = memberData.unit
        end
    end
    
    return bestTarget
end

local function hasForbearance(unit)
    return Action.Unit(unit):HasDeBuffs(6788, true) > 0 -- Forbearance debuff ID
end

local function needsDispel(unit)
    local purifyReady = A.Purify:IsReady(unit)
    local purifyInRange = A.Purify:IsSpellInRange(unit)
    
     if not purifyReady or not purifyInRange then        
        return false
    end
for i = 1, 40 do
        local name, icon, count, debuffType, duration, expirationTime, source, isStealable, nameplateShowPersonal, spellId = UnitAura(unit, i, "HARMFUL")
        if not name then break end
    if debuffType == "Magic" or debuffType == "Disease" then
            return true
        end
    end
    return false
end

local function findDispelTarget(icon)
    local members = A.HealingEngine.GetMembersAll()
    for i, member in ipairs(members) do
        if member.isPlayer then
            local isDead = Action.Unit(member.Unit):IsDead()
            local purifyInRange = A.Purify:IsSpellInRange(member.Unit)          
            if not isDead and purifyInRange then
                local needsDispelResult = needsDispel(member.Unit)              
                if needsDispelResult then                    
                    A.HealingEngine.SetTarget(member.Unit)
                    return A.Purify:Show(icon)
                end
            end
        end
    end
    return nil
end

local function DiscHealingRotation(icon, unit)
    local members = A.HealingEngine.GetMembersAll()
    local spotThreshold = A.GetToggle(2, "DiscSpotHealingThreshold") or 30
    local divineStarThreshold = A.GetToggle(2, "DivineStarHealthThreshold") or 80
    local divineStarMinTargets = A.GetToggle(2, "DivineStarMinTargets") or 3
    local pomThreshold = A.GetToggle(2, "PoMHealthThreshold") or 80
    local pomMinTargets = A.GetToggle(2, "PoMMinTargets") or 3
    
    local injuredCount = A.HealingEngine.GetBelowHealthPercentUnits(divineStarThreshold)
    local pomInjuredCount = A.HealingEngine.GetBelowHealthPercentUnits(pomThreshold)
    
    local evangelismStacks = Action.Unit("player"):HasBuffsStacks(A.Evangelism.ID, nil, false) or 0
    if evangelismStacks >= 5 and A.ArchAngel:IsReady() then
        return A.ArchAngel:Show(icon)
    end
    
    local hasSpiritShell = Action.Unit("player"):HasBuffs(A.SpiritShell.ID) > 0
    
    if hasSpiritShell and A.PrayerOfHealing:IsReady() then
        local groupSize = IsInRaid() and GetNumGroupMembers() or (IsInGroup() and GetNumGroupMembers() or 1)
        
        if groupSize <= 5 then
            local target = getGroupForPoH(1)
            if target and A.PrayerOfHealing:IsSpellInRange(target) then
                A.HealingEngine.SetTarget(target)
                return A.PrayerOfHealing:Show(icon)
            end
        elseif groupSize <= 10 then
            local currentTime = GetTime()
            local groupToTarget = math.floor(currentTime) % 2 + 1
            local target = getGroupForPoH(groupToTarget)
            if target and A.PrayerOfHealing:IsSpellInRange(target) then
                A.HealingEngine.SetTarget(target)
                return A.PrayerOfHealing:Show(icon)
            end
        else
            for groupNumber = 1, 5 do
                local target = getGroupForPoH(groupNumber)
                if target and A.PrayerOfHealing:IsSpellInRange(target) then
                    local hasAbsorb = false
                    local groupMembers = {}
                    
                    local members = A.HealingEngine.GetMembersAll()
                    for _, member in ipairs(members) do
                        if member.isPlayer then
                            local unitID = member.Unit
                            local actualGroupNumber = 1
                            
                            if IsInRaid() then
                                local raidIndex = nil
                                if string.find(unitID, "raid") then
                                    raidIndex = tonumber(string.match(unitID, "raid(%d+)"))
                                end
                                
                                if raidIndex then
                                    local name, _, subgroup = GetRaidRosterInfo(raidIndex)
                                    if name then
                                        actualGroupNumber = subgroup
                                    end
                                end
                            end
                            
                            if actualGroupNumber == groupNumber then
                                table.insert(groupMembers, unitID)
                            end
                        end
                    end
                    
                    for _, memberUnit in ipairs(groupMembers) do
                        if Action.Unit(memberUnit):HasBuffs(144908) > 0 then
                            hasAbsorb = true
                            break
                        end
                    end
                    
                    if not hasAbsorb then
                        A.HealingEngine.SetTarget(target)
                        return A.PrayerOfHealing:Show(icon)
                    end
                end
            end
        end
    end

    local dispelTarget = findDispelTarget(icon)
    if dispelTarget then
        return dispelTarget
    end
    
    local criticalTarget = nil
    local highestPriority = 0
    
    for _, member in ipairs(members) do
        if member.isPlayer and member.HP <= spotThreshold then
            local isTankUnit = isTank(member.Unit) or member.Role == "TANK"
            local priority = isTankUnit and (1000 + (100 - member.HP)) or (100 - member.HP)
            
            if priority > highestPriority then
                highestPriority = priority
                criticalTarget = member.Unit
            end
        end
    end
    
    if criticalTarget then
        A.HealingEngine.SetTarget(criticalTarget)
        
        if A.Penance:IsReady(criticalTarget) and A.Penance:IsSpellInRange(criticalTarget) then
            return A.Penance:Show(icon)
        end
        
        if A.PWS:IsReady(criticalTarget) and A.PWS:IsSpellInRange(criticalTarget) and not hasForbearance(criticalTarget) then
            return A.PWS:Show(icon)
        end
        
        if A.FlashHeal:IsReady(criticalTarget) and A.FlashHeal:IsSpellInRange(criticalTarget) then
            return A.FlashHeal:Show(icon)
        end
    end
    
    if injuredCount >= divineStarMinTargets and A.DivineStar:IsReady() and not Action.Player:IsMoving() then
        return A.DivineStar:Show(icon)        
    end
    
    if pomInjuredCount >= pomMinTargets and A.PrayerOfMending:IsReady() then
        local tankTarget = getTankForPoM()
        if tankTarget then
            A.HealingEngine.SetTarget(tankTarget)
            return A.PrayerOfMending:Show(icon)
        end
    end
    
    return false
end

local function DiscDamageRotation(icon, unit)
    if not A.IsUnitEnemy(unit) then
        return false
    end
    if not Action.Unit(unit):IsExists() then
        return false
    end
    if Action.Unit(unit):IsDead() then
        return false
    end
    if not A.Smite:IsSpellInRange(unit) then
        return false
    end
    
    local isMoving = Action.Player:IsMoving()
 
    if talentCheck(A.Mindbender) and A.IsUnitEnemy("target") and Action.Unit("target"):IsExists() and not Action.Unit("target"):IsDead() and  A.BurstIsON("target") and A.Unit("player"):CombatTime() > 0 then
        return A.Mindbender:Show(icon)
    end
    if not talentCheck(A.Mindbender) and A.ShadowFiend:IsReady() and A.IsUnitEnemy("target") and Action.Unit("target"):IsExists() and not Action.Unit("target"):IsDead() and A.BurstIsON("target") and A.Unit("player"):CombatTime() > 0 then
        return A.ShadowFiend:Show(icon)
    end
    
    if A.Penance:IsReady(unit) and A.Penance:IsSpellInRange(unit) then
        return A.PenanceDMG:Show(icon)
    end
    
    if A.HolyFire:IsReady(unit) and A.HolyFire:IsSpellInRange(unit) then
        return A.HolyFire:Show(icon)
    end
    
    if A.Smite:IsReady(unit) and A.Smite:IsSpellInRange(unit) and not isMoving then
        return A.Smite:Show(icon)
    end
    
    if isMoving and A.AngelicFeather:IsReady() then
        return A.AngelicFeather:Show(icon)
    end

    return false
end

local function holyDpsRotation(icon, unit)
    if not A.IsUnitEnemy(unit) then
        return false
    end
    if not Action.Unit(unit):IsExists() then
        return false
    end
    if Action.Unit(unit):IsDead() then
        return false
    end
    if not A.Smite:IsSpellInRange(unit) then
        return false
    end
    
    local targetHP = Action.Unit(unit):HealthPercent()
    local isMoving = Action.Player:IsMoving()
    local nearbyEnemies = Action.MultiUnits:GetByRangeInCombat(40)
    local nearbyEnemies10Yard = enemiesWithinRangeOfTarget(unit, 10)
    
    local _, duration = GetSpellCooldown(A.ChakraChastise.ID)
    local isChakraReady = duration ~= 10
    
    if Action.Unit("player"):HasBuffs(A.ChakraChastise.ID) == 0 and isChakraReady then
        return A.ChakraChastise:Show(icon)
    end

    if talentCheck(A.Solace) then
        return A.Solace:Show(icon)
    end
    
    if targetHP <= 20 and A.SWD:IsReady(unit) and A.SWD:IsSpellInRange(unit) then
        return A.SWD:Show(icon)
    end
    
    if A.HolyFire:IsReady(unit) and not talentCheck(A.Solace) and A.HolyFire:IsSpellInRange(unit) then
        return A.HolyFire:Show(icon)
    end
    
    if A.SWP:IsSpellInRange(unit) and swpNeedsRefresh(unit) and shouldApplyDot(unit, A.SWP.ID) then
        return A.SWP:Show(icon)
    end
    
    if nearbyEnemies >= 6 and nearbyEnemies10Yard >= 6 then
        if A.MindSear:IsReady(unit) and A.MindSear:IsSpellInRange(unit) and not isMoving then
            return A.MindSear:Show(icon)
        end
        return false
    end
    
    if A.Smite:IsReady(unit) and A.Smite:IsSpellInRange(unit) and not isMoving then
        return A.Smite:Show(icon)
    end    
    if isMoving and A.AngelicFeather:IsReady() then
        return A.AngelicFeather:Show(icon)
    end

    return false
end

local function needsSpotHealing(unit, isTank)
    local spotThreshold = A.GetToggle(2, "SpotHealingThreshold") or 30
    local spotTTD = 5
    local tankSpotTTD = 5
    
    local unitObj = Action.Unit(unit)
    local healthPercent = unitObj:HealthPercent()
    local ttd = unitObj:TimeToDie()
    
    if isTank then
        return ttd <= tankSpotTTD or healthPercent < spotThreshold
    else
        return healthPercent < spotThreshold or ttd <= spotTTD
    end
end

local function spotHealingRotation(icon, unit)
    local members = A.HealingEngine.GetMembersAll()
    local groupHealth = A.HealingEngine.GetHealthAVG()
    local aoeThreshold = A.GetToggle(2, "HolyAOEThreshold") or 80
    local circleMinTargets = A.GetToggle(2, "HolyCircleMinTargets") or 6
    local circleThreshold = A.GetToggle(2, "HolyCircleThreshold") or 80
    local circleTargets = A.HealingEngine.GetBelowHealthPercentUnits(circleThreshold)
    local groupSize = A.HealingEngine.GetMembersAll()
    local actualGroupSize = #groupSize
    local effectiveCircleMinTargets
    local isDungeon = IsInGroup() and not IsInRaid()
    
    if isDungeon then
        effectiveCircleMinTargets = math.min(circleMinTargets, actualGroupSize)
    else
        effectiveCircleMinTargets = circleMinTargets
    end

    local criticalTarget = nil
    local highestPriority = 0
    
    for _, member in ipairs(members) do
        if member.isPlayer and A.FlashHeal:IsSpellInRange(member.Unit) then
            local isTank = Action.Unit(member.Unit):IsTank()
            local needsHealing = needsSpotHealing(member.Unit, isTank)
            
            if needsHealing then
                local priority = 0
                local unitObj = Action.Unit(member.Unit)
                local healthPercent = unitObj:HealthPercent()
                local ttd = unitObj:TimeToDie()
                
                if isTank then
                    priority = 1000 + (100 - healthPercent) + (20 - ttd)
                else
                    priority = (100 - healthPercent) + (10 - ttd)
                end
                
                if priority > highestPriority then
                    highestPriority = priority
                    criticalTarget = member.Unit
                end
            end
        end
    end

    if groupHealth <= aoeThreshold then
        if A.HolyWordChastise:GetCooldown() == 0 and not Action.Player:IsMoving() and Action.Unit("player"):HasBuffs(A.ChakraSanctuary.ID) ~= 0 then
            return A.HolyWordSanctuary:Show(icon)
         end
        if talentCheck(A.DivineStar) then
            return A.DivineStar:Show(icon)
        end
        if talentCheck(A.Halo) then
            return A.Halo:Show(icon)
        end
        if talentCheck(A.Cascade) then
            return A.Cascade:Show(icon)
        end

        if circleTargets >= effectiveCircleMinTargets and A.CircleOfHealing:IsReady() then
            local members = A.HealingEngine.GetMembersAll()
            for _, member in ipairs(members) do
                if member.realHP <= circleThreshold and A.CircleOfHealing:IsSpellInRange(member.Unit) then
                    A.HealingEngine.SetTarget(member.Unit)
                    return A.CircleOfHealing:Show(icon)
                end
            end
        end
    end
    if criticalTarget then
        A.HealingEngine.SetTarget(criticalTarget)

        local _, duration = GetSpellCooldown(A.ChakraSerenity.ID)
        local isChakraReady = duration ~= 10

        if Action.Unit("player"):HasBuffs(A.ChakraSerenity.ID) == 0 and isChakraReady then
            return A.ChakraSerenity:Show(icon)
        end
        
        if A.HolyWordChastise:GetCooldown() == 0 and Action.Unit("player"):HasBuffs(A.ChakraSerenity.ID) ~= 0 and A.FlashHeal:IsSpellInRange(criticalTarget) then
            return A.HolyWordSerenity:Show(icon)
        end        
        if A.FlashHeal:IsReady() and not Action.Player:IsMoving() and A.FlashHeal:IsSpellInRange(criticalTarget) then
            return A.FlashHeal:Show(icon)
        end
    end

    if Action.Player:IsMoving() and A.AngelicFeather:IsReady() then
        return A.AngelicFeather:Show(icon)
    end
    
    return false
end

local function getGroupHealthExcludingDead()
    local members = A.HealingEngine.GetMembersAll()
    local totalCurrent = 0
    local totalMax = 0
    local aliveCount = 0
    
    for _, member in ipairs(members) do
        if member.isPlayer and not Action.Unit(member.Unit):IsDead() then
            totalCurrent = totalCurrent + member.AHP
            totalMax = totalMax + member.MHP
            aliveCount = aliveCount + 1
        end
    end
    
    if totalMax > 0 then
        return (totalCurrent / totalMax) * 100, aliveCount
    end
    
    return 100, 0
end

local function holyHealingRotation(icon, unit)
    local renewThreshold = A.GetToggle(2, "HolyRenewThreshold") or 90
    local aoeThreshold = A.GetToggle(2, "HolyAOEThreshold") or 80
    local circleThreshold = A.GetToggle(2, "HolyCircleThreshold") or 80
    local prayerThreshold = A.GetToggle(2, "HolyPrayerThreshold") or 80
    local prayerMinTargets = A.GetToggle(2, "HolyPrayerMinTargets") or 5
    local circleMinTargets = A.GetToggle(2, "HolyCircleMinTargets") or 6

    local amountOfRenewTarg = A.HealingEngine.GetBelowHealthPercentUnits(renewThreshold)
    local pohTargets = A.HealingEngine.GetBelowHealthPercentUnits(prayerThreshold)
    local circleTargets = A.HealingEngine.GetBelowHealthPercentUnits(circleThreshold)
    local groupHealth = getGroupHealthExcludingDead()
    
    local groupSize = A.HealingEngine.GetMembersAll()
    local actualGroupSize = #groupSize
    local isDungeon = IsInGroup() and not IsInRaid()
    
    local effectiveCircleMinTargets
    local effectivePrayerMinTargets
    
    if isDungeon then
        effectiveCircleMinTargets = math.min(circleMinTargets, actualGroupSize)
        effectivePrayerMinTargets = math.min(prayerMinTargets, actualGroupSize)
    else
        effectiveCircleMinTargets = circleMinTargets
        effectivePrayerMinTargets = prayerMinTargets
    end
    if talentCheck(A.Mindbender) and A.IsUnitEnemy("target") and Action.Unit("target"):IsExists() and not Action.Unit("target"):IsDead() and  A.BurstIsON("target") and A.Unit("player"):CombatTime() > 0 then
        return A.Mindbender:Show(icon)
    end
    if not talentCheck(A.Mindbender) and A.ShadowFiend:IsReady() and A.IsUnitEnemy("target") and Action.Unit("target"):IsExists() and not Action.Unit("target"):IsDead() and A.BurstIsON("target") and A.Unit("player"):CombatTime() > 0 then
        return A.ShadowFiend:Show(icon)
    end

    if talentCheck(A.Solace) and not Action.Unit(unit):IsDead() and Action.Unit(unit):IsExists() and A.IsUnitEnemy(unit) then
        return A.Solace:Show(icon)
    end

    local dispelTarget = findDispelTarget(icon)
    if dispelTarget then
        return dispelTarget
    end
    
    local spotHealing = spotHealingRotation(icon, unit)
    if spotHealing then
        return spotHealing
    end
    
    if groupHealth >= aoeThreshold then
        return holyDpsRotation(icon, unit)
    end
    
    if groupHealth <= aoeThreshold then
        local _, duration = GetSpellCooldown(A.ChakraSanctuary.ID)
        local isChakraReady = duration ~= 10
        
        if Action.Unit("player"):HasBuffs(A.ChakraSanctuary.ID) == 0 and isChakraReady then
            return A.ChakraSanctuary:Show(icon)
        end              
        if A.HolyWordChastise:GetCooldown() == 0 and not Action.Player:IsMoving() and Action.Unit("player"):HasBuffs(A.ChakraSanctuary.ID) ~= 0 then
            return A.HolyWordSanctuary:Show(icon)
        end
        if talentCheck(A.DivineStar) then
            return A.DivineStar:Show(icon)
        end
        if talentCheck(A.Halo) then
            return A.Halo:Show(icon)
        end
        if talentCheck(A.Cascade) then
            return A.Cascade:Show(icon)
        end

        if A.Lightwell:IsReady() and not Action.Player:IsMoving()and A.BurstIsON("target") and A.Unit("player"):CombatTime() > 0 then
            return A.Lightwell:Show(icon)
        end
        
        if circleTargets >= effectiveCircleMinTargets and A.CircleOfHealing:IsReady() then
            local members = A.HealingEngine.GetMembersAll()
            for _, member in ipairs(members) do
                if member.realHP <= circleThreshold and A.CircleOfHealing:IsSpellInRange(member.Unit) then
                    A.HealingEngine.SetTarget(member.Unit)
                    return A.CircleOfHealing:Show(icon)
                end
            end
        end
        
        local members = A.HealingEngine.GetMembersAll()

        local hasActivePoM = false
        local currentPoMStacks = 0

        for _, member in ipairs(members) do
            if member.isPlayer then
                local stackCount = Action.Unit(member.Unit):HasBuffsStacks(A.PrayerOfMending.ID, nil, false)
                
                if stackCount and stackCount > 0 then
                    hasActivePoM = true
                    currentPoMStacks = stackCount
                    pomStackCount = stackCount
                    pomLastTarget = member.Unit
                end
            end
        end

        if not hasActivePoM and (pomStackCount or 0) > 0 then
            pomStackCount = (pomStackCount or 0) - 1
        end

        if hasActivePoM then
            pomStackCount = currentPoMStacks
        end

        if (pomStackCount or 0) == 0 and A.PrayerOfMending:IsReady() then
            local bestTank = nil

            for i, member in ipairs(members) do
                if member.isPlayer and A.PrayerOfMending:IsSpellInRange(member.Unit) then
                    local isTank = Action.Unit(member.Unit):IsTank()
                    if isTank then
                        bestTank = member.Unit
                        break
                    end
                end
            end

            if not bestTank then
                for i, member in ipairs(members) do
                    if member.isPlayer then
                        local inRange = A.PrayerOfMending:IsSpellInRange(member.Unit)
                        
                        if member.Role == "TANK" and inRange then
                            bestTank = member.Unit
                            break
                        end
                    end
                end
            end

            if not bestTank then
                for _, member in ipairs(members) do
                    if member.isPlayer and A.PrayerOfMending:IsSpellInRange(member.Unit) then
                        bestTank = member.Unit
                        break
                    end
                end
            end
            
            if bestTank then
                A.HealingEngine.SetTarget(bestTank)
                pomStackCount = 5
                pomLastTarget = bestTank
                return A.PrayerOfMending:Show(icon)
            end
        end

        if pohTargets >= effectivePrayerMinTargets and A.PrayerOfHealing:IsReady() then
            local partyHealthStatus = {}
            local partyMembers = {}
            
            local members = A.HealingEngine.GetMembersAll()
            
            for _, member in ipairs(members) do
                if member.isPlayer and member.realHP <= prayerThreshold then
                    local unitID = member.Unit
                    local partyNumber = 1
                    
                    if IsInRaid() then
                        local raidIndex = nil
                        if string.find(unitID, "raid") then
                            raidIndex = tonumber(string.match(unitID, "raid(%d+)"))
                        end
                        
                        if raidIndex then
                            local name, _, subgroup = GetRaidRosterInfo(raidIndex)
                            if name then
                                partyNumber = subgroup
                            end
                        end
                    end
                    
                    if not partyHealthStatus[partyNumber] then
                        partyHealthStatus[partyNumber] = 0
                        partyMembers[partyNumber] = {}
                    end
                    
                    partyHealthStatus[partyNumber] = partyHealthStatus[partyNumber] + 1
                    table.insert(partyMembers[partyNumber], {
                        unitID = unitID,
                        member = member,
                        healthPercentage = member.realHP
                    })
                end
            end
            
            local targetParty = nil
            local maxInjured = 0
            local bestTarget = nil
            
            for party, count in pairs(partyHealthStatus) do
                if count >= effectivePrayerMinTargets and count > maxInjured then
                    maxInjured = count
                    targetParty = party
                    
                    local lowestHealth = 100
                    for _, memberData in ipairs(partyMembers[party]) do
                        if memberData.healthPercentage < lowestHealth then
                            lowestHealth = memberData.healthPercentage
                            bestTarget = memberData.unitID
                        end
                    end
                end
            end
            
            if targetParty and bestTarget and not Action.Player:IsMoving() and A.PrayerOfHealing:IsSpellInRange(bestTarget) then
                A.HealingEngine.SetTarget(bestTarget)
                return A.PrayerOfHealing:Show(icon)
            end
        end
    end

    if amountOfRenewTarg > 0 then
        local members = A.HealingEngine.GetMembersAll()
        for _, member in ipairs(members) do
            if member.realHP < renewThreshold and A.Renew:IsReady() and A.Renew:IsSpellInRange(member.Unit) and Action.Unit(member.Unit):HasBuffs(A.Renew.ID) == 0 then
                A.HealingEngine.SetTarget(member.Unit)
                return A.Renew:Show(icon)
            end
        end
    end

    if Action.Player:IsMoving() and A.AngelicFeather:IsReady() then
        return A.AngelicFeather:Show(icon)
    end

    return false
end

local function BuffCheck(icon)
    local isInShadowForm = Action.Unit("player"):HasBuffs(A.ShadowForm.ID) > 0
    local hasInnerFire = Action.Unit("player"):HasBuffs(A.InnerFire.ID) > 0
    local hasPWF = Action.Unit("player"):HasBuffs(A.PWF.ID) > 0
    local hasDI = Action.Unit("player"):HasBuffs(A.DarkIntent.ID) > 0
    if not isInShadowForm and currentSpec == 258 and A.ShadowForm:IsReady() then
        return A.ShadowForm:Show(icon)
    end
    if not hasInnerFire and A.InnerFire:IsReady() then
        return A.InnerFire:Show(icon)
    end
    if not hasPWF and not hasDI and A.PWF:IsReady() then
        return A.PWF:Show(icon)
    end
    return false
end

local function DefensiveCheck(icon)
    local playerHP = Action.Unit("player"):HealthPercent()
    local desperatePrayerHP = A.GetToggle(2, "DesperatePrayerHP")
    local dispersionHP = A.GetToggle(2, "DispersionHP")
    local useDispersion = A.GetToggle(2, "UseDispersion")
    local useDesperatePrayer = A.GetToggle(2, "UseDesperatePrayer")
    local groupHP = A.HealingEngine.GetHealthAVG()
    local vampiricEmbraceHP = A.GetToggle(2, "VampiricEmbraceHP")
    local useVampiricEmbrace = A.GetToggle(2, "UseVampiricEmbrace")
    
    if useDesperatePrayer and playerHP <= desperatePrayerHP and A.DesperatePrayer:IsReady() then
        return A.DesperatePrayer:Show(icon)
    end
    if useDispersion and playerHP <= dispersionHP and currentSpec == 258 and A.Dispersion:IsReady() then
        return A.Dispersion:Show(icon)
    end        
    if useVampiricEmbrace and groupHP <= vampiricEmbraceHP and currentSpec == 258 and A.VampEmbrace:IsReady() then
        return A.VampEmbrace:Show(icon)
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

    if hymnCastStarted == true then
        return false
    end
    
    if currentSpec == 258 then
        local nearbyEnemies = Action.MultiUnits:GetByRangeInCombat(40)
        local rotationSpell = (nearbyEnemies >= 2 and A.GetToggle(2, "AoE")) and AoERotation(icon,"target") or SingleTargetRotation(icon, "target")
        if rotationSpell then
            return rotationSpell
        end
    end
    
    if currentSpec == 257 then
        
        local healingSpell = holyHealingRotation(icon, "target")
        if healingSpell then
            return healingSpell
        end
    end
    
    if currentSpec == 256 then
        local discHealingSpell = DiscHealingRotation(icon, "target")
        if discHealingSpell then
            return discHealingSpell
        end
        
        local discDamageSpell = DiscDamageRotation(icon, "target")
        if discDamageSpell then
            return discDamageSpell
        end
        return false    
    end

    return false
end

A[4] = nil
A[5] = nil
A[6] = nil
A[7] = nil
A[8] = nil

local frame = CreateFrame("Frame")
frame:RegisterEvent("UNIT_SPELLCAST_START")
frame:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")
frame:RegisterEvent("UNIT_SPELLCAST_INTERRUPTED")
frame:SetScript("OnEvent", function(self, event, unit, _, spellID)
    if unit == "player" then
        if event == "UNIT_SPELLCAST_START" and spellID == A.VampTouch.ID then
            vtCastStarted = true
        elseif event == "UNIT_SPELLCAST_SUCCEEDED" and spellID == A.VampTouch.ID then
            vtCastStarted = false
        elseif event == "UNIT_SPELLCAST_INTERRUPTED" and spellID == A.VampTouch.ID then
            vtCastStarted = false
        elseif event == "UNIT_SPELLCAST_START" and spellID == A.DivineHymn.ID then
            hymnCastStarted = true
        elseif event == "UNIT_SPELLCAST_CHANNEL_STOP" and (spellID == A.DivineHymn.ID or spellID == A.HymnOfHope.ID) then
            hymnCastStarted = false
        end
    end
end)

TMW:RegisterCallback("TMW_ACTION_IS_INITIALIZED", function()
    A.SetToggle({8, "SelectResurrects"}, true)
    A.SetToggle({8, "SelectPets"}, false)
    A.SetToggle({8, "PredictOptions"}, {true, true, true, true, true, true})
    A.SetToggle({1, "CheckSpellIsTargeting"}, false )
    A.SetToggle({1, "CheckMount"}, true)
end)