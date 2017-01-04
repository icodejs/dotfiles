# Path to your oh-my-zsh installation.
export ZSH=/Users/tahirjoseph/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="robbyrussell"
ZSH_THEME="tahir2"


# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git sublime history osx)

# User configuration

alias s='subl'

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:~/.nvm/v0.10.38/bin/eslint"

# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

source ~/.nvm/nvm.sh

export HISTTIMEFORMAT="%d/%m/%y %T "


# Node
export PATH=$PATH:~/.nvm/versions/node/v6.9.1/bin

# Phantomjs
export PATH=$PATH:/usr/local/bin/phantomjs

# MySql
export PATH=$PATH:/usr/local/Cellar/mysql/5.7.11/bin

# Scala
export PATH=$PATH:/usr/local/share/scala/bin

# Mongodb
export PATH=$PATH:/usr/local/Cellar/mongodb/3.2.1/bin

# RVM
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # This loads RVM


alias mysql_start="brew services start mysql"
alias mysql_stop="brew services stop mysql"

# Tree
# Tree with colour.
alias dir='tree -C'


# Colour and list directories only.
alias dird='tree -d -C'


# Colours and print the full path prefix for each file.
alias dirf='tree -f -C'

# Git
export PATH=/usr/local/git/bin:$PATH

alias gdf='git diff --stat' # git diff with files
alias gmt='git mergetool'
alias gsp='git stash pop'
alias gct='git commit -v'
alias gch='git commit -v -c HEAD'
alias glol='git log --pretty=format:"%h %s" --graph'
alias gll="git log --graph --pretty=format:'%Cred%h%Creset %C(yellow)%an%d%Creset %s %Cgreen(%cr)%Creset' --date=relative"
alias gbd='for k in `git branch|perl -pe s/^..//`;do echo -e `git show --pretty=format:"%Cgreen%ci %Cblue%cr%Creset" $k|head -n 1`\\t$k;done|sort -r'


# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases

alias zshconfig="s ~/.zshrc"
alias zcon="s ~/.zshrc"


alias ohmyzsh="s ~/.oh-my-zsh"
alias omz="s ~/.oh-my-zsh"

alias s="st"


############### My Shortcuts ###############

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


# Open in finder
alias openf='open -a Finder'


#z
# . `brew --prefix`/etc/profile.d/z.sh

. /usr/local/Cellar/z/1.9/etc/profile.d/z.sh
function precmd () {
  z --add "$(pwd -P)"
}


# What is my ip address
alias ip='ifconfig | grep inet'


# List file in date order
alias lst="echo && pwd && echo && ls -al"


# List files in date order with tree
alias lstr="lst && dirf"

# Touch - Create file
alias t="touch"


# Start Node at root (server.js)
alias n="node"


# Which Aliases
alias nbw="npm run build:watch"
alias ntw="npm run test:watch"
alias rs="rails s"


# update zsh profile
alias zr="source ~/.zshrc"

# find out what process is using a port
function wp() {
 local port=${1}
 lsof -i :$port
}

# zsh share history
unsetopt inc_append_history
unsetopt share_history


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
  echo "    ~ gb    =   'git branch'"
  echo "    ~ gcm   =   'git checkout master'"
  echo "    ~ gco   =   'git checkout'"
  echo "    ~ gct   =   'git commit -v'"
  echo "    ~ gch   =   'git commit -v -c HEAD' // Contains previous commit message"
  echo "    ~ gd    =   'git diff'"
  echo "    ~ gdf   =   'git diff --stat'"
  echo "    ~ gl    =   'git pull'"
  echo "    ~ glol  =   'git log --pretty=format:"%h %s" --graph'"
  echo "    ~ gll   =   'git log --graph --pretty=format:'%Cred%h%Creset %C(yellow)%an%d%Creset %s %Cgreen(%cr)"
  echo "    ~ glg   =   'git log --stat --max-count=5'"
  echo "    ~ glgg  =   'git log --graph --max-count=5'"
  echo "    ~ glgga =   'git log --graph --decorate --all'"
  echo "    ~ gm    =   'git merge'"
  echo "    ~ gmt   =   'git mergetool'"
  echo "    ~ gp    =   'git push'"
  echo "    ~ gr    =   'git remote'"
  echo "    ~ gss   =   'git status -s'"
  echo "    ~ gst   =   'git status'"
  echo
  echo "    ----------------------------"
  echo "    Get diff from last commit or SHA1"
  echo "    ----------------------------"
  echo "    git diff 78fa857 hotzone/scripts/models/carousel-model.js"
  echo "    git diff HEAD~1 hotzone/scripts/models/carousel-model.js "
  echo
}


GIT_AUTHOR_NAME=$(git config --get user.name)
GIT_AUTHOR_EMAIL=$(git config --get user.email)
GIT_COMMITTER_NAME="${GIT_AUTHOR_NAME}"
GIT_COMMITTER_EMAIL="${GIT_AUTHOR_EMAIL}"
AWS_ACCESS_KEY_ID="AKIAIOEKFBWZNB34NPZA"
AWS_SECRET_ACCESS_KEY="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"
GIT_API_TOKEN="7b1477457be5bd5f03c46d21b81fdfea3647f88e"
export GIT_AUTHOR_NAME GIT_AUTHOR_EMAIL GIT_COMMITTER_NAME GIT_COMMITTER_EMAIL GIT_API_TOKEN AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY
