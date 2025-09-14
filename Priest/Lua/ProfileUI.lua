local _G, setmetatable = _G, setmetatable
local TMW = _G.TMW 
local A = _G.Action
A.Data.ProfileEnabled[A.CurrentProfile] = true 
A.Data.ProfileUI = {	
    DateTime = "v1.0 (13.09.2025)",
    [2] = {
        [ACTION_CONST_PRIEST_SHADOW] = { 						
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
        },
    },
}

