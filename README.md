# dotfiles

```shell
# Install git
$ sudo apt-get update
$ sudo apt-get upgrade
$ sudo apt-get install -y git

# Clone dotfiles
$ git clone https://github.com/tsuna-can/dotfiles.git

$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
$ brew bundle
$ make setup-mac
```

## Nix (migration in progress)

パッケージ管理を Homebrew から Nix (nix-darwin + home-manager) へ移行中。
手順の詳細は [docs/nix-migration-plan.md](docs/nix-migration-plan.md) を参照。

> **NOTE**: ユーザー名が `tsunacan` 以外の PC に適用する場合は、
> `flake.nix` 内の `username = "tsunacan";` の1行を書き換えること。
> それ以外のファイルはユーザー名に依存しない。

