fish_vi_key_bindings
kitty + complete setup fish | source
set fish_color_param normal
set fish_color_command normal
set fish_color_autosuggestion normal
set fish_color_quote normal
set fish_color_error normal
set fish_color_redirection normal
set fish_color_end normal
# disable prompt modifier by virtuelenv
set --export VIRTUAL_ENV_DISABLE_PROMPT 'True'
# Aliases
alias v="nvim"
alias r="ranger"
alias sr="sudo -E ranger"
alias h="htop -d5"
alias grep="grep --color=auto"
alias nf="neofetch"
alias vrc="nvim /home/koopa/dotfiles/vimrc"
alias cu="checkupdates"
alias e="exit"
alias ls="ls -hN --color=auto --group-directories-first"
alias lsa="ls -a"
alias ..="cd .."
alias cdu="cd /home/koopa/Dokumente/Uni"
alias ...="cd ../.."
alias pup="yay -Syu"
alias p="yay"
alias cpc="cleanpaccache"
alias vbib="nvim /home/koopa/latex/Bibliothek.bib"
alias vconf="nvim /home/koopa/dotfiles/config"
alias rmdir="rm -d"
alias ipe="curl ipinfo.io/country; and curl ipinfo.io/ip"
#alias ipi="ip addr | grep 'state UP' -A2 | tail -n1 | awk '{print $2}' | cut -f1  -d'/'"
alias lsenum="ls | wc -l"
alias speed="speedtest --simple"
alias yv="youtube-viewer"
alias ydl="youtube-dl"

# Abbreveations
abbr sdv "sudo --preserve-env nvim"
abbr kdiff "kitty +kitten diff"
