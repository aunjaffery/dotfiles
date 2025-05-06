# If not running interactively, don't do anything
[[ $- != *i* ]] && return
# parse_git_branch() {
#         git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
# }
PS1='\[\e]0;\u@\h: \w\a\]\[\033[1;92m\]\u@\h\[\033[m\]:\[\033[1;94m\]\w\[\033[m\]\n\$ '
# fzf commands and settings
if [ -x "$(command -v fzf)"  ]; then
        source /usr/share/fzf/key-bindings.bash
        source /usr/share/fzf/completion.bash
fi
export FZF_DEFAULT_COMMAND="fd -Enode_modules -Epkg . $HOME"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd -Enode_modules -Epkg -td . $HOME"
export FZF_COMPLETION_TRIGGER="**"

#auto cd without typing cd
shopt -s autocd

bind 'TAB':menu-complete
bind '"\e[Z": menu-complete-backward'
# Display a list of the matching files
bind "set show-all-if-ambiguous on"
# Perform partial completion on the first Tab press,
# only start cycling full results on the second Tab press
bind "set menu-complete-display-prefix on"
bind "set completion-ignore-case on"
# # Use bash-completion, if available
# [[ $PS1 && -f /usr/share/bash-completion ]] && \
[ -d "/usr/share/bash-completion" ] && source /usr/share/bash-completion/*

export MANPAGER="nvim +Man!"
export EDITOR=nvim
export VISUAL=nvim

alias ls='eza -la --color=always --group-directories-first' # my preferred listing
alias la='eza -a --color=always --group-directories-first'  # all files and dirs
alias ll='eza -la --color=always --group-directories-first -rs modified'  # long format
alias lt='eza -aT -L 3 --color=always --group-directories-first' # tree listing
alias l.='eza -a | egrep "^\."'
#sensitivity
alias grep="rg -i"
alias rg="rg -i"
#navigation aliase
alias .="cd"
alias ..="cd .."
alias ...="cd ../../"
# vim = nvim
alias vim='nvim'

alias update='sudo pacman -Syu'
#git aliase
alias addall='git add .'
alias commit='git commit -m'
alias push='git push origin'
#abbrevations to open configs in nvim
alias cala="nvim ~/.config/alacritty/alacritty.toml"
alias cbs="nvim ~/.bashrc"
alias cvi="nvim ~/.config/nvim/init.lua"

alias homelab="ssh root@192.168.18.50"
alias pi1="sudo ssh 192.168.18.60"
#postgres
alias psqlocal='psql -h localhost -U root'

export PATH=~/go/bin:/usr/local/go/bin:$HOME/.local/bin:$PATH
export XDG_SCREENSHOTS_DIR=~/Pictures/Screenshots


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"
