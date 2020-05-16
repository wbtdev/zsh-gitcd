#!/bin/sh

gitcd() {
  url=${1} branch=${2} basedir=$HOME/src
  [[ -n $GITCD_HOME ]] && basedir=$GITCD_HOME

  if [[ -z $url ]]; then
    print -P '%F{red}[gitcd]%f Missing Repo URL.'
    return
  else
    dir=$(_giturl2dir $url) target=$basedir/$dir
    if [[ -d $target ]]; then
      print -P "%F{yellow}[gitcd]%f $target already exists."
      cd $target
      if [[ ! -z $branch ]]; then
        print -P "%F{blue}[gitcd]%f Branch %F{green}\"$branch\"%f detected, checking it out."
        git checkout $branch
      fi
    else
      if [[ -z $branch ]]; then
        git clone $url $target
      else
        git clone -b $branch $url $target
      fi
      cd $target
    fi
    print -P "%F{green}[gitcd]%f Done."
  fi
}

_giturl2dir() {
  url=$1
  url=${url#*@}
  url=${url#*://}
  url=${url%.git*}
  url=${url/:/\/}
  echo $url
}
