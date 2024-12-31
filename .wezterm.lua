local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- カラースキームの設定
config.color_scheme = 'TokyoNight'

-- ショートカットキー設定
local act = wezterm.action

-- フォントの設定
config.font = wezterm.font("Hack Nerd Font", { weight = "Medium", stretch = "Normal", style = "Normal" })

-- フォントサイズの設定
config.font_size = 16

-- カーソルの設定
config.default_cursor_style = "SteadyBar"

-- タイトルバーを非表示
config.window_decorations = "RESIZE"

-- ウィンドウの枠線の設定
config.window_frame = {
  border_bottom_height = '0.1cell',
  border_bottom_color = '#5c6d74',
}

-- タブ追加ボタンを非表示
config.show_new_tab_button_in_tab_bar = false

-- Hide tab close button
-- As of now(2024/10), only nightly version supports this feature
config.show_close_tab_button_in_tabs = false

-- タブのスタイル設定
wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
  local background = "#5c6d74"
  local foreground = "#FFFFFF"

  if tab.is_active then
    background = "#ae8b2d"
    foreground = "#FFFFFF"
  end

  local title = "   " .. wezterm.truncate_right(tab.active_pane.title, max_width - 1) .. "   "

  return {
    { Background = { Color = background } },
    { Foreground = { Color = foreground } },
    { Text = title },
  }
end)

-- ショートカットキー設定
config.keys = {
  -- Cmd+tで新しいタブを作成
  {
    key = 't',
    mods = 'CMD',
    action = act.SpawnTab 'CurrentPaneDomain',
  },
  -- Cmd+dで新しいペインを作成(画面を分割)
  {
    key = 'd',
    mods = 'CMD',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  -- Cmd+左矢印でカーソルを前の単語に移動
  {
    key = "LeftArrow",
    mods = "CMD",
    action = act.SendKey {
      key = "b",
      mods = "META",
    },
  },
  -- Cmd+右矢印でカーソルを次の単語に移動
  {
    key = "RightArrow",
    mods = "CMD",
    action = act.SendKey {
      key = "f",
      mods = "META",
    },
  },
  -- Cmd+Shift+cでコピーモードを開始
  {
    key = 'C',
    mods = 'CMD|SHIFT',
    action = act.ActivateCopyMode
  },
  -- Cmd+Ctrl+fでフルスクリーンモードを切り替え
  {
    key = 'f',
    mods = 'CMD|CTRL',
    action = wezterm.action.ToggleFullScreen,
  },
}

return config

