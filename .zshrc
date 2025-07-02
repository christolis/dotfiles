# Enable Powerlevel10k instant prompt.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="agnoster"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# User configuration
export PATH="/opt/homebrew/opt/openjdk@11/bin:$PATH"
PROMPT='%F{green}%n@%m%F{white}:%F{blue}%~%f$ '

source /Users/christolis/.docker/init-zsh.sh || true # Added by Docker Desktop
export PATH="${HOME}/.pyenv/shims:${PATH}"
export ANDROID_SDK_ROOT="/usr/local/share/android-sdk"

ZSH_THEME="powerlevel10k/powerlevel10k"
source ~/powerlevel10k/powerlevel10k.zsh-theme
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
export GPG_TTY=$(tty)

export DOTFILES_PATH="$HOME/.dotfiles/"
alias dotfiles='git --git-dir=$DOTFILES_PATH/ --work-tree=$HOME'

export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
