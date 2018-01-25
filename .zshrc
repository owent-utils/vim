# FIX-WSL: *:*: nice(5) failed: operation not permitted
unsetopt BG_NICE

source /home/owent/antigen.zsh

# Load the oh-my-zsh's library. 
antigen use oh-my-zsh  

# Bundles from the default repo (robbyrussell's oh-my-zsh). 
antigen bundle git
antigen bundle svn
antigen bundle tmux
antigen bundle heroku 
antigen bundle pip 
antigen bundle lein 
antigen bundle command-not-found  
antigen bundle colored-man-pages
antigen bundle man

antigen bundle colorize 
antigen bundle github 
antigen bundle python 
antigen bundle z

antigen bundle zsh-users/zsh-autosuggestions 
antigen bundle zsh-users/zsh-completions 
antigen bundle supercrabtree/k


# Load the theme. 
antigen theme ys 

# syntax color definition
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)

typeset -A ZSH_HIGHLIGHT_STYLES

# ZSH_HIGHLIGHT_STYLES[command]=fg=white,bold
# ZSH_HIGHLIGHT_STYLES[alias]='fg=magenta,bold'

ZSH_HIGHLIGHT_STYLES[default]=none
ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=009
ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=009,standout
ZSH_HIGHLIGHT_STYLES[alias]=fg=cyan,bold
ZSH_HIGHLIGHT_STYLES[builtin]=fg=cyan,bold
ZSH_HIGHLIGHT_STYLES[function]=fg=cyan,bold
ZSH_HIGHLIGHT_STYLES[command]=fg=white,bold
ZSH_HIGHLIGHT_STYLES[precommand]=fg=white,underline
ZSH_HIGHLIGHT_STYLES[commandseparator]=none
ZSH_HIGHLIGHT_STYLES[hashed-command]=fg=009
ZSH_HIGHLIGHT_STYLES[path]=fg=214,underline
ZSH_HIGHLIGHT_STYLES[globbing]=fg=063
ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=white,underline
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=none
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=none
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=none
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=063
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=063
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=009
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=009
ZSH_HIGHLIGHT_STYLES[assign]=none

# Syntax highlighting bundle. 
antigen bundle zsh-users/zsh-syntax-highlighting  

# Tell Antigen that you're done. 
antigen apply

