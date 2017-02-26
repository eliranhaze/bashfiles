#!/bin/bash

#########################################
# general
#########################################

alias aptget='sudo apt-get'
alias setclip='xclip -selection c'
alias getclip='xclip -selection clipboard -o'
alias ea='vi ~/.bash_aliases && . ~/.bash_aliases'
alias g='grep -E'

brightfile='/sys/class/backlight/intel_backlight/brightness'
function brightdown() {
    local cur=`cat $brightfile`
    echo $((cur-100)) | sudo tee $brightfile > /dev/null
}
function brightup() {
    local cur=`cat $brightfile`
    echo $((cur+100)) | sudo tee $brightfile > /dev/null
}
function dim() {
    echo 100 | sudo tee $brightfile > /dev/null
}
function undim() {
    echo 1800 | sudo tee $brightfile > /dev/null
}

#########################################
# projects
#########################################

function pull_projects() {
    for dir in $HOME/projects/*; do echo "pulling $dir" && git -C $dir pull; done
}
. ~/projects/words/aliases.bash

