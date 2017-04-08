source /usr/share/defaults/etc/profile


alias mountl='sudo lsblk -o name,mountpoint,label,size,uuid'

export ANDROID_HOME=/home/debugcc/Android/Sdk/
export ANDROID_PLATFORM_TOOLS="$ANDROID_HOME/platform-tools"
export PATH="${PATH}:$ANDROID_HOME/tools:$ANDROID_PLATFORM_TOOLS"


# Begin /usr/share/defaults/etc/profile.d/50-prompt.sh

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

endchar="\$"
if [ "$UID" = "0" ]; then
    endchar="#"
fi

FG="\[\033[38;5;081m\]"
BG="\[\033[38;5;245m\]"
AT="\[\033[38;5;245m\]"
HCOLOR="\[\033[38;5;206m\]"
BCOLOR="\[\033[0;31m\]"

export PS1="${FG}\u${AT}@${HCOLOR}\H ${BG}\w${BCOLOR}\$(parse_git_branch) ${FG}$endchar \[\e[0m\]"

unset FG
unset BG
unset AT
unset HCOLOR
unset BCOLOR
shopt -s checkwinsize

# End /usr/share/defaults/etc/profile.d/50-prompt.sh
