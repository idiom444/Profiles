local _G, setmetatable = _G, setmetatable
local TMW = _G.TMW 
local A = _G.Action

-- Defs I might need later

--local Player = Action.Player
--local Listener = Action.Listener
--local GetToggle = Action.GetToggle
--local GetSpellTexture = TMW.GetSpellTexture

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
                    S = 14,
                },
            },					
            {							
                {
                    E = "Slider", 													
                    H = 20,
                    MIN = 1, 
                    MAX = 100,							
                    DB = "DesperatePrayerHP",
                    DBV = 40,
                    L = { 
                        enUS = "Desperate Prayer HP %", 
                        ruRU = "Отчаянная молитва ХП %", 
                    }, 
                    TT = { 
                        enUS = "Cast Desperate Prayer when HP drops below this percentage", 
                        ruRU = "Использовать Отчаянную молитву когда ХП падает ниже этого процента", 
                    }, 
                    M = {},
                    Precision = 1,
                },
                {
                    E = "Slider", 													
                    H = 20,
                    MIN = 1, 
                    MAX = 100,							
                    DB = "DispersionHP",
                    DBV = 20,
                    L = { 
                        enUS = "Dispersion HP %", 
                        ruRU = "Рассеивание ХП %", 
                    }, 
                    TT = { 
                        enUS = "Cast Dispersion when HP drops below this percentage", 
                        ruRU = "Использовать Рассеивание когда ХП падает ниже этого процента", 
                    }, 
                    M = {},
                    Precision = 1,
                },
            },
            {
                {
                    E = "Checkbox", 
                    DB = "UseDispersion",
                    DBV = true,
                    L = { 
                        enUS = "Enable Dispersion", 
                        ruRU = "Включить Рассеивание", 
                    }, 
                    TT = { 
                        enUS = "Enable automatic Dispersion casting when HP is low", 
                        ruRU = "Включить автоматическое использование Рассеивания при низком ХП", 
                    }, 
                    M = {},
                },
            },        
    },
}

