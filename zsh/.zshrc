# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$PATH:/home/chris/bin:/home/chris/.npm_global/bin:/usr/share/java/gradle/bin:/opt/mixbus32c/bin:/home/chris/.screenlayout:/home/chris/.local/bin
export XDG_CONFIG_HOME=$HOME/.config
export EDITOR=/usr/bin/nvim
export FZF_DEFAULT_COMMAND='rg --files --hidden --smart-case -g "!.git"'
export FZF_CTRL_T_COMMAND='rg --files --hidden --smart-case -g "!.git !"'
export FZF_DEFAULT_OPTS=" --height=20 --multi  --reverse --inline-info"
export LXVST_PATH=/usr/lib/lxvst:/usr/local/lib/lxvst:~/.vst
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#3b3b3b'

fjrnl() {
  title=$(jrnl --short | fzf --tac --no-sort) &&
  jrnl -on "$(echo $title | cut -c 1-16)" $1
  }

# zsh plugins via aur
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/git/completion/git-completion.zsh
source /etc/profile.d/autojump.zsh
source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh
eval "$(fasd --init auto)"

export ARCHFLAGS="-arch x86_64"

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
alias vim='nvim'
alias rg='rg --hidden --smart-case -g "!.git"'
alias cp='cp -ra'
alias pm='ncpamixer'
alias e='exa -l --group-directories-first --git'
alias ea='exa -l -a --group-directories-first --git'
alias todo_n='todo new -l default'
alias performance='sudo cpupower frequency-set -g performance'
alias powersave='sudo cpupower frequency-set -g powersave'
alias game_on='nvidia-settings -a "[gpu:0]/GPUFanControlState=0" > /dev/null 2>&1 && sudo cpupower frequency-set -g performance > /dev/null 2>&1'
alias game_off='nvidia-settings -a "[gpu:0]/GPUFanControlState=1" -a "[fan:0]/GPUTargetFanSpeed=27" > /dev/null 2>&1 && sudo cpupower frequency-set -g powersave > /dev/null 2>&1'
alias bycp_mnt='sshfs betyoucanplay.org:/home/chris ~/mnt/bycp'
alias bycp_umnt='fusermount3 -u ~/mnt/bycp'
# rsync -aP --exclude-from=ignorelist /home/chris/ /home/chris/mnt/silpion/bcp_privat_26_03/
alias vic='nvim -u ~/.dotfiles/nvim/.config/nvim/init_clean.vim'

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


