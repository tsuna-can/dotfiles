# リピート入力認識の速度を上げる
defaults write -g InitialKeyRepeat -int 13

# キーリピートの速度を上げる
defaults write -g KeyRepeat -int 1

# ウィンドウ開閉のアニメーションを無効化
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool NO

# Dockが表示される際のアニメーションを無効化
defaults write com.apple.dock autohide-time-modifier -float 0;killall Dock

# Dockが表示される時間を0に設定
defaults write com.apple.dock autohide-delay -float 0;killall Dock

# Launchpadのアニメーションを無効化
defaults write com.apple.dock springboard-show-duration -float 0;killall Dock
defaults write com.apple.dock springboard-hide-duration -float 0;killall Dock
defaults write com.apple.dock springboard-page-duration -float 0;killall Dock

# Dockに格納するエフェクトをSuckに変更
defaults write com.apple.dock mineffect suck;killall Dock

# ミッションコントロールのアニメーション時間を変更
defaults write com.apple.dock expose-animation-duration -float 0.1;killall Dock

# ツールチップの表示速度
defaults write -g NSInitialToolTipDelay -integer 100

# Finderで隠しファイルを表示
defaults write com.apple.finder AppleShowAllFiles TRUE;killall Finder

# ピリオドの自動入力をオフ
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

