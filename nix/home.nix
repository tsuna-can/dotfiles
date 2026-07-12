{ pkgs, ... }:
{
  # CLI ツールの導入のみを担当する。
  # 設定ファイルの配置は従来どおりリポジトリの link.sh 群で行う
  # （docs/nix-migration-plan.md の方針を参照）。
  home.packages = with pkgs; [
    arp-scan
    awscli2
    bat
    cmake
    corepack
    curl
    delta # 旧: git-delta
    delve # 旧: go install dlv
    deno
    fzf
    gh
    ghq
    git
    go
    go-swag # 旧: go install swag
    go-task
    go-tools # 旧: go install staticcheck
    gopls
    hugo
    jq
    kubectl # 旧: kubernetes-cli
    lazydocker
    lazygit
    lua
    luarocks
    mkcert
    neovim
    nodejs # 旧: Volta 管理
    ripgrep
    sheldon
    starship
    t-rec
    tldr
    tree
    tree-sitter # 旧: cargo install tree-sitter-cli
    zoxide
  ];

  home.stateVersion = "25.05";
}
