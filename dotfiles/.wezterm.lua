local wezterm = require("wezterm")

function scheme_for_appearance(appearance)
  if appearance:find "Dark" then
    return "Catppuccin Frappe"
  else
    return "Catppuccin Latte"
  end
end

local config = wezterm.config_builder()

config.color_scheme = scheme_for_appearance(wezterm.gui.get_appearance())
config.font = wezterm.font(
	"JetBrainsMonoNL Nerd Font Mono",
	{ weight = "Regular", stretch = "Normal", style = "Normal", italic = false }
)
config.font_size = 14.5
config.native_macos_fullscreen_mode = true
config.window_decorations = "RESIZE"
config.enable_tab_bar = false
config.default_prog = { "/bin/zsh", "-l", "-c", "tmux" }
config.scrollback_lines = 1000000

return config
