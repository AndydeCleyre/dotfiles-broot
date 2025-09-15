# -- Fat Style Prep --

# ZDOTDIR=~/.config/zsh
# . $ZDOTDIR/.zshrc
#
# if (( $+functions[miniprompt] ))  miniprompt

# -- Lean Style Prep --

. ~/.config/zsh/completion_and_glob_opts.zsh
. ~/.config/zsh/inline_selection.zsh

ZSHZ_NO_RESOLVE_SYMLINKS=1
ZSHZ_UNCOMMON=1
. ~/.config/zsh/plugins/zsh-z/zsh-z.plugin.zsh

autoload -Uz compinit
compinit -i -d ~/.cache/zsh/zcompdump-$ZSH_VERSION

PROMPT='%B%F{white}-- %F{green}$ %f%b'

# -- Common --

jump () {
  emulate -L zsh
  if { zshz $@ } { broot --send $BROOT_SERVER_NAME -c ":focus $PWD" }
  exit
}

compdef _zshz jump

print -z "jump $BROOT_JUMP_SEARCH"

trap exit INT
