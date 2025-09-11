local _G                         = _G
local Action                     = _G.Action
local A                          = Action
local CONST                      = A.Const
local ACTION_CONST_PRIEST_SHADOW = CONST.PRIEST_SHADOW
local TMW                        = _G.TMW
local Create = Action.Create

-- Defs I might need later

--local Player = Action.Player
--local Listener = Action.Listener
--local GetToggle = Action.GetToggle
--local GetSpellTexture = TMW.GetSpellTexture

A.Data.ProfileEnabled[A.CurrentProfile] = true 

A.Data.ProfileUI = {
    DateTime = "recently updated",
    [2] = {
        [ACTION_CONST_PRIEST_SHADOW] = {
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
}

Action[ACTION_CONST_PRIEST_SHADOW] = {
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

