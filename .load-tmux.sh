TMUX_BIN=/mnt/d/workspace/prebuilt/wsl/tmux/bin/tmux;

if [ -z "$TMUX" ]; then
    TMUX_SESSIONS="$($TMUX_BIN list-sessions | grep -v attached)";
    if [ ! -z "$TMUX_SESSIONS" ]; then 
        $TMUX_BIN -u attach-session -t ${TMUX_SESSIONS/:*};
    else
        $TMUX_BIN -u ;
    fi
else
    if [ -e ~/.local/.bash_profile ]; then
        source ~/.local/.bash_profile;
    fi
fi

