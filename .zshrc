# FIX-WSL: *:*: nice(5) failed: operation not permitted
unsetopt BG_NICE

source /home/owent/antigen.zsh

# Load the oh-my-zsh's library. 
antigen use oh-my-zsh  

# Bundles from the default repo (robbyrussell's oh-my-zsh). 
antigen bundle git 
antigen bundle heroku 
antigen bundle pip 
antigen bundle lein 
antigen bundle command-not-found  

antigen bundle colorize 
antigen bundle github 
antigen bundle python 
antigen bundle z

antigen bundle zsh-users/zsh-autosuggestions 
antigen bundle zsh-users/zsh-completions 
antigen bundle supercrabtree/k

# Syntax highlighting bundle. 
antigen bundle zsh-users/zsh-syntax-highlighting  

# Load the theme. 
antigen theme ys 

# Tell Antigen that you're done. 
antigen apply

