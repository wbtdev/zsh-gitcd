# GitCD for ZSH

## Installation

1. Add 'wbtdev/zsh-gitcd' to your plugin manager.

## Usage

```sh
$ gitcd <repo-url> (optional <branch>)
```

Example:

```sh
$ gitcd https://github.com/wbtdev/gitcd.plugin.zsh.git
# => will git clone and cd to "~/src/github.com/wbtdev/gitcd.plugin.zsh"
```

If the repository exists locally, it will automatically "[cd](https://en.wikipedia.org/wiki/Cd_(command))" into it.
If you provided a branch name, it will check it out.

## Config

By default, `gitcd` will git clone under `~/src/<host>/<path>`.
Change the environmental variable `GITCD_HOME` if you want it somewhere else.

Example:

```sh
$ gitcd git@github.com:zsh-users/zsh.git zsh
# => ~/src/github.com/zsh-users/zsh on the zsh branch.
```

## Test

```sh
zsh ./test.zsh
```
