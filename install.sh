#!/usr/bin/env bash
# install.sh — symlink dotfiles + install apps on a fresh macOS machine.
# Safe to re-run (idempotent). Backs up any existing file before linking.
set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_DIR="$HOME/.dotfiles-backup-$(date +%Y%m%d-%H%M%S)"

link() {
  local src="$1" dest="$2"
  if [ -e "$dest" ] || [ -L "$dest" ]; then
    mkdir -p "$BACKUP_DIR/$(dirname "${dest#$HOME/}")"
    mv "$dest" "$BACKUP_DIR/${dest#$HOME/}"
    echo "  backed up existing $dest -> $BACKUP_DIR"
  fi
  mkdir -p "$(dirname "$dest")"
  ln -s "$src" "$dest"
  echo "  linked $dest -> $src"
}

echo "==> 1/4 Homebrew"
if ! command -v brew >/dev/null 2>&1; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

echo "==> 2/4 oh-my-zsh + powerlevel10k"
[ -d "$HOME/.oh-my-zsh" ] || sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
P10K="$HOME/.oh-my-zsh/custom/themes/powerlevel10k"
[ -d "$P10K" ] || git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$P10K"

echo "==> 3/4 symlinking dotfiles"
link "$DOTFILES/.zshrc"        "$HOME/.zshrc"
link "$DOTFILES/.zprofile"     "$HOME/.zprofile"
link "$DOTFILES/.gitconfig"    "$HOME/.gitconfig"
link "$DOTFILES/config/zed/settings.json" "$HOME/.config/zed/settings.json"

echo "==> 4/4 brew bundle (formulae + casks + apps)"
brew bundle --file="$DOTFILES/Brewfile" || echo "  (some casks may need manual retry; re-run 'brew bundle')"

echo
echo "Done. Open a new terminal."
echo "Next: restore Claude Code + secrets from the private backup repo (see its RESTORE.md)."
echo "Any pre-existing files were saved to: $BACKUP_DIR"
