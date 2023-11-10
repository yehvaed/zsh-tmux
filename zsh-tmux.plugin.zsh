#!/usr/bin/env zsh

: ${TMUX_AUTOSTART_ENABLED:="true"}
: ${TMUX_NEW_SESSION_STRATEGY:="new"}
: ${TMUX_NEW_SESSION_DEFAULT_NAME="tmux-session"}
PID=$$


# aliasesa
alias ta='tmux attach -t'
alias tad='tmux attach -d -t'
alias ts='tmux new-session -s'
alias tl='tmux list-sessions'
alias tksv='tmux kill-server'
alias tkss='tmux kill-session -t'

# bootstrap
() {
    # if tmux is already started not start new one
    [[ -n "${TMUX}" ]] && return 0

    # check if autostart tmux
    [[ "${TMUX_AUTOSTART_ENABLED}" == "false" ]] && return 0;

    # run tmux based on strategy
    case ${TMUX_NEW_SESSION_STRATEGY} in
        new)
            local new_session_name="${TMUX_NEW_SESSION_DEFAULT_NAME}-${PID}"
            tmux new-session -s "${new_session_name}"
            ;;
    esac

    # TODO: take some action when session finished
}
