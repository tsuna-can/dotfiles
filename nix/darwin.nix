# username は flake.nix の let で定義され specialArgs 経由で渡される。
# 別ユーザー名の PC に適用する場合は flake.nix 側だけ書き換えればよい。
{ pkgs, username, ... }:
{
  nixpkgs.hostPlatform = "aarch64-darwin";

  # nix-darwin の一部オプション（homebrew 等）が対象ユーザーを要求する
  system.primaryUser = username;
  users.users.${username}.home = "/Users/${username}";

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

  # Determinate Nix はデーモンを自己管理するため、nix-darwin 側の Nix 管理を無効化する
  # （有効のままだと switch が失敗する）。`nix --version` が "Determinate Nix" を返すことを確認済み。
  nix.enable = false;

  system.stateVersion = 6;
}
