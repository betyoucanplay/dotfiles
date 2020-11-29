# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$PATH:/home/chris/bin:/home/chris/.npm_global/bin:/usr/share/java/gradle/bin:/opt/mixbus32c/bin:/home/chris/.screenlayout:/home/chris/.local/bin
export XDG_CONFIG_HOME=$HOME/.config
export EDITOR=/usr/bin/nvim
export ZSH=/usr/share/oh-my-zsh
export FZF_DEFAULT_COMMAND='rg --files --hidden --smart-case -g "!.git"'
export FZF_CTRL_T_COMMAND='rg --files --hidden --smart-case -g "!.git !"'
export FZF_DEFAULT_OPTS=" --height=20 --multi  --reverse --inline-info"
export LXVST_PATH=/usr/lib/lxvst:/usr/local/lib/lxvst:~/.lxvst
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#3b3b3b'

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
    #exec startx -- vt7 &> /dev/null
    # Could use xinit instead of startx
    export QT_QPA_PLATFORMTHEME="qt5ct"
    #export XDG_CURRENT_DESKTOP=KDE
    exec xinit -- /usr/bin/X -nolisten tcp vt7 &> /dev/null
fi

# Path to your oh-my-zsh installation.
export ZSH=/usr/share/oh-my-zsh/

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this vari:qable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"
fjrnl() {
  title=$(jrnl --short | fzf --tac --no-sort) &&
  jrnl -on "$(echo $title | cut -c 1-16)" $1
  }
# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="false"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="false"

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
ZSH_CUSTOM=/home/chris/.config/oh-my-zsh


# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    autopep8
    copyfile
    docker
    encode64
    extract
    fancy-ctrl-z
    gitfast
    gitignore
    git-extras
    grails
    history
    jsontools
    archlinux
    common-aliases
    node
    pass
    rust
    web-search
    ssh-agent
    sudo
)

source $ZSH/oh-my-zsh.sh
source /usr/share/oh-my-zsh/oh-my-zsh.sh

# zsh plugins via aur
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /etc/profile.d/autojump.zsh
source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh
eval "$(fasd --init auto)"

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
export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

SAVEHIST=100000
HISTSIZE=100000
HISTFILESIZE=100000

alias halt='sudo systemctl poweroff'
alias reboot='sudo systemctl reboot'
alias quick-play="mpv /home/chris/record/scratch//**/*(om[1])"
alias del-last-qrec="rm -i /home/chris/record/scratch/**/*(om[1])"
alias scratch='cat ~/wiki/Scratchpad.wiki | less'
alias escratch='vim ~/wiki/Scratchpad.wiki'
alias rofi-flush='rm -f $HOME/.cache/rofi-3.runcache'
alias last100="expac --timefmt='%Y-%m-%d %T' '%l\t%n' | sort | tail -n 100"
alias cfg-nvim='nvim ~/.dotfiles/nvim/.config/nvim/init.vim'
alias cfg-zsh='nvim ~/.dotfiles/zsh/.zshrc'
alias cfg-i3='nvim ~/.dotfiles/i3/.config/i3/config'
alias mnt3TB='sudo mount -t ext4 /dev/disk/by-id/usb-Intenso_External_USB_3.0_20161011015423-0:0-part1 /home/chris/mnt/3TB'
alias umnt3TB='sudo umount /home/chris/mnt/3TB'
alias mnt1TB='sudo mount /dev/disk/by-id/ata-ST1000DM003-9YN162_Z1D175T8-part1 /home/chris/mnt/1TB'
alias umnt1TB='sudo umount /home/chris/mnt/1TB'
alias fnf='nvim $(fzf)'
alias vi='nvim'
alias vim='nvim'
alias rg='rg --hidden --smart-case -g "!.git"'
alias cp='cp -ra'
alias pm='ncpamixer'
alias e='exa -l --group-directories-first --git'
alias ea='exa -l -a --group-directories-first --git'
alias todo_n='todo new -l default'
alias alacritty-color='alacritty-colorscheme -C ~/src/cfg/alacritty-theme/themes '

j() {
    if [[ "$#" -ne 0 ]]; then
        cd $(autojump $@)
        return
    fi
    cd "$(autojump -s | sort -k1gr | awk '$1 ~ /[0-9]:/ && $2 ~ /^\// { for (i=2; i<=NF; i++) { print $(i) } }' |  fzf --height 40% --reverse --inline-info)"
}
fjrnl() {
    title=$(jrnl --short | fzf --tac --no-sort) &&
        jrnl -on "$(echo $title | cut -c 1-16)" $1
}


source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fpath=($fpath "/home/chris/.zfunctions")

# Set Spaceship ZSH as a prompt
#autoload -U promptinit; promptinit
#prompt spaceship
eval "$(starship init zsh)"

fortune
