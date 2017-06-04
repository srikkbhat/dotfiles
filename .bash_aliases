alias pyserver='python -m SimpleHTTPServer &'
alias cdfe='cd ~/Projects/fe'
alias cdnode='cd ~/Projects/node'
alias cdjava='cd ~/Projects/java'
alias cdfe='cd ~/Projects/fe/oostfe'
alias cdbe='cd ~/Projects/java/oost2'
alias bmpush='git push bitbucket master'
alias bmpull='git pull bitbucket master'
alias bdpush='git push bitbucket devdaily'
alias bdpull='git pull bitbucket devdaily'
alias gitorig='git push origin master'
alias e='exit'
alias bowup='bower update'
alias g11='g++ -ggdb -Wall -pipe -std=c++11 -O2 -DLOCAL'
alias dcj='~/Dropbox/gcj/distributed/dcj_linux/dcj.sh'

#docker shortcuts
alias cddock='cd /mnt/home/gubuntu-docker'

dcjcompile() {
  dcj build --source $1
}

dcjtest() {
  dcj test --source $1 --nodes $2
}
