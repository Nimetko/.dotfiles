# If you come from bsh you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Gems for lego project
# export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
# export PATH="$PATH:$GEM_HOME/bin"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
# export PATH="$PATH:$HOME/.local/bin/"
export PATH="$PATH:/Users/jan/.local/bin"

# Add pipx to PATH
export PATH="$HOME/.local/bin:$PATH"

export EDITOR=nvim

# RUST Cargo
export PATH="$HOME/.cargo/bin:$PATH"


#Flutter
export PATH=$HOME/flutter/bin:$PATH

# Add dotnet to Path
# export PATH="$PATH:/usr/local/share/dotnet"
export PATH="$HOME/.dotnet:$PATH"

# # Start tmux on shell start-up if not already running
# if [ -z "$TMUX" ]; then
#     tmux attach -t default || tmux new -s default
# fi
# Start tmux automatically ONLY when using Terminal.app
if [[ -z "$TMUX" && "$TERM_PROGRAM" == "Apple_Terminal" ]]; then
    tmux attach -t default || tmux new -s default
fi

# Add pyenv to PATH and initialize it
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"


# if [ -f ~/.zsh_profile ]; then
#   source ~/.zsh_profile
# fi


# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh


if [ -f ~/.zsh_profile ]; then
  source ~/.zsh_profile
fi

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias v="nvim"
alias update="~/x/scripts/update-repositories.sh" 
alias status="~/x/scripts/status-repositories.sh"
alias push="~/x/scripts/auto-push-repos.sh"
alias clone="~/x/scripts/clone-repo-fzf.sh"
alias gch="~/x/scripts/checkout-fzf.sh"
alias gme="~/x/scripts/merge-fzf.sh"
alias gsave="~/x/scripts/git-save.sh"
alias cl="clear"
alias gs="git status"
alias gd="git diff"
alias gl="git log"
alias ga.="git add ."
alias grh="git reset --hard"
alias create_repo="~/x/scripts/gh_create_private_repo.sh"

alias fdevice="/Users/jan/x/scripts/flutter-run-ios.sh" 

alias timer="~/x/scripts/timer.sh"

alias zenon="open -a Hammerspoon" # zen mode on
alias zenoff="pkill Hammerspoon" # zen mode off

alias lazy="lazygit"

# AI
alias lama="ollama run llama3.2"
alias llama="ollama run llama3.2"

alias manf="compgen -c | sort -u | fzf | xargs man"

alias vh="~/x/scripts/fzf_listoldfiles.sh"
alias fh="~/x/scripts/fzf_listoldfiles.sh"
alias f="~/x/scripts/fzf_listoldfiles.sh"
alias kill_all="~/x/scripts/kill-all-but-terminal.sh"
alias kill-all="~/x/scripts/kill-all-but-terminal.sh"
alias reset-all-app-processes="~/x/scripts/kill-all-but-terminal.sh"
alias clean-desktop="~/x/scripts/./move_desktop_to_documents.sh"

# Better cd navitation (see last directories) jump

j() {
  local dir
  dir=$(dirs -v | fzf | awk '{print $2}')
  if [ -n "$dir" ]; then
    cd "$dir"
  fi
}

# vim like terminal
# bindkey -v
export PATH="/Applications/Rider.app/Contents/MacOS:$PATH"
export PATH="/Applications/Docker.app/Contents/Resources/bin:$PATH"

eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/shims:$PATH"




# ──────────────────────────────
# NOTE: FZF Configuration
# ──────────────────────────────

# Enable key bindings and fuzzy completion
eval "$(fzf --zsh)"

# FZF default command using `fd`
export FZF_DEFAULT_COMMAND='fd --hidden --strip-cwd-prefix --exclude .git'

# FZF shortcuts for ctrl-t and alt-c
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# export FZF_ALT_C_COMMAND='fd --type=d --hidden --strip-cwd-prefix --exclude .git'

# Global FZF options
# export FZF_DEFAULT_OPTS='--height 50% --layout=default --border --color=hl:#2dd4bf'

# FZF window options for tmux (position: 90% width, 70% height)
# export FZF_TMUX_OPTS='-p 90%,70%'
# use fullscreen
# export FZF_TMUX=0

# Previews
# export FZF_CTRL_T_OPTS="--preview 'bat --color=always -n --line-range :500 {}'"
# export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"
export PATH="$PATH:/opt/homebrew/Caskroom/flutter/latest/flutter/bin"

# Added by Antigravity
export PATH="/Users/jabo/.antigravity/antigravity/bin:$PATH"
