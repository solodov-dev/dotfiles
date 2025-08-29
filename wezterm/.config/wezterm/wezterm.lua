-- Pull in the wezterm API
local wezterm = require("wezterm")
local resurrect = wezterm.plugin.require("https://github.com/MLFlexer/resurrect.wezterm")
local workspace_switcher = wezterm.plugin.require("https://github.com/MLFlexer/smart_workspace_switcher.wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices
-- config.color_scheme_dirs = { "~/.dotfiles/wezterm/colors" }
-- config.color_scheme = "Everforest Light (Medium)"
config.color_scheme = "Dracula (Official)"
config.font = wezterm.font("FiraCode Nerd Font")
config.window_padding = {
  top = 0,
  bottom = 0,
  left = 0,
  right = 0,
}
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
    key = ':',
    mods = 'LEADER|SHIFT',
    action = wezterm.action.ActivateCommandPalette,
  },
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
  {
    key = "s",
    mods = "LEADER",
    action = wezterm.action_callback(function(win, pane)
      resurrect.state_manager.save_state(resurrect.workspace_state.get_workspace_state())
      resurrect.window_state.save_window_action()
    end),
  },
  {
    key = "r",
    mods = "LEADER",
    action = wezterm.action_callback(function(win, pane)
      resurrect.fuzzy_loader.fuzzy_load(win, pane, function(id, label)
        local type = string.match(id, "^([^/]+)") -- match before '/'
        id = string.match(id, "([^/]+)$")         -- match after '/'
        id = string.match(id, "(.+)%..+$")        -- remove file extention
        local opts = {
          relative = true,
          restore_text = true,
          on_pane_restore = resurrect.tab_state.default_on_pane_restore,
        }
        if type == "workspace" then
          local state = resurrect.state_manager.load_state(id, "workspace")
          resurrect.workspace_state.restore_workspace(state, opts)
        elseif type == "window" then
          local state = resurrect.state_manager.load_state(id, "window")
          resurrect.window_state.restore_window(pane:window(), state, opts)
        elseif type == "tab" then
          local state = resurrect.state_manager.load_state(id, "tab")
          resurrect.tab_state.restore_tab(pane:tab(), state, opts)
        end
      end)
    end),
  },
}

wezterm.on("augment-command-palette", function(window, pane)
  local workspace_state = resurrect.workspace_state
  return {
    {
      brief = "Window | Workspace: Switch Workspace",
      icon = "md_briefcase_arrow_up_down",
      action = workspace_switcher.switch_workspace(),
    },
    {
      brief = "Window | Workspace: Rename Workspace",
      icon = "md_briefcase_edit",
      action = wezterm.action.PromptInputLine({
        description = "Enter new name for workspace",
        action = wezterm.action_callback(function(window, pane, line)
          if line then
            wezterm.mux.rename_workspace(wezterm.mux.get_active_workspace(), line)
            resurrect.state_manager.save_state(workspace_state.get_workspace_state())
          end
        end),
      }),
    },
  }
end)

-- loads the state whenever I create a new workspace
wezterm.on("smart_workspace_switcher.workspace_switcher.created", function(window, path, label)
  local workspace_state = resurrect.workspace_state

  workspace_state.restore_workspace(resurrect.state_manager.load_state(label, "workspace"), {
    window = window,
    relative = true,
    restore_text = true,
    on_pane_restore = resurrect.tab_state.default_on_pane_restore,
  })
end)

-- Saves the state whenever I select a workspace
wezterm.on("smart_workspace_switcher.workspace_switcher.selected", function(window, path, label)
  local workspace_state = resurrect.workspace_state
  resurrect.state_manager.save_state(workspace_state.get_workspace_state())
end)

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
