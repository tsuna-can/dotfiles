# dotfiles

```shell
# Install git
$ sudo apt-get update
$ sudo apt-get upgrade
$ sudo apt-get install -y git

# Clone dotfiles
$ git clone https://github.com/tsuna-can/dotfiles.git
```

## Setup for Mac
```shell
$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
$ brew bundle
$ sh setup.sh
```

## Setup for Raspberry Pi
Edit /etc/pam.d/chsh to change shell.
Comment out the following line.
```
# auth       required   pam_shells.so
```

Execute the following command.
```shell
$ make setup-raspberrypi
```

Add snapd to .zshrc.
```shell
$ echo 'export PATH=$PATH:/snap/bin' >> ~/.zshrc
```
