local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.automatically_reload_config = true

-- ショートカットキー設定
local act = wezterm.action

-- フォントの設定
config.font = wezterm.font("Firge35Nerd Console")

-- フォントサイズの設定
config.font_size = 15

-- カーソルの設定
config.default_cursor_style = "SteadyBar"

-- タイトルバーを非表示
config.window_decorations = "RESIZE"

-- ウィンドウのpaddingの設定
config.window_padding = {
  left = 2,
  right = 0,
  top = 0,
  bottom = 0,
}

-- タブ追加ボタンを非表示
config.show_new_tab_button_in_tab_bar = false

-- Hide tab close button
-- As of now(2024/10), only nightly version supports this feature
config.show_close_tab_button_in_tabs = false

-- タブのスタイル設定
wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
  local background = "#3b4252" -- 非アクティブ: 背景（暗グレー）
  local foreground = "#d8dee9" -- 非アクティブ: 文字色（淡グレー）

  if tab.is_active then
    background = "#a3be8c" -- アクティブ: 背景（グリーン）
    foreground = "#2e3440" -- アクティブ: 文字色（濃グレー）
  end

  -- タブ番号（1始まり）を追加
  local tab_index = tab.tab_index + 1
  local title = string.format(" %d: %s ", tab_index, wezterm.truncate_right(tab.active_pane.title, max_width))

  return {
    { Background = { Color = background } },
    { Foreground = { Color = foreground } },
    { Text = title },
  }
end)

-- ウィンドウの背景の透過度とぼかしの設定
config.window_background_opacity = 0.75
config.macos_window_background_blur = 20

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
  -- Cmd+dでアクティブなPaneを閉じる、それが最後のPaneならTabを閉じる
  {
    key = 'w',
    mods = 'CMD',
    action = wezterm.action.CloseCurrentPane { confirm = true },
  },
  {
    key = 'LeftArrow',
    mods = 'CTRL|SHIFT',
    action = act.ActivatePaneDirection 'Left',
  },
  {
    key = 'RightArrow',
    mods = 'CTRL|SHIFT',
    action = act.ActivatePaneDirection 'Right',
  },
  {
    key = 'UpArrow',
    mods = 'CTRL|SHIFT',
    action = act.ActivatePaneDirection 'Up',
  },
  {
    key = 'DownArrow',
    mods = 'CTRL|SHIFT',
    action = act.ActivatePaneDirection 'Down',
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
  -- Cmd+Ctrl+fでフルスクリーンモードを切り替え
  {
    key = 'f',
    mods = 'CMD|CTRL',
    action = wezterm.action.ToggleFullScreen,
  },
  -- Shift+Enterで改行を送信
  {
    key = 'Enter',
    mods = 'SHIFT',
    action = wezterm.action.SendString('\n')
  },
}

-- システムベル音を有効化（Claude Codeのタスク完了通知用）
config.audible_bell = "SystemBeep"

return config
