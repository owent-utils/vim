# FIX-WSL: *:*: nice(5) failed: operation not permitted
unsetopt BG_NICE

# Run compaudit if zsh shows "Ignore insecure directories and continue [y] or abort compinit [n]?"
# And chmod 755 to all files listed

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [[ ! -e "$ZINIT_HOME" ]]; then
    [ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"

    [ ! -d $ZINIT_HOME/.git ] && git clone --depth 100 https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"

    if [[ 0 -ne $? ]] || [[ ! -e "${ZINIT_HOME}/zinit.zsh" ]]; then
        if [[ -e "$ZINIT_HOME" ]]; then
            rm -f "$ZINIT_HOME"
        fi
    else
        chmod +x "${ZINIT_HOME}/zinit.zsh"
        source "${ZINIT_HOME}/zinit.zsh"
        autoload -Uz _zinit
        (( ${+_comps} )) && _comps[zinit]=_zinit

        zsh -ic "@zinit-scheduler burst"
    fi
else
    source "${ZINIT_HOME}/zinit.zsh"
    autoload -Uz _zinit
    (( ${+_comps} )) && _comps[zinit]=_zinit
fi

# zinit load  <repo/plugin> # Load with reporting/investigating.
# zinit light <repo/plugin> # Load without reporting/investigating.
# zinit snippet <URL> # Load a snippet from a local or remote files.

zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

ZSH_THEME="ys"

## Zinit Setting
# Must Load OMZ Git library
zinit snippet OMZL::async_prompt.zsh
zinit snippet OMZL::git.zsh
zinit snippet OMZL::clipboard.zsh
zinit snippet OMZL::termsupport.zsh
zinit snippet OMZL::history.zsh
zinit snippet OMZL::completion.zsh
zinit snippet OMZL::key-bindings.zsh
zinit snippet OMZL::vcs_info.zsh
zinit snippet OMZL::bzr.zsh

# key bindings
bindkey "\e[1~" beginning-of-line
bindkey "\e[4~" end-of-line
bindkey "\e[5~" beginning-of-history
bindkey "\e[6~" end-of-history
# bindkey "\e[3~" delete-char
# bindkey "\e[2~" quoted-insert
# bindkey "\e[5C" forward-word
# bindkey "\eOc" emacs-forward-word
# bindkey "\e[5D" backward-word
# bindkey "\eOd" emacs-backward-word
# bindkey "\ee[C" forward-word
# bindkey "\ee[D" backward-word
# bindkey "^H" backward-delete-word
# for rxvt
bindkey "\e[8~" end-of-line
bindkey "\e[7~" beginning-of-line
# for non RH/Debian xterm, can't hurt for RH/DEbian xterm
bindkey "\eOH" beginning-of-line
bindkey "\eOF" end-of-line
# for freebsd console
bindkey "\e[H" beginning-of-line
bindkey "\e[F" end-of-line
# completion in the middle of a line
bindkey '^i' expand-or-complete-prefix

# zinit snippet <URL>        # Raw Syntax with URL
# zinit snippet OMZ::<PATH>  # Shorthand OMZ/ (https://github.com/ohmyzsh/ohmyzsh/raw/master/)
# zinit snippet OMZL::<PATH> # Shorthand OMZ/lib/
# zinit snippet OMZT::<PATH> # Shorthand OMZ/themes/
# zinit snippet OMZP::<PATH> # Shorthand OMZ/plugins/

zinit cdclear -q # <- forget completions provided up to this moment
setopt promptsubst
# Load Prompt
zinit snippet OMZT::ys

# Bundles from the default repo (robbyrussell's oh-my-zsh).
zinit snippet OMZP::svn
which tmux >/dev/null 2>&1
if [[ $? -eq 0 ]]; then
    zinit snippet OMZP::tmux
fi
zinit snippet OMZP::heroku
# zinit snippet OMZP::pip
zinit snippet OMZP::command-not-found
zinit snippet OMZP::colored-man-pages
zinit snippet OMZP::man

zinit snippet OMZP::colorize
# zinit snippet OMZP::github
zinit snippet OMZP::python
zinit snippet OMZP::z

zinit load zdharma-continuum/history-search-multi-word
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions

THEME_NAME="default"
zinit light zdharma-continuum/fast-syntax-highlighting
typeset -A FAST_HIGHLIGHT
typeset -A FAST_HIGHLIGHT_STYLES
FAST_HIGHLIGHT[use_brackets]=1
FAST_HIGHLIGHT_STYLES[${FAST_THEME_NAME}paired-bracket]=bg:74
FAST_HIGHLIGHT_STYLES[${FAST_THEME_NAME}subtle-bg]=bg:74
FAST_HIGHLIGHT_STYLES[${FAST_THEME_NAME}here-string-var]=cyan,bg:74
FAST_HIGHLIGHT_STYLES[${FAST_THEME_NAME}case-condition]=bg:74
FAST_HIGHLIGHT_STYLES[paired-bracket]=bg:74
FAST_HIGHLIGHT_STYLES[subtle-bg]=bg:74
FAST_HIGHLIGHT_STYLES[here-string-var]=cyan,bg:74
FAST_HIGHLIGHT_STYLES[case-condition]=bg:74

# zinit snippet OMZP::supercrabtree/k

# disable git status
which git >/dev/null 2>&1
if [[ $? -eq 0 ]]; then
    zinit snippet OMZP::git
    zinit snippet OMZP::git-prompt
    git config --global oh-my-zsh.hide-status 1
    git config --global oh-my-zsh.hide-info 0
    git config --global oh-my-zsh.hide-dirty 1
fi

# Self update
# zinit self-update

# Plugin update
# zinit update

# Plugin parallel update
# zinit update --parallel

# Increase the number of jobs in a concurrent-set to 40
# zinit update --parallel 40