dotfiles_path=${0:a:h}

source "$HOME/.files/zgen/zgen.zsh"

if ! zgen saved; then
  echo "Creating a zgen save"

  zgen oh-my-zsh
  zgen oh-my-zsh plugins/git
  zgen oh-my-zsh plugins/command-not-found
  # zgen oh-my-zsh plugins/virtualenvwrapper
  zgen oh-my-zsh plugins/sudo

  zgen load zsh-users/zsh-syntax-highlighting
  zgen load zsh-users/zsh-history-substring-search
  zgen load zsh-users/zsh-completions src
  zgen load mafredri/zsh-async
  zgen load sindresorhus/pure

  zgen save
fi

if [[ $(uname -s) == 'Darwin' ]]; then
  alias ls='ls -G'
else
  alias ls='ls --color'
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Completion
autoload -Uz compinit
compinit
setopt completealiases

setopt HIST_IGNORE_DUPS  # Ignore duplicate lines in history
# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

export EDITOR='vim'

# git
alias gst='git status'
alias gpl='git pull'
alias gps='git push'
alias gco='git checkout'
alias gc='git commit'
alias ga='git add'


export NVIM_TUI_ENABLE_CURSOR_SHAPE=1
# export NVIM_TUI_ENABLE_TRUE_COLOR=1

[ -f $HOME/.zshrc.ext ] && source ~/.zshrc.ext
# if [[ $(uname -s) == 'Darwin' ]]; then
#   source $HOME/.files/zshrc.osx
# fi

autoload -z edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

# bind k and j for VI mode
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
