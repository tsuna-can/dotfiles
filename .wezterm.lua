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
config.font_size = 14

-- ショートカットキー設定
config.keys = {
  -- Ctrl+tで新しいタブを作成
  {
    key = 't',
    mods = 'CMD',
    action = act.SpawnTab 'CurrentPaneDomain',
  },
  -- Ctrl+dで新しいペインを作成(画面を分割)
  {
    key = 'd',
    mods = 'CMD',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = "LeftArrow",
    mods = "CMD",
    action = act.SendKey {
      key = "b",
      mods = "META",
    },
  },
  -- Ctrl+右矢印でカーソルを次の単語に移動
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
  {
    key = 'w',
    mods = 'CMD',
    action = act.CloseCurrentPane { confirm = true }
  },
  {
    key = 'C',
    mods = 'CMD|SHIFT',
    action = act.ActivateCopyMode
  }
}

return config
