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
                        enUS = "Shadow Priest Settings", 
                        ruRU = "Настройки Теневого Жреца", 
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
                {
                    E = "Checkbox", 
                    DB = "UseDispersion",
                    DBV = true,
                    L = { 
                        enUS = "Use Dispersion", 
                        ruRU = "Использовать Рассеивание", 
                    }, 
                    TT = { 
                        enUS = "Enable/Disable Dispersion usage", 
                        ruRU = "Включить/Отключить использование Рассеивания", 
                    }, 
                    M = {},
                },
            },
            {
                {
                    E = "Checkbox", 
                    DB = "UseDesperatePrayer",
                    DBV = true,
                    L = { 
                        enUS = "Use Desperate Prayer", 
                        ruRU = "Использовать Отчаянную молитву", 
                    }, 
                    TT = { 
                        enUS = "Enable/Disable Desperate Prayer usage", 
                        ruRU = "Включить/Отключить использование Отчаянной молитвы", 
                    }, 
                    M = {},
                },
                {
                    E = "Checkbox", 
                    DB = "UseVampiricEmbrace",
                    DBV = true,
                    L = { 
                        enUS = "Use Vampiric Embrace", 
                        ruRU = "Использовать Вампирическое объятие", 
                    }, 
                    TT = { 
                        enUS = "Enable/Disable Vampiric Embrace usage", 
                        ruRU = "Включить/Отключить использование Вампирического объятия", 
                    }, 
                    M = {},
                },
            },
            {							
                {
                    E = "Slider", 													
                    MIN = 5, 
                    MAX = 100, 
                    DB = "DesperatePrayerHP",
                    DBV = 30,
                    ONOFF = false,
                    L = { 
                        enUS = "Desperate Prayer HP %", 
                        ruRU = "Отчаянная молитва ХП %", 
                    }, 
                    TT = { 
                        enUS = "Cast Desperate Prayer when HP drops below this %", 
                        ruRU = "Использовать Отчаянную молитву когда ХП падает ниже этого %", 
                    }, 
                    M = {},
                },
            },
            {							
                {
                    E = "Slider", 													
                    MIN = 5, 
                    MAX = 100, 
                    DB = "DispersionHP",
                    DBV = 20,
                    ONOFF = false,
                    L = { 
                        enUS = "Dispersion HP %", 
                        ruRU = "Рассеивание ХП %", 
                    }, 
                    TT = { 
                        enUS = "Cast Dispersion when HP drops below this %", 
                        ruRU = "Использовать Рассеивание когда ХП падает ниже этого %", 
                    }, 
                    M = {},
                },
            },
            {							
                {
                    E = "Slider", 													
                    MIN = 5, 
                    MAX = 100, 
                    DB = "VampiricEmbraceHP",
                    DBV = 50,
                    ONOFF = false,
                    L = { 
                        enUS = "Vampiric Embrace Group HP %", 
                        ruRU = "Вампирическое объятие Группа ХП %", 
                    }, 
                    TT = { 
                        enUS = "Cast Vampiric Embrace when group HP drops below this %", 
                        ruRU = "Использовать Вампирическое объятие когда ХП группы падает ниже этого %", 
                    }, 
                    M = {},
                },
            },
            {
                {	
                    E = "Header",
                    L = { 
                        enUS = "Holy Priest Settings", 
                        ruRU = "Настройки Теневого Жреца", 
                    }, 
                    S = 20,
                },
            },
            {
                {
                    E = "Slider", 													
                    MIN = 50, 
                    MAX = 100, 
                    DB = "HolyRenewThreshold",
                    DBV = 90,
                    ONOFF = false,
                    L = { 
                        enUS = "Renew Threshold %", 
                        ruRU = "Порог Обновления %", 
                    }, 
                    TT = { 
                        enUS = "Cast Renew on players below this health %", 
                        ruRU = "Использовать Обновление на игроках ниже этого здоровья %", 
                    }, 
                    M = {},
                },
            },
            {
                {
                    E = "Slider", 													
                    MIN = 50, 
                    MAX = 100, 
                    DB = "HolyAOEThreshold",
                    DBV = 80,
                    ONOFF = false,
                    L = { 
                        enUS = "AOE Healing Threshold %", 
                        ruRU = "Порог АОЕ лечения %", 
                    }, 
                    TT = { 
                        enUS = "Start AOE healing when group health drops below this %", 
                        ruRU = "Начать АОЕ лечение когда здоровье группы падает ниже этого %", 
                    }, 
                    M = {},
                },
            },
            {
                {
                    E = "Slider", 													
                    MIN = 1, 
                    MAX = 100, 
                    DB = "HolyCircleThreshold",
                    DBV = 80,
                    ONOFF = false,
                    L = { 
                        enUS = "Circle of Healing Threshold", 
                        ruRU = "Порог Круга исцеления", 
                    }, 
                    TT = { 
                        enUS = "Use Circle of Healing when 6 players are below % health", 
                        ruRU = "Использовать Круг исцеления когда столько игроков ниже 80% здоровья", 
                    }, 
                    M = {},
                },
                {
                    E = "Slider", 													
                    MIN = 1, 
                    MAX = 20, 
                    DB = "HolyCircleMinTargets",
                    DBV = 6,
                    ONOFF = false,
                    WIDTH = 120,
                    L = { 
                        enUS = "Circle Min Targets", 
                        ruRU = "Мин. целей для Круга", 
                    }, 
                    TT = { 
                        enUS = "Minimum number of targets needed for Circle of Healing", 
                        ruRU = "Минимальное количество целей для Круга исцеления", 
                    }, 
                },
            },
            {
                {
                    E = "Slider", 													
                    MIN = 1, 
                    MAX = 100, 
                    DB = "HolyPrayerThreshold",
                    DBV = 80,
                    ONOFF = false,
                    WIDTH = 120,
                    L = { 
                        enUS = "PoH Threshold", 
                        ruRU = "Порог Молитвы", 
                    }, 
                    TT = { 
                        enUS = "Health percentage threshold for Prayer of Healing", 
                        ruRU = "Порог здоровья для Молитвы исцеления", 
                    }, 
                },
                {
                    E = "Slider", 													
                    MIN = 1, 
                    MAX = 20, 
                    DB = "HolyPrayerMinTargets",
                    DBV = 5,
                    ONOFF = false,
                    WIDTH = 120,
                    L = { 
                        enUS = "PoH Min Targets", 
                        ruRU = "Мин. целей для Молитвы", 
                    }, 
                    TT = { 
                        enUS = "Minimum number of targets needed for Prayer of Healing", 
                        ruRU = "Минимальное количество целей для Молитвы исцеления", 
                    }, 
                },
            },
            {
                {
                    E = "Slider", 													
                    MIN = 1, 
                    MAX = 100, 
                    DB = "SpotHealingThreshold",
                    DBV = 30,
                    ONOFF = false,
                    L = { 
                        enUS = "Spot Healing Threshold", 
                        ruRU = "Порог точечного исцеления", 
                    }, 
                    TT = { 
                        enUS = "Health percentage threshold for spot healing", 
                        ruRU = "Порог здоровья для точечного исцеления", 
                    }, 
                    M = {},
                },
            },
            {
                {	
                    E = "Header",
                    L = { 
                        enUS = "Discipline Priest Settings", 
                        ruRU = "Настройки Жреца Дисциплины", 
                    }, 
                    S = 20,
                },
            },
            {
                {
                    E = "Slider", 													
                    MIN = 1, 
                    MAX = 100, 
                    DB = "DiscSpotHealingThreshold",
                    DBV = 30,
                    ONOFF = false,
                    L = { 
                        enUS = "Spot Healing Health %", 
                        ruRU = "Порог точечного исцеления %", 
                    }, 
                    TT = { 
                        enUS = "Health percentage threshold for spot healing in Discipline spec", 
                        ruRU = "Порог здоровья для точечного исцеления в специализации Дисциплина", 
                    }, 
                    M = {},
                },
            },
            {
                {
                    E = "Slider", 													
                    MIN = 1, 
                    MAX = 100, 
                    DB = "DivineStarHealthThreshold",
                    DBV = 80,
                    ONOFF = false,
                    WIDTH = 120,
                    L = { 
                        enUS = "Divine Star Health %", 
                        ruRU = "Божественная звезда Здоровье %", 
                    }, 
                    TT = { 
                        enUS = "Health percentage threshold for Divine Star", 
                        ruRU = "Порог здоровья для Божественной звезды", 
                    }, 
                },
                {
                    E = "Slider", 													
                    MIN = 1, 
                    MAX = 20, 
                    DB = "DivineStarMinTargets",
                    DBV = 3,
                    ONOFF = false,
                    WIDTH = 120,
                    L = { 
                        enUS = "Divine Star Min Players", 
                        ruRU = "Мин. игроков для Звезды", 
                    }, 
                    TT = { 
                        enUS = "Minimum number of damaged players needed for Divine Star", 
                        ruRU = "Минимальное количество поврежденных игроков для Божественной звезды", 
                    }, 
                },
            },
            {
                {
                    E = "Slider", 													
                    MIN = 1, 
                    MAX = 100, 
                    DB = "PoMHealthThreshold",
                    DBV = 80,
                    ONOFF = false,
                    WIDTH = 120,
                    L = { 
                        enUS = "PoM Health %", 
                        ruRU = "Молитва исцеления %", 
                    }, 
                    TT = { 
                        enUS = "Health percentage threshold for Prayer of Mending", 
                        ruRU = "Порог здоровья для Молитвы исцеления", 
                    }, 
                },
                {
                    E = "Slider", 													
                    MIN = 1, 
                    MAX = 20, 
                    DB = "PoMMinTargets",
                    DBV = 3,
                    ONOFF = false,
                    WIDTH = 120,
                    L = { 
                        enUS = "PoM Min Players", 
                        ruRU = "Мин. игроков для Молитвы", 
                    }, 
                    TT = { 
                        enUS = "Minimum number of damaged players needed for Prayer of Mending", 
                        ruRU = "Минимальное количество поврежденных игроков для Молитвы исцеления", 
                    }, 
                },
            },
        },
    }
