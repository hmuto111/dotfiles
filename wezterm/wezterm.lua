local wezterm = require("wezterm")
local config = {}

if wezterm.target_triple:find("windows") then
    config.default_prog = { "wsl.exe", "~" }
    config.launch_menu = {
        {
            label = "PowerShell",
            args = { "powershell.exe", "-NoLogo" },
        },
        {
            label = "コマンドプロンプト",
            args = { "cmd.exe" },
        },
    }
end

config.use_ime = true

config.ime_preedit_rendering = "Builtin"

local function merge_config(file)
    for k, v in pairs(require(file)) do
        config[k] = v
    end
end

merge_config("config/general")
merge_config("config/colorscheme")
merge_config("config/frame")
merge_config("config/font")
merge_config("config/tabbar")
merge_config("config/keybinds")

return config
