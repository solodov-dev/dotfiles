-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- This is where you actually apply your config choices
-- config.color_scheme_dirs = { "~/.dotfiles/wezterm/colors" }
-- config.color_scheme = "Everforest Light (Medium)"
config.color_scheme = "Gruvbox Material (Gogh)"
config.font = wezterm.font("FiraCode Nerd Font")
-- Tab bar
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
-- Show <<< on the right when leader is active
wezterm.on("update-right-status", function(window, _)
	local leader = ""

	if window:leader_is_active() then
		leader = "<<< "
	end

	window:set_right_status(leader)
end)

-- Keys
config.leader = { key = "Space", mods = "CTRL", timeout_milliseconds = 1000 }

config.keys = {
	{
		key = "c",
		mods = "LEADER",
		action = wezterm.action.SpawnTab("CurrentPaneDomain"),
	},
	{
		key = "x",
		mods = "LEADER",
		action = wezterm.action.CloseCurrentPane({ confirm = true }),
	},
	{
		key = "n",
		mods = "LEADER",
		action = wezterm.action.ActivateTabRelative(1),
	},
	{
		key = "p",
		mods = "LEADER",
		action = wezterm.action.ActivateTabRelative(-1),
	},
	{
		key = "n",
		mods = "SHIFT|CTRL",
		action = wezterm.action.ToggleFullScreen,
	},
}

for i = 1, 9 do
	table.insert(config.keys, {
		key = tostring(i),
		mods = "LEADER",
		action = wezterm.action.ActivateTab(i - 1),
	})
end

-- Maximize on startup
local mux = wezterm.mux
wezterm.on("gui-startup", function(cmd)
	local tab, pane, window = mux.spawn_window(cmd or {})
	window:gui_window():maximize()
end)

-- And finally, return the configuration to wezterm
return config
