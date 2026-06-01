# ~/.zshrc — Lucas Moreira
# Cleaned 2026-06-01 for the company-machine rebuild.
# Removed: Amazon Q blocks, Fig export, Windsurf/Codeium PATH, Antigravity PATH,
# old Tapgoods/Daduca aliases, and the self-appending nvm/grep hacks that
# re-wrote this file on every shell start.

# ---- Powerlevel10k instant prompt (keep near the top) ----
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ---- OpenSpec shell completions ----
fpath=("$HOME/.oh-my-zsh/custom/completions" $fpath)
autoload -Uz compinit && compinit

# ---- oh-my-zsh ----
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git)
source "$ZSH/oh-my-zsh.sh"

# ---- prompt ----
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ---- Node / nvm ----
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# ---- Python / pyenv ----
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PIPENV_PYTHON="$PYENV_ROOT/shims/python"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# ---- Ruby / rbenv ----
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# ---- Java (OpenJDK 17) ----
export JAVA_HOME="/opt/homebrew/opt/openjdk@17"
export PATH="$JAVA_HOME/bin:$PATH"

# ---- Android SDK ----
export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH="$PATH:$ANDROID_HOME/emulator:$ANDROID_HOME/platform-tools"

# ---- pnpm ----
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# ---- local bin ----
export PATH="$HOME/.local/bin:$PATH"

# ---- mise (keep last so it can override shims above) ----
eval "$(mise activate zsh)"
