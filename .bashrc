# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# parse_git_branch() {
# 	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
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
if [[ -e /usr/share/bash-completion ]]; then
  source /usr/share/bash-completion/bash_completion
fi

export MANPAGER="nvim +Man!"
export EDITOR=nvim
export VISUAL=nvim

alias ls='eza -la --color=always --group-directories-first' # my preferred listing
alias la='eza -a --color=always --group-directories-first'  # all files and dirs
alias ll='eza -la --color=always --group-directories-first -rs modified'  # long format
alias lt='eza -aT -L 3 --color=always --group-directories-first' # tree listing

#sensitivity
alias grep="rg -i"
alias rg="rg -i"
#alias fd="fdfind"

#navigation aliase
alias ..="cd .."
alias ...="cd ../../"

# vim = nvim
alias vim='nvim'
# distro update
alias update='sudo dnf upgrade -y'
# aria2c
alias tor='aria2c -s10 -x10'

#git aliase
alias addall='git add .'
alias commit='git commit -m'
alias push='git push origin'

#k8s aliase
alias kpo="kubectl get po"
alias ksvc="kubectl get svc"
alias kall="kubectl get all"
alias ktop="kubectl top po"
alias klog="kubectl logs --tail=500"
alias klogs="kubectl logs --tail=200 -f"
alias kcon="kubectl config get-contexts"

#abbrevations to open configs in nvim
alias cala="nvim ~/.config/alacritty/alacritty.yml"
alias cbs="nvim ~/.bashrc"
alias cvi="nvim ~/.config/nvim/init.lua"
alias fala="cd ~/.config/alacritty/"
alias fvi="cd ~/.config/nvim/"

export PATH=~/go/bin:/usr/local/go/bin:$HOME/.local/bin:$PATH

source "$HOME/.cargo/env"

alias luamake=/home/aun/Downloads/lua-language-server/3rd/luamake/luamake

gcloud="$HOME/Downloads/google-cloud-sdk"
[ -f "$gcloud/path.bash.inc" ] && source "$gcloud/path.bash.inc"
[ -f "$gcloud/completion.bash.inc" ] && source "$gcloud/completion.bash.inc"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
