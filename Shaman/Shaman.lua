local _G, setmetatable = _G, setmetatable
local TMW = _G.TMW
local Action = _G.Action
local Create = Action.Create
Action[Action.PlayerClass] = {
    FlameShock = Create({ Type = "Spell", ID = 8050 }),
    LavaBurst = Create({ Type = "Spell", ID = 51505 }),
    EarthShock = Create({ Type = "Spell", ID = 8042 }),
    LightningShield = Create({ Type = "Spell", ID = 324 }),
    WaterShield = Create({ Type = "Spell", ID = 52127 }),
    LightningBolt = Create({ Type = "Spell", ID = 403  }),
    ChainLightning = Create({ Type = "Spell", ID = 421 }),
    FireEle = Create({ Type = "Spell", ID = 2894 }),
    FlametongueWeapon = Create({ Type = "Spell", ID = 8024 }),
    EarthLivingWeapon = Create({ Type = "Spell", ID = 51730 }),
    LavaSurge = Create ({Type = "Spell", ID = 77756}),
    Ascendance = Create ({Type = "Spell", ID = 114049}),
    AscendanceBuff = Create ({Type = "Spell", ID = 114050}),
    SWG = Create ({Type = "Spell", ID = 79206}),
    LavaBeam = Create ({Type = "Spell", ID = 114074}),
    Riptide = Create({ Type = "Spell", ID = 61295 }),
    ChainHeal = Create({ Type = "Spell", ID = 1064 }),
    HealingRain = Create({ Type = "Spell", ID = 73920 }),
    UnleashElements = Create({ Type = "Spell", ID = 73680 }),
    HealingStreamTotem = Create({ Type = "Spell", ID = 5394 }),
    HealingSurge = Create({ Type = "Spell", ID = 8004 }),
    GreaterHealingWave = Create({ Type = "Spell", ID = 77472 }),
    HealingWave = Create({ Type = "Spell", ID = 331 }),
    EarthShield = Create({ Type = "Spell", ID = 974 }),
    PurifySpirit = Create({ Type = "Spell", ID = 77130 }),
    ManaTideTotem = Create({ Type = "Spell", ID = 16190 }),
    UnleashLife = Create({ Type = "Spell", ID = 73685 }),
}
local A = setmetatable(Action[Action.PlayerClass], { __index = Action })
local lastEnemyCount = 0
local chainLightningEffective = true
local function getChainLightningEffectiveness()
    if not Action.IamRanger then
        return 0
    end
    local enemiesHitBySplash = Action.MultiUnits:GetActiveEnemies(3)
    return enemiesHitBySplash
end
local function shouldUseChainLightning(unit)
    if not A.ChainLightning:IsSpellInRange(unit) then
        return false
    end
    if Action.Player:IsMoving() and not (Action.Unit("player"):HasBuffs(A.SWG.ID)) then
        return false
    end
    local nearbyEnemies = Action.MultiUnits:GetByRangeInCombat(40)
    if nearbyEnemies < 4 then
        chainLightningEffective = false
        return false
    end
    local cleuHits = getChainLightningEffectiveness()
    if cleuHits > 0 then
        chainLightningEffective = cleuHits >= 4
        return chainLightningEffective
    end
    return true
end
local function flameShockNeedsRefresh(unit)
    local flameShockRemain = Action.Unit(unit):HasDeBuffs(A.FlameShock.ID, true)
    local needsRefresh = not flameShockRemain or flameShockRemain < 3
    return needsRefresh
end
local function getLightningShieldCharges()
    local charges = Action.Unit("player"):HasBuffsStacks(A.LightningShield.ID, nil, false)
    return charges or 0
end
local function hasFlametongueWeapon()
    local hasMainHandEnchant, mainHandExpiration, mainHandCharges, mainHandEnchantID, hasOffHandEnchant, offHandExpiration, offHandCharges, offHandEnchantID = GetWeaponEnchantInfo()
    if hasMainHandEnchant and mainHandEnchantID == 5 then
        return true
    end
    if hasOffHandEnchant and offHandEnchantID == 5 then
        return true
    end    
    return false
end
local function hasEarthLiving()
    local hasMainHandEnchant, mainHandExpiration, mainHandCharges, mainHandEnchantID, hasOffHandEnchant, offHandExpiration, offHandCharges, offHandEnchantID = GetWeaponEnchantInfo()
    if hasMainHandEnchant and mainHandEnchantID == 3345 then
        return true
    end
    if hasOffHandEnchant and offHandEnchantID == 3345 then
        return true
    end    
    return false
end
local function getMostInjuredPlayer()
    local members = A.HealingEngine.GetMembersAll()
    if not members or #members == 0 then
        return nil
    end
    local mostInjured = nil
    local lowestHealth = 100
    for _, member in ipairs(members) do
        if member.HP < lowestHealth then
            lowestHealth = member.HP
            mostInjured = member
        end
    end
    return mostInjured, lowestHealth
end
local function getPlayerWithoutRiptide()
    local members = A.HealingEngine.GetMembersAll()
    if not members or #members == 0 then
        return nil
    end
    for _, member in ipairs(members) do
        local riptideBuff = Action.Unit(member.Unit):HasBuffs(A.Riptide.ID)
        if not riptideBuff or riptideBuff == 0 then
            return member
        end
    end
    return nil
end
local function getPlayerWithRiptide()
    local members = A.HealingEngine.GetMembersAll()
    if not members or #members == 0 then
        return nil
    end
    for _, member in ipairs(members) do
        local riptideBuff = Action.Unit(member.Unit):HasBuffs(A.Riptide.ID)
        if riptideBuff and riptideBuff > 0 then
            return member
        end
    end
    return nil
end
local function countInjuredPlayers(healthThreshold)
    return A.HealingEngine.GetBelowHealthPercentUnits(healthThreshold)
end
local function shouldCastChainHeal()
    local threshold = A.GetToggle(2, "ChainHealThreshold") or 80
    local minTargets = A.GetToggle(2, "ChainHealMinTargets") or 4
    local injuredCount = countInjuredPlayers(threshold)
    return injuredCount >= minTargets
end
local function isTank(unit)
    local role = UnitGroupRolesAssigned(unit)
    return role == "TANK"
end

local function getTargetForSingleTargetHeal()
    local members = A.HealingEngine.GetMembersAll()
    if not members or #members == 0 then
        return nil
    end
    local bestTarget = nil
    local highestPriority = 0
    for _, member in ipairs(members) do
        local unit = member.Unit
        local unitObj = Action.Unit(unit)
        local hp = member.HP
        local role = member.Role
        local isTankUnit = isTank(unit) or role == "TANK"
        
        if unitObj:IsExists() and not unitObj:IsDead() and member.isSelectAble then
            local priority = 0
            local needsHealing = false
            local healingSurgeHP = A.GetToggle(2, "HealingSurgeDPSHealerHP") or 25
            local greaterHealingWaveHP = A.GetToggle(2, "GreaterHealingWaveDPSHealerHP") or 40
            local healingWaveHP = A.GetToggle(2, "HealingWaveDPSHealerHP") or 60
            
            if hp <= healingSurgeHP then
                priority = 100 - hp
                needsHealing = true
            elseif hp <= greaterHealingWaveHP then
                priority = 80 - hp
                needsHealing = true
            elseif hp <= healingWaveHP then
                priority = 60 - hp
                needsHealing = true
            end
            
            if isTankUnit then
                priority = priority + 1000
            end
            
            if needsHealing and priority > highestPriority then
                highestPriority = priority
                bestTarget = {
                    unit = unit,
                    hp = hp,
                    ttd = unitObj:TimeToDie(),
                    role = role,
                    priority = priority,
                    isTank = isTankUnit
                }
            end
        end
    end
    return bestTarget
end
local function getHealingSpellForTarget(target)
    if not target then
        return nil
    end
    local hp = target.hp
    local healingSurgeHP = A.GetToggle(2, "HealingSurgeDPSHealerHP") or 25
    local greaterHealingWaveHP = A.GetToggle(2, "GreaterHealingWaveDPSHealerHP") or 40
    local healingWaveHP = A.GetToggle(2, "HealingWaveDPSHealerHP") or 60
    
    if hp <= healingSurgeHP then
        return A.HealingSurge
    elseif hp <= greaterHealingWaveHP then
        return A.GreaterHealingWave
    elseif hp <= healingWaveHP then
        return A.HealingWave
    end
    return nil
end
local function getTankNeedingEarthShield()
    local members = A.HealingEngine.GetMembersAll()
    if not members or #members == 0 then
        return nil
    end
    local allTanks = {}
    local currentEarthShieldTarget = nil
    for _, member in ipairs(members) do
        local unit = member.Unit
        local isTankUnit = isTank(unit) or member.Role == "TANK"
        if isTankUnit and member.isSelectAble then
            local unitObj = Action.Unit(unit)
            if unitObj:IsExists() and not unitObj:IsDead() then
                local earthShieldBuff = unitObj:HasBuffs(A.EarthShield.ID)
                local charges = 0
                local incomingDamage = member.incDMG or 0
                if earthShieldBuff and earthShieldBuff > 0 then
                    charges = unitObj:HasBuffsStacks(A.EarthShield.ID, nil, false) or 0
                    currentEarthShieldTarget = unit
                end
                table.insert(allTanks, {
                    unit = unit,
                    hp = member.HP,
                    ttd = unitObj:TimeToDie(),
                    incomingDamage = incomingDamage,
                    priority = incomingDamage,
                    hasEarthShield = earthShieldBuff and earthShieldBuff > 0,
                    charges = charges
                })
            end
        end
    end
    if #allTanks == 0 then
        return nil
    end
    table.sort(allTanks, function(a, b) 
        if a.incomingDamage > 0 or b.incomingDamage > 0 then
            return a.incomingDamage > b.incomingDamage
        else
            return a.hp < b.hp
        end
    end)
    if not currentEarthShieldTarget then
        return allTanks[1]
    end
    for _, tank in ipairs(allTanks) do
        if tank.unit == currentEarthShieldTarget then
            if tank.charges <= 0 then
                return allTanks[1]
            else
                return nil
            end
        end
    end
    return allTanks[1]
end
local function needsDispel(unit)
    local purifySpiritReady = A.PurifySpirit:IsReady(unit)
    local purifySpiritInRange = A.PurifySpirit:IsSpellInRange(unit)
    if not purifySpiritReady or not purifySpiritInRange then        
        return false
    end
    for i = 1, 40 do
        local name, icon, count, debuffType, duration, expirationTime, source, isStealable, nameplateShowPersonal, spellId = UnitAura(unit, i, "HARMFUL")
        if not name then break end
        if debuffType == "Magic" or debuffType == "Curse" then
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
            local purifySpiritInRange = A.PurifySpirit:IsSpellInRange(member.Unit)          
            if not isDead and purifySpiritInRange then
                local needsDispelResult = needsDispel(member.Unit)              
                if needsDispelResult then                    
                    A.HealingEngine.SetTarget(member.Unit)
                    return A.PurifySpirit:Show(icon)
                end
            end
        end
    end
    return nil
end
local function RestoDamageRotation(icon, unit)
    if not A.IsUnitEnemy(unit) then
        return false
    end
    if not Action.Unit(unit):IsExists() then
        return false
    end
    if Action.Unit(unit):IsDead() then
        return false
    end
    if not A.LightningBolt:IsSpellInRange(unit) then
        return false
    end
    if A.FlameShock:IsReady(unit) and A.FlameShock:IsSpellInRange(unit) and flameShockNeedsRefresh(unit) then
        return A.FlameShock:Show(icon)
    end
    local isMoving = Action.Player:IsMoving()
    if A.LavaBurst:IsReady(unit) and A.LavaBurst:IsSpellInRange(unit) and 
       (not isMoving or Action.Unit("player"):HasBuffs(A.SWG.ID) > 0) then
        return A.LavaBurst:Show(icon)
    end
    if A.LightningBolt:IsReady(unit) and A.LightningBolt:IsSpellInRange(unit) then
        return A.LightningBolt:Show(icon)
    end
    return false
end
local function HealingRotation(icon)
    local isMoving = Action.Player:IsMoving()
    local hasSWG = Action.Unit("player"):HasBuffs(A.SWG.ID) > 0
    local swgReady = A.SWG:IsReady()
    local hasUnleashLife = Action.Unit("player"):HasBuffs(A.UnleashLife.ID) > 0
    if hasUnleashLife and A.HealingRain:IsReady() then
        if not isMoving or hasSWG then
            return A.HealingRain:Show(icon)
        elseif isMoving and swgReady and not hasSWG then
            return A.SWG:Show(icon)
        end
    end
    local dispelTarget = findDispelTarget(icon)
    if dispelTarget then
        return dispelTarget
    end
    if A.ManaTideTotem:IsReady() and Action.Unit("player"):CombatTime() > 0 and A.BurstIsON("target") and Action.Player:ManaPercentage() < 80 then
        return A.ManaTideTotem:Show(icon)
    end
    if A.Riptide:IsReady() and Action.Unit("player"):CombatTime() > 0 then
        local mostInjured, lowestHealth = getMostInjuredPlayer()
        if mostInjured and lowestHealth < 95 then
            A.HealingEngine.SetTarget(mostInjured.Unit)
            return A.Riptide:Show(icon)
        else
            local playerWithoutRiptide = getPlayerWithoutRiptide()
            if playerWithoutRiptide then
                A.HealingEngine.SetTarget(playerWithoutRiptide.Unit)
                return A.Riptide:Show(icon)
            end
        end
    end
    local singleTarget = getTargetForSingleTargetHeal()
    if singleTarget then
        local healingSpell = getHealingSpellForTarget(singleTarget)
        if healingSpell and healingSpell:IsReady() and healingSpell:IsSpellInRange(singleTarget.unit) then
            if not isMoving or hasSWG then
                A.HealingEngine.SetTarget(singleTarget.unit)
                return healingSpell:Show(icon)
            elseif isMoving and swgReady and not hasSWG then
                return A.SWG:Show(icon)
            end
        end
    end
    if A.UnleashElements:IsReady() and A.HealingRain:IsReady() then
        local healingRainThreshold = A.GetToggle(2, "HealingRainThreshold") or 85
        local healingRainMinTargets = A.GetToggle(2, "HealingRainMinTargets") or 3
        local nearbyInjured = countInjuredPlayers(healingRainThreshold)
        if nearbyInjured >= healingRainMinTargets then
            if not isMoving or hasSWG then
                return A.UnleashElements:Show(icon)
            elseif isMoving and swgReady and not hasSWG then
                return A.SWG:Show(icon)
            end
        end
    end
    if A.HealingRain:IsReady() then
        local healingRainThreshold = A.GetToggle(2, "HealingRainThreshold") or 85
        local healingRainMinTargets = A.GetToggle(2, "HealingRainMinTargets") or 3
        local nearbyInjured = countInjuredPlayers(healingRainThreshold)
        if nearbyInjured >= healingRainMinTargets then
            if not isMoving or hasSWG then
                return A.HealingRain:Show(icon)
            elseif isMoving and swgReady and not hasSWG then
                return A.SWG:Show(icon)
            end
        end
    end
    if A.HealingStreamTotem:IsReady() then
        local avgHealth = A.HealingEngine.GetHealthAVG()
        if avgHealth < 95 then
            return A.HealingStreamTotem:Show(icon)
        end
    end
    if A.EarthShield:IsReady() then
        local tankNeedingShield = getTankNeedingEarthShield()
        if tankNeedingShield then
            A.HealingEngine.SetTarget(tankNeedingShield.unit)
            return A.EarthShield:Show(icon)
        end
    end
    if A.ChainHeal:IsReady() and shouldCastChainHeal() then
        local playerWithRiptide = getPlayerWithRiptide()
        if playerWithRiptide then
            if not isMoving or hasSWG then
                A.HealingEngine.SetTarget(playerWithRiptide.Unit)
                return A.ChainHeal:Show(icon)
            elseif isMoving and swgReady and not hasSWG then
                return A.SWG:Show(icon)
            end
        else
            local mostInjured, lowestHealth = getMostInjuredPlayer()
            if mostInjured and lowestHealth <= 80 then
                if not isMoving or hasSWG then
                    A.HealingEngine.SetTarget(mostInjured.Unit)
                    return A.ChainHeal:Show(icon)
                elseif isMoving and swgReady and not hasSWG then
                    return A.SWG:Show(icon)
                end
            end
        end
    end
    return false
end
local function shouldApplyFlameShock(unit)
    local ttd = Action.Unit(unit):TimeToDie()
    return ttd > 8 
end
local function isUnitInCombatWithPlayer(unit)
    local unitObj = Action.Unit(unit)
    if unitObj:CombatTime() <= 0 then
        return false
    end
    local playerThreatOnUnit = UnitThreatSituation("player", unit)
    if playerThreatOnUnit and playerThreatOnUnit > 0 then
        return true
    end
    if UnitIsUnit(unit .. "target", "player") then
        return true
    end
    if UnitIsUnit("target", unit) then
        return true
    end
    return false
end
local function enemiesMissingFlameShockWithTTD()
    local count = 0
    local activeUnitPlates = Action.MultiUnits:GetActiveUnitPlates()
    local totalEnemies = 0
    local enemiesInCombat = 0
    local enemiesWithThreat = 0
    local enemiesWithTTD = 0
    local enemiesNeedingFlameShock = 0
    for namePlateUnitID in pairs(activeUnitPlates) do
        local unit = Action.Unit(namePlateUnitID)
        totalEnemies = totalEnemies + 1
        if unit:IsEnemy() and 
           unit:IsExists() and 
           not unit:IsDead() and 
           not unit:IsTotem() and
           isUnitInCombatWithPlayer(namePlateUnitID) then
            enemiesInCombat = enemiesInCombat + 1
            if shouldApplyFlameShock(namePlateUnitID) then
                enemiesWithTTD = enemiesWithTTD + 1
                local flameShockRemain = unit:HasDeBuffs(A.FlameShock.ID, true)
                if not flameShockRemain or flameShockRemain < 3 then
                    enemiesNeedingFlameShock = enemiesNeedingFlameShock + 1
                    count = count + 1
                end
            end
        end
    end
    return count
end
local function currentTargetComplete(unit)
    local isComplete = not flameShockNeedsRefresh(unit)
    return isComplete
end
local function BuffCheck(icon)
    local hasLightningShield = Action.Unit("player"):HasBuffs(A.LightningShield.ID) > 0
    local hasWaterShield = Action.Unit("player"):HasBuffs(A.WaterShield.ID) > 0
    local hasFlametongue = hasFlametongueWeapon()
    local hasEarthLiving = hasEarthLiving()
    if Action.PlayerSpec == 262 then
        if not hasLightningShield and A.LightningShield:IsReady() then
            return A.LightningShield:Show(icon)
        end
        if not hasFlametongue and A.FlametongueWeapon:IsReady() then
            return A.FlametongueWeapon:Show(icon)
        end
    end
    if Action.PlayerSpec == 264 then
        if not hasWaterShield and A.WaterShield:IsReady() then
            return A.WaterShield:Show(icon)
        end
        if not hasEarthLiving and A.EarthLivingWeapon:IsReady() then
            return A.EarthLivingWeapon:Show(icon)
        end
    end
    return false
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
    if not A.LightningBolt:IsSpellInRange(unit) then
        return false
    end    
    local isMoving = Action.Player:IsMoving()
    local lightningShieldCharges = getLightningShieldCharges()
    if A.BurstIsON(unit) and A.FireEle:IsReady() then
        return A.FireEle:Show(icon)
    end    
    if A.BurstIsON(unit) and A.Ascendance:IsReady() and (Action.Unit("player"):HasBuffs(A.AscendanceBuff.ID) == 0) then
        return A.Ascendance:Show(icon)
    end
    if A.BurstIsON(unit) and A.SWG:IsReady() and (Action.Unit("player"):HasBuffs(A.AscendanceBuff.ID) > 0) then
        return A.SWG:Show(icon)
    end
    if A.FlameShock:IsReady(unit) and A.FlameShock:IsSpellInRange(unit) and flameShockNeedsRefresh(unit) then
        return A.FlameShock:Show(icon)
    end    
    if A.LavaBurst:IsReady(unit) and A.LavaBurst:IsSpellInRange(unit) and (((not isMoving) or (Action.Unit("player"):HasBuffs(A.LavaSurge.ID) > 0)) or (Action.Unit("player"):HasBuffs(A.SWG.ID) > 0)) then
        return A.LavaBurst:Show(icon)
    end    
    if A.EarthShock:IsReady(unit) and A.EarthShock:IsSpellInRange(unit) and lightningShieldCharges >= 6 then
        return A.EarthShock:Show(icon)
    end    
    if A.LightningBolt:IsReady(unit) and A.LightningBolt:IsSpellInRange(unit) then
        return A.LightningBolt:Show(icon)
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
    if not A.ChainLightning:IsSpellInRange(unit) then
        return false
    end
    local nearbyEnemies = Action.MultiUnits:GetByRangeInCombat(40)
    if nearbyEnemies ~= lastEnemyCount then
        lastEnemyCount = nearbyEnemies
    end
    if A.BurstIsON(unit) and A.FireEle:IsReady() then
        return A.FireEle:Show(icon)
    end    
    if A.BurstIsON(unit) and A.Ascendance:IsReady() and not Action.Unit("player"):HasBuffs(A.AscendanceBuff.ID) then
        return A.Ascendance:Show(icon)
    end
    if A.BurstIsON(unit) and A.SWG:IsReady() and Action.Unit("player"):HasBuffs(A.AscendanceBuff.ID) then
        return A.SWG:Show(icon)
    end
    if nearbyEnemies >= 4 then
        if shouldUseChainLightning(unit) then
            return A.ChainLightning:Show(icon)
        end
        if flameShockNeedsRefresh(unit) and enemiesMissingFlameShockWithTTD() > 0 and A.FlameShock:IsReady(unit) and A.FlameShock:IsSpellInRange(unit) and shouldApplyFlameShock(unit) then
            return A.FlameShock:Show(icon)
        end
        if currentTargetComplete(unit) and enemiesMissingFlameShockWithTTD() > 0 then
            return A:Show(icon, Action.Const.AUTOTARGET)
        end
        return SingleTargetRotation(icon, unit)
    end
    if nearbyEnemies > 1 and nearbyEnemies < 4 then        
        if currentTargetComplete(unit) and enemiesMissingFlameShockWithTTD() > 0 then
            return A:Show(icon, Action.Const.AUTOTARGET)
        end
        if flameShockNeedsRefresh(unit) and enemiesMissingFlameShockWithTTD() > 0 and A.FlameShock:IsReady(unit) and A.FlameShock:IsSpellInRange(unit) and shouldApplyFlameShock(unit) then
            return A.FlameShock:Show(icon)
        end
        return SingleTargetRotation(icon, unit)
    end   
    return false
end
A[1] = nil
A[2] = nil
A[3] = function(icon)
    local buffs = BuffCheck(icon)
    if buffs then
        return buffs
    end
    if Action.PlayerSpec == 262 then
        local nearbyEnemies = Action.MultiUnits:GetByRangeInCombat(40)
        local rotationSpell = ((nearbyEnemies >= 2) and A.GetToggle(2, "AoE")) and AoERotation(icon, "target") or SingleTargetRotation(icon, "target")
        if rotationSpell then
            return rotationSpell
        end
    end
    if Action.PlayerSpec == 264 then
        local healingSpell = HealingRotation(icon)
        if healingSpell then
            return healingSpell
        end
        local damageSpell = RestoDamageRotation(icon, "target")
        if damageSpell then
            return damageSpell
        end
    end
    return false
end
A[4] = nil
A[5] = nil
A[6] = nil
A[7] = nil
A[8] = nil