local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.automatically_reload_config = true

-- https://wezfurlong.org/wezterm/colorschemes/index.html
config.color_scheme = 'Poimandres Storm'
config.use_ime = true
config.macos_forward_to_ime_modifier_mask = "SHIFT|CTRL"

-- config.default_cursor_style = 'BlinkingBlock'
config.cursor_blink_rate = 400
config.cursor_blink_ease_in = "Constant"
config.cursor_blink_ease_out = "Constant"

config.enable_scroll_bar = true

config.font = wezterm.font_with_fallback {
	'Roboto Mono for Powerline',
	'Hiragino Kaku Gothic Pro',
	'Noto Sans JP',
}
config.font_size = 18.0
config.command_palette_font_size = 18.0
config.window_background_opacity = 0.85
config.macos_window_background_blur = 20

config.window_decorations = 'RESIZE'
config.window_frame = {
	font = wezterm.font({ family = 'Roboto Mono for Powerline', weight = 'Medium' }),
	font_size = 18.0,
  active_titlebar_bg = "none",
}
config.window_background_gradient = {
  colors = { "#000000" },
}
config.show_tab_index_in_tab_bar = false
config.show_new_tab_button_in_tab_bar = false

local SOLID_LEFT_ARROW = wezterm.nerdfonts.ple_lower_right_triangle
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.ple_upper_left_triangle

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
  local background = "#5c6d74"
  local foreground = "#FFFFFF"
  local edge_background = "none"
  if tab.is_active then
    background = "#ae8b2d"
    foreground = "#FFFFFF"
  end
  local edge_foreground = background
  local title = "   " .. wezterm.truncate_right(tab.active_pane.title, max_width - 1) .. "   "
  return {
    { Background = { Color = edge_background } },
    { Foreground = { Color = edge_foreground } },
    { Text = SOLID_LEFT_ARROW },
    { Background = { Color = background } },
    { Foreground = { Color = foreground } },
    { Text = title },
    { Background = { Color = edge_background } },
    { Foreground = { Color = edge_foreground } },
    { Text = SOLID_RIGHT_ARROW },
  }
end)

wezterm.on('update-status', function(window)
	local SOLID_LEFT_ARROW = utf8.char(0xe0b2)

	local color_scheme = window:effective_config().resolved_palette
	local bg = color_scheme.background
	local fg = color_scheme.foreground

	local f = io.open(os.getenv('HOME') .. '/.wezstatus', 'r')
	local status = ''
	if f then
		status = f:read('l')
		f:close()
	end

	window:set_right_status(wezterm.format({
		{ Background = { Color = 'none' } },
		{ Foreground = { Color = bg } },
		{ Text = SOLID_LEFT_ARROW },
		{ Background = { Color = bg } },
		{ Foreground = { Color = fg } },
		{ Text = ' ' .. status .. ' ' },
	}))
end)


config.disable_default_key_bindings = true

config.leader = { key = 'Space', mods = 'CTRL', timeout_milliseconds = 1000 }

config.quick_select_patterns = {
	'[0-9a-zA-Z]+[._-][0-9a-zA-Z._-]+',
}

local act = wezterm.action

config.keys = {
	{ key = 'p',     mods = 'SUPER',       action = act.ActivateCommandPalette },
	{ key = 'l',     mods = 'SUPER',       action = act.QuickSelect },
	{ key = 'Enter', mods = 'ALT',         action = act.ToggleFullScreen },
	{ key = '-',     mods = 'SUPER',       action = act.DecreaseFontSize },
	{ key = '0',     mods = 'SUPER',       action = act.ResetFontSize },
	{ key = '1',     mods = 'SUPER',       action = act.ActivateTab(0) },
	{ key = '2',     mods = 'SUPER',       action = act.ActivateTab(1) },
	{ key = '3',     mods = 'SUPER',       action = act.ActivateTab(2) },
	{ key = '4',     mods = 'SUPER',       action = act.ActivateTab(3) },
	{ key = '5',     mods = 'SUPER',       action = act.ActivateTab(4) },
	{ key = '6',     mods = 'SUPER',       action = act.ActivateTab(5) },
	{ key = '7',     mods = 'SUPER',       action = act.ActivateTab(6) },
	{ key = '8',     mods = 'SUPER',       action = act.ActivateTab(7) },
	{ key = '9',     mods = 'SUPER',       action = act.ActivateTab(-1) },
	{ key = '=',     mods = 'SUPER',       action = act.IncreaseFontSize },

	{ key = '[',     mods = 'SHIFT|SUPER', action = act.ActivateTabRelative(-1) },
	{ key = '[',     mods = 'LEADER',      action = act.ActivateCopyMode },
	{ key = ']',     mods = 'LEADER',      action = act.PasteFrom 'Clipboard' },
	{ key = ']',     mods = 'SHIFT|SUPER', action = act.ActivateTabRelative(1) },
	{ key = 'c',     mods = 'SUPER',       action = act.CopyTo 'Clipboard' },
	-- { key = 'f',     mods = 'SUPER',       action = act.Search 'CurrentSelectionOrEmptyString' },
	{
		key = 'f',
		mods = 'SUPER',
		action = act.Multiple {
			act.ClearSelection,
			act.Search { CaseInSensitiveString = '' },
		}
	},
	{ key = 'h',         mods = 'SUPER',       action = act.HideApplication },
	{ key = 'm',         mods = 'SUPER',       action = act.Hide },
	{ key = 'n',         mods = 'SUPER',       action = act.SpawnWindow },
	{ key = 'q',         mods = 'SUPER',       action = act.QuitApplication },
	{ key = 'r',         mods = 'SUPER',       action = act.ReloadConfiguration },
	{ key = 't',         mods = 'SUPER',       action = act.SpawnTab 'CurrentPaneDomain' },
	{ key = 'v',         mods = 'SUPER',       action = act.PasteFrom 'Clipboard' },
	{ key = 'w',         mods = 'SUPER',       action = act.CloseCurrentTab { confirm = true } },
	{ key = '{',         mods = 'SUPER',       action = act.ActivateTabRelative(-1) },
	{ key = '|',         mods = 'LEADER',      action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } },
	{ key = '|',         mods = 'SUPER',       action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } },
	{ key = '"',         mods = 'LEADER',      action = act.SplitVertical { domain = 'CurrentPaneDomain' } },
	{ key = '"',         mods = 'SUPER',       action = act.SplitVertical { domain = 'CurrentPaneDomain' } },
	{ key = 'k',         mods = 'LEADER',      action = act.ActivatePaneDirection 'Up' },
	{ key = 'j',         mods = 'LEADER',      action = act.ActivatePaneDirection 'Down' },
	{ key = 'h',         mods = 'LEADER',      action = act.ActivatePaneDirection 'Left' },
	{ key = 'l',         mods = 'LEADER',      action = act.ActivatePaneDirection 'Right' },
	{ key = 'Space',     mods = 'LEADER|CTRL', action = act.ActivatePaneDirection 'Next' },
	{ key = 'z',         mods = 'LEADER',      action = act.TogglePaneZoomState },
	{ key = '}',         mods = 'SUPER',       action = act.ActivateTabRelative(1) },
	{ key = '}',         mods = 'SHIFT|SUPER', action = act.ActivateTabRelative(1) },
	{ key = 'UpArrow',   mods = 'SUPER',       action = act.ScrollToPrompt(-1) },
	{ key = 'DownArrow', mods = 'SUPER',       action = act.ScrollToPrompt(1) },
}

config.key_tables = {
	copy_mode = {
		{ key = 'y',      mods = 'CTRL',  action = act.ScrollByLine(-1) },
		{ key = 'e',      mods = 'CTRL',  action = act.ScrollByLine(1) },

		{ key = 'Tab',    mods = 'NONE',  action = act.CopyMode 'MoveForwardWord' },
		{ key = 'Tab',    mods = 'SHIFT', action = act.CopyMode 'MoveBackwardWord' },
		-- { key = 'Enter', mods = 'NONE', action = act.CopyMode 'MoveToStartOfNextLine' },
		{ key = 'Escape', mods = 'NONE',  action = act.CopyMode 'Close' },
		{ key = 'Space',  mods = 'NONE',  action = act.CopyMode { SetSelectionMode = 'Cell' } },
		{ key = '$',      mods = 'NONE',  action = act.CopyMode 'MoveToEndOfLineContent' },
		{ key = '$',      mods = 'SHIFT', action = act.CopyMode 'MoveToEndOfLineContent' },
		{ key = ',',      mods = 'NONE',  action = act.CopyMode 'JumpReverse' },
		{ key = '0',      mods = 'NONE',  action = act.CopyMode 'MoveToStartOfLine' },
		{ key = ';',      mods = 'NONE',  action = act.CopyMode 'JumpAgain' },
		{ key = 'E',      mods = 'NONE',  action = act.CopyMode 'MoveForwardWordEnd' },
		{ key = 'E',      mods = 'SHIFT', action = act.CopyMode 'MoveForwardWordEnd' },
		{ key = 'F',      mods = 'NONE',  action = act.CopyMode { JumpBackward = { prev_char = false } } },
		{ key = 'F',      mods = 'SHIFT', action = act.CopyMode { JumpBackward = { prev_char = false } } },
		{ key = 'G',      mods = 'NONE',  action = act.CopyMode 'MoveToScrollbackBottom' },
		{ key = 'G',      mods = 'SHIFT', action = act.CopyMode 'MoveToScrollbackBottom' },
		{ key = 'H',      mods = 'NONE',  action = act.CopyMode 'MoveToViewportTop' },
		{ key = 'H',      mods = 'SHIFT', action = act.CopyMode 'MoveToViewportTop' },
		{ key = 'L',      mods = 'NONE',  action = act.CopyMode 'MoveToViewportBottom' },
		{ key = 'L',      mods = 'SHIFT', action = act.CopyMode 'MoveToViewportBottom' },
		{ key = 'M',      mods = 'NONE',  action = act.CopyMode 'MoveToViewportMiddle' },
		{ key = 'M',      mods = 'SHIFT', action = act.CopyMode 'MoveToViewportMiddle' },
		{ key = 'O',      mods = 'NONE',  action = act.CopyMode 'MoveToSelectionOtherEndHoriz' },
		{ key = 'O',      mods = 'SHIFT', action = act.CopyMode 'MoveToSelectionOtherEndHoriz' },
		{ key = 'T',      mods = 'NONE',  action = act.CopyMode { JumpBackward = { prev_char = true } } },
		{ key = 'T',      mods = 'SHIFT', action = act.CopyMode { JumpBackward = { prev_char = true } } },
		{ key = 'V',      mods = 'NONE',  action = act.CopyMode { SetSelectionMode = 'Line' } },
		{ key = 'V',      mods = 'SHIFT', action = act.CopyMode { SetSelectionMode = 'Line' } },
		{ key = '^',      mods = 'NONE',  action = act.CopyMode 'MoveToStartOfLineContent' },
		{ key = '^',      mods = 'SHIFT', action = act.CopyMode 'MoveToStartOfLineContent' },
		{ key = 'b',      mods = 'NONE',  action = act.CopyMode 'MoveBackwardWord' },
		{ key = 'b',      mods = 'ALT',   action = act.CopyMode 'MoveBackwardWord' },
		{ key = 'B',      mods = 'NONE',  action = act.CopyMode 'MoveBackwardWord' },
		{ key = 'B',      mods = 'SHIFT', action = act.CopyMode 'MoveBackwardWord' },
		{ key = 'b',      mods = 'CTRL',  action = act.CopyMode 'PageUp' },
		{ key = 'c',      mods = 'CTRL',  action = act.CopyMode 'Close' },
		{ key = 'd',      mods = 'CTRL',  action = act.CopyMode { MoveByPage = (0.25) } },
		{ key = 'e',      mods = 'NONE',  action = act.CopyMode 'MoveForwardWordEnd' },
		{ key = 'f',      mods = 'NONE',  action = act.CopyMode { JumpForward = { prev_char = false } } },
		{ key = 'f',      mods = 'ALT',   action = act.CopyMode 'MoveForwardWord' },
		{ key = 'f',      mods = 'CTRL',  action = act.CopyMode 'PageDown' },
		{ key = 'g',      mods = 'NONE',  action = act.CopyMode 'MoveToScrollbackTop' },
		{ key = 'g',      mods = 'CTRL',  action = act.CopyMode 'Close' },
		{ key = 'h',      mods = 'NONE',  action = act.CopyMode 'MoveLeft' },
		{ key = 'j',      mods = 'NONE',  action = act.CopyMode 'MoveDown' },
		{ key = 'k',      mods = 'NONE',  action = act.CopyMode 'MoveUp' },
		{ key = 'l',      mods = 'NONE',  action = act.CopyMode 'MoveRight' },
		{ key = 'm',      mods = 'ALT',   action = act.CopyMode 'MoveToStartOfLineContent' },
		{ key = 'o',      mods = 'NONE',  action = act.CopyMode 'MoveToSelectionOtherEnd' },
		{ key = 'q',      mods = 'NONE',  action = act.CopyMode 'Close' },
		{ key = 't',      mods = 'NONE',  action = act.CopyMode { JumpForward = { prev_char = true } } },
		{ key = 'u',      mods = 'CTRL',  action = act.CopyMode { MoveByPage = (-0.25) } },
		{ key = 'v',      mods = 'NONE',  action = act.CopyMode { SetSelectionMode = 'Cell' } },
		{ key = 'v',      mods = 'CTRL',  action = act.CopyMode { SetSelectionMode = 'Block' } },
		{ key = 'w',      mods = 'NONE',  action = act.CopyMode 'MoveForwardWord' },
		{
			key = 'Enter',
			mods = 'NONE',
			action = act.Multiple {
				{ CopyTo = 'ClipboardAndPrimarySelection' },
				{ CopyMode = 'Close' },
			}
		},
		{ key = 'PageUp',     mods = 'NONE', action = act.CopyMode 'PageUp' },
		{ key = 'PageDown',   mods = 'NONE', action = act.CopyMode 'PageDown' },
		{ key = 'End',        mods = 'NONE', action = act.CopyMode 'MoveToEndOfLineContent' },
		{ key = 'Home',       mods = 'NONE', action = act.CopyMode 'MoveToStartOfLine' },
		{ key = 'LeftArrow',  mods = 'NONE', action = act.CopyMode 'MoveLeft' },
		{ key = 'LeftArrow',  mods = 'ALT',  action = act.CopyMode 'MoveBackwardWord' },
		{ key = 'RightArrow', mods = 'NONE', action = act.CopyMode 'MoveRight' },
		{ key = 'RightArrow', mods = 'ALT',  action = act.CopyMode 'MoveForwardWord' },
		{ key = 'UpArrow',    mods = 'NONE', action = act.CopyMode 'MoveUp' },
		{ key = 'DownArrow',  mods = 'NONE', action = act.CopyMode 'MoveDown' },
	},

	search_mode = {
		{ key = 'Enter',     mods = 'NONE',  action = act.CopyMode 'PriorMatch' },
		{
			key = 'Escape',
			mods = 'NONE',
			action = act.Multiple {
				act.CopyMode 'ClearPattern',
				act.CopyMode 'Close',
			}
		},
		{
			key = 'c',
			mods = 'CTRL',
			action = act.Multiple {
				act.CopyMode 'ClearPattern',
				act.CopyMode 'Close',
			}
		},
		{ key = 'n',         mods = 'CTRL',  action = act.CopyMode 'NextMatch' },
		{ key = 'p',         mods = 'CTRL',  action = act.CopyMode 'PriorMatch' },
		{ key = 'r',         mods = 'CTRL',  action = act.CopyMode 'CycleMatchType' },
		{ key = 'f',         mods = 'SUPER', action = act.CopyMode 'CycleMatchType' },
		{ key = 'u',         mods = 'CTRL',  action = act.CopyMode 'ClearPattern' },
		{ key = 'PageUp',    mods = 'NONE',  action = act.CopyMode 'PriorMatchPage' },
		{ key = 'PageDown',  mods = 'NONE',  action = act.CopyMode 'NextMatchPage' },
		{ key = 'UpArrow',   mods = 'NONE',  action = act.CopyMode 'PriorMatch' },
		{ key = 'DownArrow', mods = 'NONE',  action = act.CopyMode 'NextMatch' },
	},

}

config.mouse_bindings = {
	{
		event = { Down = { streak = 3, button = 'Left' } },
		action = wezterm.action.SelectTextAtMouseCursor 'SemanticZone',
		mods = 'NONE',
	},
}

return config
