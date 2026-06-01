# ~/.zprofile — Lucas Moreira
# Cleaned 2026-06-01. Removed Amazon Q blocks and the self-appending nvm hack.

# ---- Homebrew ----
eval "$(/opt/homebrew/bin/brew shellenv)"

# ---- OrbStack (CLI + integration) ----
source ~/.orbstack/shell/init.zsh 2>/dev/null || :
