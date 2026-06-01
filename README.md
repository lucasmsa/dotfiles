# dotfiles

My macOS setup. No secrets in here.

## Install

```bash
git clone https://github.com/lucasmsa/dotfiles.git ~/dotfiles
cd ~/dotfiles && ./install.sh
```

Installs Homebrew, oh-my-zsh + powerlevel10k, symlinks the configs, runs `brew bundle`.

## Contents

- `.zshrc`, `.zprofile`: zsh with oh-my-zsh, p10k, nvm, pyenv, rbenv, mise, pnpm, java, android sdk
- `.gitconfig`: git identity + LFS
- `config/zed/settings.json`: editor
- `Brewfile`: formulae, casks, VS Code extensions
- `install.sh`: the installer
