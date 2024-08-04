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
  -- Ctrl+Backspaceで前の単語を削除
  {
    key = "Backspace",
    mods = "CTRL",
    action = act.SendKey {
      key = "w",
      mods = "CTRL",
    },
  },
  -- Cmd+wで現在のペインを閉じる
  {
    key = 'w',
    mods = 'CMD',
    action = act.CloseCurrentPane { confirm = true }
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

