#!/bin/bash

#########################################
# general
#########################################

alias aptget='sudo apt-get'
alias setclip='xclip -selection c'
alias getclip='xclip -selection clipboard -o'
alias ea='vi ~/.bash_aliases && . ~/.bash_aliases'
alias g='grep -E'
alias ipy='ipython'


#########################################
# brightness
#########################################

brightfile='/sys/class/backlight/intel_backlight/brightness'
max_bright=`cat /sys/class/backlight/intel_backlight/max_brightness`
bright_step=$((max_bright/20))
function brightdown() {
    local cur=`cat $brightfile`
    echo $((cur-bright_step)) | sudo tee $brightfile > /dev/null
}
function brightup() {
    local cur=`cat $brightfile`
    echo $((cur+bright_step)) | sudo tee $brightfile > /dev/null
}
function dim() {
    echo $((bright_step*2)) | sudo tee $brightfile > /dev/null
}
function undim() {
    echo $((max_bright*7/10)) | sudo tee $brightfile > /dev/null
}

#########################################
# projects
#########################################

function pull_projects() {
    for dir in $HOME/projects/*; do echo "pulling $dir" && git -C $dir pull; done
}
. ~/projects/words/aliases.bash

