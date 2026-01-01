#!/bin/bash
#
# hyprunswapper.sh
# One-file toggle: start/stop a background loop that toggles FLOATING clients to TILED.
#

LOCKFILE="/tmp/hyprunswapper.lock"
PIDFILE="/tmp/hyprunswapper.pid"
HYPRCTL="/usr/bin/hyprctl"
SLEEP_INTERVAL=0.1
SELF="$0"

notify() {
    command -v notify-send >/dev/null 2>&1 && notify-send "$@"
}

start() {
    if [ -f "$LOCKFILE" ]; then
        echo "Already running (lock present)."
        exit 0
    fi

    echo "Starting HyprUnswapper..."
    nohup "$SELF" runloop >/dev/null 2>&1 &
    pid=$!
    echo "$pid" > "$PIDFILE"
    touch "$LOCKFILE"
    notify "🔄 HyprUnswapper ON"
    echo "Started (pid: $pid)"
    exit 0
}

stop() {
    if [ ! -f "$LOCKFILE" ]; then
        echo "Not running (no lock)."
        exit 0
    fi

    echo "Stopping HyprUnswapper..."
    if [ -f "$PIDFILE" ]; then
        pid=$(cat "$PIDFILE")
        kill "$pid" 2>/dev/null || true
        sleep 0.1
        if kill -0 "$pid" 2>/dev/null; then
            kill -9 "$pid" 2>/dev/null || true
        fi
        rm -f "$PIDFILE"
    else
        pkill -f "$SELF" 2>/dev/null || true
    fi

    rm -f "$LOCKFILE"
    notify "🛑 HyprUnswapper OFF"
    echo "Stopped."
    exit 0
}

# The actual work: find FLOATING clients and toggle them back to TILED
run_unswapping_once() {
    if ! clients_json=$($HYPRCTL clients -j 2>/dev/null); then
        return
    fi

    # Select where floating == true
    mapfile -t addrs < <(printf '%s' "$clients_json" | jq -r '.[] | select(.floating == true) | .address')

    if [ "${#addrs[@]}" -eq 0 ]; then
        return
    fi

    for addr in "${addrs[@]}"; do
        $HYPRCTL dispatch togglefloating address:"$addr" 2>/dev/null || true
    done
}

runloop() {
    trap 'rm -f "$LOCKFILE" "$PIDFILE"; exit' INT TERM EXIT
    while true; do
        run_unswapping_once
        sleep "$SLEEP_INTERVAL"
    done
}

case "$1" in
    runloop)
        runloop
        ;;
    stop)
        stop
        ;;
    *)
        if [ -f "$LOCKFILE" ]; then
            stop
        else
            start
        fi
        ;;
esac
