# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# turn off Ctrl+s XOFF
stty ixany
stty ixoff -ixon
stty stop undef
stty start undef

# User specific aliases and functions
PATH=/sbin:/bin:/usr/sbin:/usr/bin:/usr/X11R6/bin:/usr/sbin:/sbin
export DHT=$HOME/projects/trunk 
export RF_DOWNLOAD_JARS=TRUE

source /home/hub/.scripts/engage.sh
source /home/hub/.scripts/paths.sh

alias rm_unversion='svn st | grep '"'"'?'"'"' | awk '"'"'{print $2}'"'"' | xargs rm -rf'
alias ls_dir='ls -l | grep ^d'
alias ls_dirc='ls -l | grep ^d | xargs -0 -I {} echo -e "\033[0;32m"{}"\033[0m" ' 

hidden()
{
    ls -a "$@" | grep '^\.';
}

# X11 forwarding
# export DISPLAY=10.101.10.58:0.0

# useful bash functions, got it off the confluence page
ff()
{
    if [$# -lt 1]
    then
        echo "find . -not -path \"*.svn*\" -exec grep --color=auto -In \"<search term>\" '<>' \; -print"
        return
    fi
    find . -not -path "*.svn*" -exec grep --color=auto -In "$*" '<>' \; -print
}

fu()
{
    if [$# -ne 1]
    then
        echo "echo |gawk '<print strftime(\"%a %b %e %T %Z %Y\", <UNIX TIMESTAMP>)>'"
        return
    fi
    echo |gawk "<print strftime(\"%a %b %e %T %Z %Y\", $1)>"
}

# read your man page as a pdf
manpdf(){ man -t $1 | ps2pdf - - | acroread -; }

# xkcd
xkcd()
{ local f=$(curl -s http://xkcd.com/);display $(echo "$f"|grep -Po '(?<=")http://imgs.xkcd.com/comics/[^"]+(png|jpg)');echo "$f"|awk '/<img src="http:\/\/imgs\.xkcd\.com\/comics\/.*?" title=.*/<gsub(/^.*title=.|".*?$/,"");print>';}

# function to search for an exact filename
function flocate
{
  if [ $# -gt 1 ] ; then
    display_divider=1
  else
    display_divider=0
  fi

  current_argument=0
  total_arguments=$#
  while [ ${current_argument} -lt ${total_arguments} ] ; do
    current_file=$1
    if [ "${display_divider}" = "1" ] ; then
      echo "----------------------------------------"
      echo "Matches for ${current_file}"
      echo "----------------------------------------"
    fi

    filename_re="^\(.*/\)*$( echo ${current_file} | sed s%\\.%\\\\.%g )$"
    locate -r "${filename_re}"
    shift
    (( current_argument = current_argument + 1 ))
  done
}
