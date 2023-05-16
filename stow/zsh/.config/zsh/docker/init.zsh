#
# Docker aliases/settings
#

# ensure that 'docker' exists in the zmodules array in your .zimrc

## Management Commands
alias dc='docker container' # ghosts dc binary
alias dcl='docker container ls'
alias dcrm='docker container rm'
alias dck='docker container kill'
alias di='docker image'
alias dil='docker image ls'
alias dirm='docker image rm'
alias dv='docker volume'
alias dvl='docker volume ls'
alias dvp='docker volume prune'
alias ds='docker system'
alias dsp='docker system prune'
alias dsd='docker system df'
alias dp='docker port'
alias dni='docker network inspect'

# docker
alias dC="docker compose --project-name muckrack --file /home/hyshka/work/MR/muckrack/code/docker/docker-compose.yml --file /home/hyshka/work/MR/muckrack/code/docker/docker-compose.web.yml"
