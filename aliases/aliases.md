# cd aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ~='cd ~/'
alias -='cd -'

alias docs='cd ~/Documents/Documentations'
alias proj='cd ~/Documents/Projects/'
alias plains='cd ~/Documents/docker-plain-projects'

alias webstudio='cd ~/Documents/Projects/gbv/GBV_Webstudio'
alias tasklogger='cd ~/Documents/Projects/taskLoggerX'

alias edital='nano ~/.bashrc'
alias loadal='source ~/.bashrc'

# ls aliases
alias l='ls -ahlF --author'
alias ls='ls --color=auto'

# CLI Aliases
alias cl='clear'
alias »='>>'

# docker aliases
alias docks='docker ps'
alias dockstop='docker stop $(docker ps -a -q)'
alias compose='docker compose up -d'

# systemctl aliases
alias reboot='systemctl reboot'
alias shutdown='systemctl poweroff'