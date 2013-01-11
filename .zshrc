# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.

#ZSH_THEME="blinks"
#ZSH_THEME="robbyrussell"
#ZSH_THEME="af-magic"
#ZSH_THEME="agnoster"
#ZSH_THEME="aussiegeek"
ZSH_THEME="fino"


# Example aliases
alias zshconfig="subl ~/.zshrc"
alias zcon="subl ~/.zshrc"

alias ohmyzsh="subl ~/.oh-my-zsh"
alias omz="subl ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git sublime history)

source $ZSH/oh-my-zsh.sh


# MySql
# export MYSQL_HOME=/usr/local/mysql
# export PATH=$PATH:/usr/local/mysql/bin:/magic/jmeter/bin



# Tree
# Tree with colour.
alias dir='tree -C'

# Colour and list directories only.
alias dird='tree -d -C'

# Colours and print the full path prefix for each file.
alias dirf='tree -f -C'

# Git
alias gmt='git mergetool'
alias gct='git commit -m'

# My Shortcuts

# Run Local Web server
alias serv='python -m SimpleHTTPServer'

# Start an HTTP server from a directory, optionally specifying the port
function server() {
  local port="${1:-5050}"
  open "http://localhost:${port}/"
  # Set the default Content-Type to `text/plain` instead of `application/octet-stream`
  # And serve everything as UTF-8 (although not technically correct, this doesn’t break anything for binary files)
  python -c $'import SimpleHTTPServer;\nmap = SimpleHTTPServer.SimpleHTTPRequestHandler.extensions_map;\nmap[""] = "text/plain";\nfor key, value in map.items():\n\tmap[key] = value + ";charset=UTF-8";\nSimpleHTTPServer.test();' "$port"
}

# Go to dev folder
alias dev='cd ~/dev'

# Open in finder
alias openf='open -a Finder'

#z
# . `brew --prefix`/etc/profile.d/z.sh

. /usr/local/Cellar/z/1.4/etc/profile.d/z.sh
function precmd () {
  z --add "$(pwd -P)"
}

# What is my ip address
alias ip='ifconfig | grep inet'

# List file in date order
alias lst="echo && pwd && echo && ls -al"

# List files in date order with tree
alias lstr="lst && dirf"

# Start Node at root (server.js)
alias n="node"
alias ns="node server.js"

# Run site in Tomcat
alias catrun="./catalina.sh run"

# run node server via nodemon
function nodenm() {
  local port=${1:-4000}
  local file=${2:-server.js}
  echo "\n====================================================="
  echo "server running on http://localhost:"$port "via nodemon"
  echo "====================================================="
  nodemon $file $port
}

# Disable auto correct for yeoman
alias yeoman="nocorrect yeoman"

# Yeoman alias
alias yo="yeoman"

# zsh sublime
alias s="subl"

# update zsh profile
alias zr="source ~/.zshrc"

# bash keyboard shortcuts
function ks() {
  echo
  echo "    ============================"
  echo "    Useful BASH keyboard shortcuts"
  echo "    ============================"
  echo
  echo "    ~ Ctrl+A : Jump to Beginning of Line"
  echo "    ~ Ctrl+E : Jump to End of Line"
  echo "    ~ Ctrl+N : Go to Next Line"
  echo "    ~ Ctrl+P : Go to Previous Line"
  echo "    ~ Ctrl+W : Delete Previous Word"
  echo "    ~ Ctrl+U : Delete Line from Cursor to Beginning"
  echo "    ~ Ctrl+K : Delete Line from Cursor to End"
  echo "    ~ Ctrl+U : Cut from Cursor to Beginning of Line"
  echo "    ~ Ctrl+K : Cut from Cursor to End of Line"
  echo "    ~ Ctrl+Y : Paste Previously Cut Text at Cursor"
  echo "    ~ Ctrl+L : Clears the Screen, similar to the clear command"
  echo "    ~ Ctrl+R : Let’s you search through previously used commands"
  echo "    ~ Ctrl+C : Kill whatever you are running"
  echo "    ~ Ctrl+D : Exit current shell"
  echo "    ~ Ctrl+Z : Puts whatever you are running into a suspended background process. fg restores it"
  echo "    ~ Ctrl+T : Swap the last two characters before the cursor"
  echo "    ~ Esc+T  : Swap the last two words before the cursor"
  echo
}

# useful git command examples
function gs() {
  echo
  echo "    ============================"
  echo "    Useful Git command examples"
  echo "    ============================"
  echo
  echo "    Shortcuts"
  echo "    ----------------------------"
  echo "    ~ g     =   'git'"
  echo "    ~ ga    =   'git add'"
  echo "    ~ gct   =   'git commit -m'"
  echo "    ~ gst   =   'git status'"
  echo "    ~ gss   =   'git status -s'"
  echo "    ~ gd    =   'git diff'"
  echo "    ~ gl    =   'git pull'"
  echo "    ~ gp    =   'git push'"
  echo "    ~ gmt   =   'git mergetool'"
  echo "    ~ gco   =   'git checkout'"
  echo "    ~ gcm   =   'git checkout master'"
  echo "    ~ gr    =   'git remote'"
  echo "    ~ gb    =   'git branch'"
  echo "    ~ glg   =   'git log --stat --max-count=5'"
  echo "    ~ glgg  =   'git log --graph --max-count=5'"
  echo "    ~ glgga =   'git log --graph --decorate --all'"
  echo "    ~ gm    =   'git merge'"
  echo
  echo "    ----------------------------"
  echo "    Get diff from last commit or SHA1"
  echo "    ----------------------------"
  echo "    git diff 78fa857 hotzone/scripts/models/carousel-model.js"
  echo "    git diff HEAD~1 hotzone/scripts/models/carousel-model.js "
  echo

}

############## Zeebox Scripts ##############

alias ct="node carousel-test -h ~/Sites/ShowTimeAssets/hotzone -a ~/Sites/ShowTimeAPI/"
alias mc="nodenm 3333 app.js"

############## Zeebox Scripts ##############
