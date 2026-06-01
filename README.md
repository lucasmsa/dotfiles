# dotfiles

Public, secret-free macOS config for Lucas Moreira. Shell, editor, and app list.

> Secrets (SSH key, AWS creds, gh token) and all Claude Code data live in a
> **separate private backup** — they are intentionally **not** in this repo.

## What's here

| File | Purpose |
|------|---------|
| `.zshrc` | Cleaned zsh config (oh-my-zsh + p10k, nvm, pyenv, rbenv, mise, pnpm, java, android) |
| `.zprofile` | Homebrew + OrbStack shell init |
| `.gitconfig` | Git identity (company email), LFS, defaults |
| `config/zed/settings.json` | Zed editor settings |
| `Brewfile` | All formulae, casks, daily-driver apps, VS Code extensions |
| `install.sh` | Idempotent installer — Homebrew, oh-my-zsh, p10k, symlinks, `brew bundle` |

## Fresh machine

```bash
git clone https://github.com/lucasmsa/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

Then restore Claude Code + secrets from the private backup (see that repo's `RESTORE.md`).

## Notes

- Removed during cleanup: Amazon Q, Fig, Windsurf/Codeium, Antigravity, old
  Tapgoods/Daduca aliases, and self-appending `.zshrc`/`.zprofile` hacks.
- `helium-browser` cask = the Helium browser. If you meant the floating PiP
  player, swap to `cask "helium"` in the `Brewfile`.
- `.gitconfig` uses `zed --wait` as the editor. Change if you prefer another.
