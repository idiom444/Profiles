local _G, setmetatable = _G, setmetatable
local TMW = _G.TMW 
local A = _G.Action
A.Data.ProfileEnabled[A.CurrentProfile] = true 
    
A.Data.ProfileUI = {	
    DateTime = "v1.0 (13.09.2025)",
    [2] = {        						
        {
            {	
                E = "Header",
                L = { 
                    enUS = "Elemental Shaman Settings", 
                    ruRU = "Настройки Элементального Шамана", 
                }, 
                S = 20,
            },
        },
        {
            {
                E = "Checkbox", 
                DB = "AoE",
                DBV = false,
                L = { 
                    enUS = "AoE Rotation", 
                    ruRU = "AoE Ротация", 
                }, 
                TT = { 
                    enUS = "Enable AoE rotation for multiple targets", 
                    ruRU = "Включить AoE ротацию для нескольких целей", 
                }, 
                M = {},
            },
        },
        {							
            {
                E = "Slider", 													
                MIN = 0.0, 
                MAX = 1.5, 
                STP = 0.1,
                DB = "TargetSwapDelay",
                DBV = 0.1,
                Precision = 1,
                L = { 
                    enUS = "AUTOTARGET Delay (seconds)", 
                    ruRU = "Задержка AUTOTARGET (секунды)", 
                }, 
                TT = { 
                    enUS = "Delay between AUTOTARGET swaps to prevent rapid switching. Lower values = faster switching, higher values = slower switching.", 
                    ruRU = "Задержка между переключениями AUTOTARGET для предотвращения быстрого переключения. Меньшие значения = быстрее переключение, большие значения = медленнее переключение.", 
                }, 
                M = {},
            },
        },
        {							
            {
                E = "Slider", 													
                MIN = 0.0, 
                MAX = 1.5, 
                STP = 0.1,
                DB = "LastTargetDelay",
                DBV = 0.1,
                Precision = 1,
                L = { 
                    enUS = "LASTTARGET Delay (seconds)", 
                    ruRU = "Задержка LASTTARGET (секунды)", 
                }, 
                TT = { 
                    enUS = "Delay between LASTTARGET returns to prevent rapid switching. Lower values = faster switching, higher values = slower switching.", 
                    ruRU = "Задержка между возвратами LASTTARGET для предотвращения быстрого переключения. Меньшие значения = быстрее переключение, большие значения = медленнее переключение.", 
                }, 
                M = {},
            },
        },
        {
            {	
                E = "Header",
                L = { 
                    enUS = "Resto Shaman Settings", 
                    ruRU = "Настройки Рестор Шамана", 
                }, 
                S = 20,
            },
        },
        {
            {
                E = "Slider", 													
                MIN = 50, 
                MAX = 100, 
                DB = "HealingRainThreshold",
                DBV = 85,
                ONOFF = false,
                WIDTH = 120,
                L = { 
                    enUS = "Healing Rain Threshold %", 
                    ruRU = "Порог Дождя исцеления %", 
                }, 
                TT = { 
                    enUS = "Cast Healing Rain when players are below this health %", 
                    ruRU = "Использовать Дождь исцеления когда игроки ниже этого здоровья %", 
                }, 
                M = {},
            },
            {
                E = "Slider", 													
                MIN = 1, 
                MAX = 20, 
                DB = "HealingRainMinTargets",
                DBV = 3,
                ONOFF = false,
                WIDTH = 120,
                L = { 
                    enUS = "Healing Rain Min Targets", 
                    ruRU = "Мин. целей для Дождя", 
                }, 
                TT = { 
                    enUS = "Minimum number of injured targets needed for Healing Rain", 
                    ruRU = "Минимальное количество раненых целей для Дождя исцеления", 
                }, 
                M = {},
            },
        },
        {
            {
                E = "Slider", 													
                MIN = 50, 
                MAX = 100, 
                DB = "ChainHealThreshold",
                DBV = 80,
                ONOFF = false,
                WIDTH = 120,
                L = { 
                    enUS = "Chain Heal Threshold %", 
                    ruRU = "Порог Цепного исцеления %", 
                }, 
                TT = { 
                    enUS = "Cast Chain Heal when players are below this health %", 
                    ruRU = "Использовать Цепное исцеление когда игроки ниже этого здоровья %", 
                }, 
                M = {},
            },
            {
                E = "Slider", 													
                MIN = 1, 
                MAX = 20, 
                DB = "ChainHealMinTargets",
                DBV = 4,
                ONOFF = false,
                WIDTH = 120,
                L = { 
                    enUS = "Chain Heal Min Targets", 
                    ruRU = "Мин. целей для Цепного", 
                }, 
                TT = { 
                    enUS = "Minimum number of injured targets needed for Chain Heal", 
                    ruRU = "Минимальное количество раненых целей для Цепного исцеления", 
                }, 
                M = {},
            },
        },
        {
            {
                E = "Slider", 													
                MIN = 10, 
                MAX = 100, 
                DB = "HealingSurgeDPSHealerHP",
                DBV = 25,
                ONOFF = false,
                WIDTH = 120,
                L = { 
                    enUS = "Healing Surge HP %", 
                    ruRU = "Всплеск исцеления HP %", 
                }, 
                TT = { 
                    enUS = "Cast Healing Surge when targets are below this health %", 
                    ruRU = "Использовать Всплеск исцеления когда цели ниже этого здоровья %", 
                }, 
                M = {},
            },
        },
        {
            {
                E = "Slider", 													
                MIN = 10, 
                MAX = 100, 
                DB = "GreaterHealingWaveDPSHealerHP",
                DBV = 40,
                ONOFF = false,
                WIDTH = 120,
                L = { 
                    enUS = "Greater Healing Wave HP %", 
                    ruRU = "Большая волна исцеления HP %", 
                }, 
                TT = { 
                    enUS = "Cast Greater Healing Wave when targets are below this health %", 
                    ruRU = "Использовать Большую волну исцеления когда цели ниже этого здоровья %", 
                }, 
                M = {},
            },
        },
        {
            {
                E = "Slider", 													
                MIN = 10, 
                MAX = 100, 
                DB = "HealingWaveDPSHealerHP",
                DBV = 60,
                ONOFF = false,
                WIDTH = 120,
                L = { 
                    enUS = "Healing Wave HP %", 
                    ruRU = "Волна исцеления HP %", 
                }, 
                TT = { 
                    enUS = "Cast Healing Wave when targets are below this health %", 
                    ruRU = "Использовать Волну исцеления когда цели ниже этого здоровья %", 
                }, 
                M = {},
            },
        },
    },
}