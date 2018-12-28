# Add RVM to PATH for scripting
PATH=$PATH:$HOME/node

# Source PHP from MAMP version
export PATH="/Applications/MAMP/bin/php/php5.6.10/bin":$PATH

# Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Add RVM to PATH for scripting
export PATH="$PATH:$HOME/.rvm/bin"

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# ------------------------------------
# Set default text editor
# Defaults to Atom if it exists
# Otherwise, nano
# Tip: In Atom goto Atom >> Install Shell Commands if you don't have access to atom via CL
# ------------------------------------
atom_path='/Applications/Atom.app/Contents/Resources/app/'
if [ -d "${atom_path}" ]; then
  text_editor='atom'
else
  text_editor='nano'
fi

# ------------------------------------
# Environment variables
# ------------------------------------
export VISUAL=$text_editor
export EDITOR="$VISUAL"
export GIT_EDITOR="$VISUAL"

# ------------------------------------
# ALIASES
# ------------------------------------
# Aliases for (1) quickly opening .bashrc and (2) have terminal recognize changes to it
alias bashedit='sudo ${text_editor} ~/.bashrc'
alias bashrefresh='source ~/.bashrc'

alias bashappendedit='sudo ${text_editor} ~/.bashrc-append'
alias bashappendrefresh='source ~/.bashrc-append'

# Search history. Example usage: histg foo
alias histg="history | grep"

# Get your current IP
alias myip="curl http://ipecho.net/plain; echo"

# -l list in long format
# -F Display a...
#       slash (`/') immediately after each pathname that is a directory,
#       asterisk (`*') after each that is executable,
#       at sign (`@') after each symbolic link
#       equals sign (`=') after each socket,
#       percent sign (`%') after each whiteout,
#       vertical bar (`|') after each that is a FIFO.
# -G = Color
# -a = Show hidden files
alias ll="ls -laFG"

# Ask before removing files
alias rm='rm -i'

# Personal aliases
alias xx="tmux detach"
alias ww="tmux new -s ww"
alias tw="tmux attach -t ww"

alias bb="vi ~/.bashrc "
alias sb="source ~/.bashrc "
alias ct="crontab ~/.crontab"

alias gg='git log'
alias tt='git status'
alias br='git branch'
alias aa='git add -p'
alias pm='git pull origin master; git push origin master; git gc'
alias fm="git fetch upstream; git checkout master; git merge upstream/master"

alias md="mongod"
alias jp="jupyter notebook"

# ------------------------------------
# Define color variables
# ------------------------------------
# Regular Colors
Black='\[\e[0;30m\]'        # Black
Red='\[\e[0;31m\]'          # Red
Green='\[\e[0;32m\]'        # Green
Yellow='\[\e[0;33m\]'       # Yellow
Blue='\[\e[0;34m\]'         # Blue
Purple='\[\e[0;35m\]'       # Purple
Cyan='\[\e[0;36m\]'         # Cyan
White='\[\e[0;37m\]'        # White
Light_Gray='\[\033[0;37m\]'

# Bold
BBlack='\[\e[1;30m\]'       # Black
BRed='\[\e[1;31m\]'         # Red
BGreen='\[\e[1;32m\]'       # Green
BYellow='\[\e[1;33m\]'      # Yellow
BBlue='\[\e[1;34m\]'        # Blue
BPurple='\[\e[1;35m\]'      # Purple
BCyan='\[\e[1;36m\]'        # Cyan
BWhite='\[\e[1;37m\]'       # White
BLight_Gray='\[\033[1;37m\]'

# High Intensity
IBlack='\[\e[0;90m\]'       # Black
IRed='\[\e[0;91m\]'         # Red
IGreen='\[\e[0;92m\]'       # Green
IYellow='\[\e[0;93m\]'      # Yellow
IBlue='\[\e[0;94m\]'        # Blue
IPurple='\[\e[0;95m\]'      # Purple
ICyan='\[\e[0;96m\]'        # Cyan
IWhite='\[\e[0;97m\]'       # White

# Bold High Intensity
BIBlack='\[\e[1;90m\]'      # Black
BIRed='\[\e[1;91m\]'        # Red
BIGreen='\[\e[1;92m\]'      # Green
BIYellow='\[\e[1;93m\]'     # Yellow
BIBlue='\[\e[1;94m\]'       # Blue
BIPurple='\[\e[1;95m\]'     # Purple
BICyan='\[\e[1;96m\]'       # Cyan
BIWhite='\[\e[1;97m\]'      # White

# Reset colors
NONE="\[\e[0m\]"

# ------------------------------------
# Configure prompt
# Includes special handling for git repos
# ------------------------------------

# When in a git repo, this method is used to determine the current branch
function parse_git_branch {
  git branch 2>/dev/null | grep '^*' | sed 's_^..__' | sed 's_\(.*\)_(\1)_'
}

# When in a git repo, this method is used to determine if there are changes
  function git_dirty {
  git diff --quiet HEAD &>/dev/null
  [ $? == 1 ] && echo "!"
}

# Variables
ps1_user="$BIBlue\u$NONE"
ps1_host="$IGreen\h$NONE"
ps1_dir="$BIPurple\w$NONE"
ps1_git="$Cyan \$(parse_git_branch)$Red \$(git_dirty)$NONE"

# Option 1 user@host:dir(branch)! $
# export PS1="${ps1_user}@${ps1_host}:${ps1_dir}${ps1_git} \$ "

# Option 2 dir(branch)! $
export PS1="${ps1_dir}${ps1_git} \$ "

# ------------------------------------
# Load non-generic .bashrc
# To use, create ~/.bashrc-append
# This is where you might put aliases, functions, etc.
# that are specific to your system
# ------------------------------------
if [ -f ~/.bashrc-append ]; then
  source ~/.bashrc-append
  appended=true
fi

# ------------------------------------
# MOTD (Message of the Day)
# What you see when Terminal opens
# ------------------------------------
echo "----------------------------"
echo "Loaded ~/.bashrc"
if [ ${appended} ]; then
  echo "Appended ~/.bashrc-append"
fi
echo ""
echo "To edit run $ bashedit"
echo "To refresh run $ bashrefresh"
echo ""
echo "You are: `whoami`"
echo "You're in: `pwd`"
echo ""
echo "All aliases...$ alias"
echo "----------------------------"
