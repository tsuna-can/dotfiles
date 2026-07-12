# dotfiles

macOS 環境を Nix (nix-darwin + home-manager) と Homebrew (cask のみ) で管理する。

- CLI ツール: home-manager ([nix/home.nix](nix/home.nix))
- GUI アプリ / フォント: nix-darwin の Homebrew 連携 ([nix/darwin.nix](nix/darwin.nix))
- 設定ファイル: 各ディレクトリの link.sh によるシンボリックリンク

## Setup (new Mac)

```shell
# 1. Xcode Command Line Tools（git と Homebrew の前提）
xcode-select --install

# 2. Nix (Determinate Systems installer)
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install --no-confirm

# 3. Homebrew（cask 用）
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# 4. Clone
git clone https://github.com/tsuna-can/dotfiles.git
cd dotfiles

# 5. ユーザー名が tsunacan 以外の PC の場合は、flake.nix 内の
#    `username = "tsunacan";` の1行を書き換える（他のファイルはユーザー名に依存しない）

# 6. パッケージ導入 + macOS 設定 + シンボリックリンク作成
make setup-mac
```

## Daily usage

```shell
# nix/*.nix や flake.nix を変更したら
make nix-switch

# パッケージを最新化したいとき
nix flake update && make nix-switch
```

移行の経緯・パッケージの棚卸し記録は [docs/nix-migration-plan.md](docs/nix-migration-plan.md) を参照。
