{ pkgs, ... }:
{
  nixpkgs.hostPlatform = "aarch64-darwin";

  # nix-darwin の一部オプション（homebrew 等）が対象ユーザーを要求する
  system.primaryUser = "tsunacan";
  users.users.tsunacan.home = "/Users/tsunacan";

  # /etc/zshrc に Nix のパス設定を書き込む（zsh を使うなら必須）
  programs.zsh.enable = true;

  fonts.packages = [ pkgs.nerd-fonts.hack ];

  homebrew = {
    enable = true;
    casks = [
      "dbeaver-community"
      "docker-desktop"
      "font-hackgen-nerd" # Nixpkgs に無いため cask で導入
      "hammerspoon"
      "raycast"
    ];
    # onActivation.cleanup は設定しない（デフォルト none）。
    # "zap" は flake 未記載の cask をアプリ設定ごと削除するため使わない。
    # 既存 Homebrew 環境の整理は移行計画の Phase 3 で手動で行う。
  };

  # Determinate Nix（--determinate オプション）を使う場合のみ有効化すること。
  # upstream Nix（インストーラーのデフォルト）では設定不要。
  # nix.enable = false;

  system.stateVersion = 6;
}
