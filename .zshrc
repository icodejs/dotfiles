# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

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
plugins=(git sublime)

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
alias gi='git init'
alias gr='git remote -v'
alias gcl='git clone'

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
alias lst="ls -ltra"

# List files in date order with tree
alias lstr="lst && dirf"

# Eclipse - Open or more instances
alias ecl="cd /Applications/eclipse/ && open -n Eclipse.app"

# Start Node at root (server.js)
alias nodest="node server.js"

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
alias yeo="yeoman"

# zsh sublime
alias subl="st"
alias s="st"

# update zsh profile
alias zrefresh="source ~/.zshrc"