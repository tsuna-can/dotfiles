# Homebrew → Nix 移行計画

作成日: 2026-07-11

## 方針（決定済み）

- **nix-darwin + home-manager + flakes** 構成に移行する
- CLIツールは home-manager（Nixpkgs）で管理する
- GUIアプリ（cask）は **nix-darwin の Homebrew 管理機能**経由で宣言的に管理する
  （Homebrew自体は残るが、Brewfileは廃止し flake 内で完結させる）
- 現PCで検証してから dotfiles に反映し、新PCで実施する
- **削除するもの**: rbenv, redis, visual-studio-code
- flake は **`#default` 固定名のシングル構成**とする
  （hostname に依存せず、現PC・新PCとも `darwin-rebuild switch --flake .#default` で適用。
  Makefile ターゲット化して指定の手間を吸収する）
- **sdkman は廃止**（maven 削除に伴い用途がなくなるため。Makefile の install-sdkman も削除）
- **Volta は廃止**し、Node.js は Nix 管理に移行する
- home-manager の役割は**パッケージ導入のみ**とし、設定ファイルは従来どおり
  link.sh のシンボリックリンクで管理する（home-manager の設定ファイル管理機能は使わない）

- **claude-code は公式インストーラーで導入**する（自動更新を優先し、Nix 管理外とする）

## 未決事項

なし（すべて決定済み）

---

## Phase 0: 棚卸し

Brewfile と実際のインストール状況（`brew leaves` / `brew list --cask`）に乖離があるため、
移行対象を確定させる。

### Brewfile に無いがインストール済みの formula（要: 残す/捨てる判断）

| パッケージ | 用途 | 判断 |
|---|---|---|
| helm | Kubernetes | **削除** |
| k9s | Kubernetes TUI | **削除** |
| kind | ローカルk8sクラスタ | **削除** |
| kotlin-language-server | Kotlin LSP | **削除** |
| kubectx | k8sコンテキスト切替 | **削除** |
| lazydocker | Docker TUI | **残す**（Nixpkgs `lazydocker` へ移行、tap不要になる） |
| maven | Javaビルド | **削除** |
| mysql-client | MySQLクライアント | **削除** |
| podman-compose | Podman | **削除**（Dockerに統一） |
| stern | k8sログ | **削除** |
| im-select | 入力ソース切替 | **削除** |
| koyeb | Koyeb CLI | **削除** |

Brewfile 記載分の追加判断: kubectl（kubernetes-cli）は**残す**、kustomize は**削除**。

### Brewfile に無いがインストール済みの cask（要: 残す/捨てる判断）

| cask | 備考 | 判断 |
|---|---|---|
| ghostty | | **削除** |
| wezterm@nightly | | **削除** |
| karabiner-elements | | **削除** |
| macskk | SKK日本語入力 | **削除** |
| wave | Waveターミナル | **削除** |
| docker | docker-desktopの旧名caskで重複 | **削除** |
| podman-desktop | Dockerに統一 | **削除** |
| dbeaver-community | Brewfile記載済み | **残す** |

### Homebrew 外で管理されているもの

| ツール | 現状 | 判断 |
|---|---|---|
| Volta (Node.js/npm) | curl インストーラーで導入、.zshrc で PATH 設定 | **廃止**（Node.js は Nixpkgs `nodejs` へ。`~/.volta` と .zshrc の VOLTA 行を削除） |
| sdkman | Makefile の install-sdkman で導入 | **廃止** |

### Brewfile にあるが実質依存ライブラリのもの（Nixでは不要）

glib, cairo, harfbuzz, libzip, base64（→ Nixでは依存は自動解決されるため個別指定不要。
base64はcoreutils同梱）

---

## Phase 1: 現PCでの検証

### Step 1: Nix インストール

```sh
# Determinate Systems インストーラー（flakes標準有効、クリーンなアンインストールも可能）
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
```

- 既存のHomebrew環境とは共存可能（`/nix` 以下に閉じる）
- 動作確認: `nix run nixpkgs#hello`

### Step 2: flake 構成の作成

dotfiles リポジトリに**ブランチを切って**作成する（例: `nix-migration`）。

```
dotfiles/
├── flake.nix          # エントリーポイント（darwinConfigurations.default を定義）
├── flake.lock
└── nix/
    ├── darwin.nix     # nix-darwin: システム設定 + homebrew casks
    └── home.nix       # home-manager: CLIツール群
```

注意点:

- **flake は git 追跡済みのファイルしか参照しない**。flake.nix や nix/ を新規作成したら
  `git add` すること（未追跡のままだと "path does not exist" エラーになり気づきにくい）
- Determinate インストーラーのデフォルトは upstream Nix だが、`--determinate` オプションで
  **Determinate Nix** を入れた場合は darwin.nix で `nix.enable = false` の設定が必須
  （デーモンを自己管理するため nix-darwin と競合し switch が失敗する）。
  どちらが入っているかは `nix --version` の表記で確認できる

### Step 3: パッケージマッピング

#### CLI（home-manager / Nixpkgs）

| Homebrew | Nixpkgs attr | 備考 |
|---|---|---|
| arp-scan | `arp-scan` | |
| awscli | `awscli2` | |
| bat | `bat` | |
| cmake | `cmake` | |
| curl | `curl` | macOS同梱版より新しいものを明示管理 |
| deno | `deno` | |
| fzf | `fzf` | |
| gh | `gh` | |
| ghq | `ghq` | |
| git | `git` | |
| git-delta | `delta` | 名前が異なる |
| go | `go` | |
| go-task | `go-task` | |
| hugo | `hugo` | |
| jq | `jq` | |
| kubernetes-cli | `kubectl` | 名前が異なる |
| lazydocker | `lazydocker` | tap不要になる |
| lazygit | `lazygit` | tap不要になる |
| lua / luarocks | `lua` / `luarocks` | nvim(lazy.nvim rocks)用 |
| mkcert | `mkcert` | |
| neovim | `neovim` | |
| (Volta管理) node | `nodejs` | Volta 廃止に伴い Nix 管理へ |
| ripgrep | `ripgrep` | |
| sheldon | `sheldon` | |
| starship | `starship` | |
| t-rec | `t-rec` | |
| tldr | `tldr` | |
| tree | `tree` | |
| zoxide | `zoxide` | |

#### 言語別ツール（Brewfileの go/cargo/npm ディレクティブ → Nixpkgs）

| 現状 | Nixpkgs attr |
|---|---|
| go: dlv | `delve` |
| go: gopls | `gopls` |
| go: staticcheck | `go-tools` |
| go: swag | `go-swag` |
| cargo: tree-sitter-cli | `tree-sitter` |
| npm: @anthropic-ai/claude-code | 公式インストーラーで導入（Nix 管理外。`curl -fsSL https://claude.ai/install.sh \| bash`） |
| npm: corepack | `corepack` |

#### GUI（nix-darwin の homebrew.casks）

```nix
homebrew = {
  enable = true;
  casks = [
    "dbeaver-community"
    "docker-desktop"
    "font-hackgen-nerd"   # Nixpkgsに無い
    "hammerspoon"
    "raycast"
  ];
  # onActivation.cleanup は設定しない（デフォルトの none のまま）。
  # "zap" は flake 未記載の cask をアプリの設定ファイルごと削除するため、
  # 検証中に使用中のターミナル等が消える事故につながる。
  # 不要 cask の削除は Phase 3 で手動で行う。
};
```

- Hack Nerd Font は Nixpkgs の `nerd-fonts.hack` で導入する
  （`fonts.packages = [ pkgs.nerd-fonts.hack ];` を darwin.nix に記載。
  cask の font-hack-nerd-font は不要になる）
- formula がすべて Nixpkgs に移行できるため `homebrew.taps` / `homebrew.brews` は不要

### Step 4: 適用

```sh
# 初回
sudo nix run nix-darwin -- switch --flake ~/Documents/repos/dotfiles#default

# 2回目以降
sudo darwin-rebuild switch --flake ~/Documents/repos/dotfiles#default
```

### Step 5: シェル環境の調整

**必ず Step 4 の switch が成功し、Nix 側にツールが揃ったのを確認してから**行う
（先に消すと Homebrew 版ツールが見えなくなり、switch 失敗時に作業環境を失う）。

`zsh/.zshrc` を修正し、Nix のパスが優先されるようにする:

- [ ] `export PATH="/opt/homebrew/bin:$PATH"` の行を削除
      （nix-darwin が Nix のパスを設定する。
      `brew` コマンドを直接使いたい場合は PATH の**末尾**に追加する）
- [ ] `VOLTA_HOME` 関連の行を削除（Volta 廃止のため）

### Step 6: 動作確認チェックリスト

パス解決（`/nix/store` 側を向いているか）:

- [ ] `which nvim git gh fzf rg starship sheldon zoxide` がすべて Nix 由来のパスを指す
      （`/run/current-system/sw/bin`（systemPackages）または
      `/etc/profiles/per-user/<user>/bin`（home-manager）。いずれも実体は /nix/store）
- [ ] `echo $PATH` で Nix のパスが Homebrew より前にある

シェル環境:

- [ ] zsh 新規起動でエラーが出ない（sheldon のプラグインロード）
- [ ] starship プロンプトが表示される
- [ ] zoxide (`z`), fzf キーバインドが機能する

Neovim:

- [ ] `nvim` 起動でエラーなし
- [ ] `:checkhealth` で重大なエラーなし（treesitter, LSP, luarocks）
- [ ] treesitter のパースが機能する（`tree-sitter` CLI が必要な言語）
- [ ] gopls 等の LSP がアタッチする

開発ツール:

- [ ] `git`, `gh auth status`, `lazygit` が動く
- [ ] `go build` / `dlv` / `staticcheck` が動く
- [ ] `kubectl` が動く
- [ ] `deno --version`, `node --version`, `corepack --version`（node が Volta でなく Nix を指すこと: `which node`）

GUI / cask:

- [ ] hammerspoon, raycast が起動し設定が生きている
- [ ] ターミナルでフォント（HackGen Nerd / Hack Nerd Font）が表示される
- [ ] docker-desktop が起動する
- [ ] dbeaver が起動する

その他:

- [ ] `claude` コマンドが動く
- [ ] macOS 再起動後も環境が維持される

### ロールバック手段（検証中に問題が起きた場合）

- 世代単位: `darwin-rebuild switch --rollback` または `darwin-rebuild --list-generations` から選択
  （戻るのは **Nix 世代のみ**。Homebrew 側の操作（cask の削除等）はロールバックされない）
- Homebrew は Phase 3 まで削除しないので、いつでも従来環境に戻れる
- Nix 自体の完全撤去: `/nix/nix-installer uninstall`（Determinate インストーラー）

---

## Phase 2: dotfiles への反映

- [ ] 検証済みブランチを PR 経由で main にマージ（flake.nix, flake.lock, nix/ を含める）
- [x] Makefile 更新:
  - `nix-switch` / `nix-bootstrap` ターゲット追加
  - `setup-mac` を Nix ベースの手順に書き換え
  - `install-sdkman` ターゲット削除（sdkman 廃止のため）
- [x] README 更新（新PCセットアップ手順）
- [x] Brewfile 削除

注: ghostty / wezterm / karabiner はアプリを入れない判断だが、設定ディレクトリと
Makefile の link ターゲットは意図的に残す（将来使う場合に備える）。

## Phase 3: 現PCのクリーンアップ（任意）

- [ ] Nix 管理に移行した formula と、削除判断した formula / cask を `brew uninstall`
  （すべて確認済みなら `homebrew.onActivation.cleanup = "uninstall"` に切り替えて
  自動化してもよい。**"zap" は設定ファイルまで消すため使わない**）
- [ ] tap をすべて削除（daipeihust/tap, homebrew/bundle, jesseduffield/*, nikitabobko/tap, xwmx/taps
  — tap 由来の formula がゼロになったため全削除可）
- [ ] Volta の残骸を削除（`rm -rf ~/.volta`）
- [ ] `brew autoremove && brew cleanup`

## Phase 4: 新PCセットアップ

1. Xcode Command Line Tools: `xcode-select --install`
2. Nix インストール（Step 1 と同じ）
3. Homebrew インストール（cask 用。nix-darwin は Homebrew 本体を入れないため手動で導入）
4. `git clone` で dotfiles を取得（ghq を使うなら `nix run nixpkgs#ghq -- get ...` でも可）
5. ユーザー名が `tsunacan` 以外の PC の場合は flake.nix の `username = "tsunacan";` を書き換える
6. `sudo nix run nix-darwin -- switch --flake .#default`
7. `make link`（シンボリックリンク作成 — 既存の link.sh 群はそのまま使える）
8. `make mac-config`（macOS defaults 設定）
9. claude-code を公式インストーラーで導入: `curl -fsSL https://claude.ai/install.sh | bash`
10. Step 6 のチェックリストで動作確認
