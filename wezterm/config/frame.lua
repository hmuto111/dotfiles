local config = {}

config.front_end = "WebGpu"

config.window_decorations = 'INTEGRATED_BUTTONS'

config.window_background_opacity = 0.9
config.text_background_opacity = 0.9

config.animation_fps = 1

config.win32_system_backdrop = "Disable"
config.default_cursor_style = "BlinkingBar"
config.cursor_blink_rate = 500
config.cursor_blink_ease_in = 'Constant'
config.cursor_blink_ease_out = 'Constant'

config.window_frame = {
    inactive_titlebar_bg = 'None',
    active_titlebar_bg = 'None',
}
config.colors = {
    tab_bar = {
        inactive_tab_edge = "None"
    }
}

return config