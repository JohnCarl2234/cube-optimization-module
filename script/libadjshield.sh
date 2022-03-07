#!/system/bin/sh
#EnhancedShield Library
#Created by rei_ryota
#

# include PATH
BASEDIR="$(dirname "$0")"
. $BASEDIR/pathinfo.sh

###############################
# PATHs
###############################

ADJSHIELD_REL="$BIN_DIR"
ADJSHIELD_NAME="adjshield"

###############################
# AdjShield tool functions
###############################

adjshield_cfg="/sdcard/Android/EnhancedShieldConfig.txt"
adjshield_log="/sdcard/Android/log_enhancedshield.txt"

# $1:str
adjshield_write_cfg()
{
    echo "$1" >> "$adjshield_cfg"
}

adjshield_create_default_cfg()
{
    true > "$adjshield_cfg"
    adjshield_write_cfg "# EnhancedShield Config File"
    adjshield_write_cfg "# Prevent given processes from being killed by Android LMK by protecting oom_score_adj"
    adjshield_write_cfg "# List all the package names of your Apps which you want to keep alive."
    adjshield_write_cfg "com.android.launcher3"
    adjshield_write_cfg "com.google.android.inputmethod.latin"
    adjshield_write_cfg "com.evozi.injector"
}

adjshield_start()
{
    # clear log file
    true > "$adjshield_log"
    # check interval: 120 seconds - Deprecated, use event driven instead
    "$MODULE_PATH/$ADJSHIELD_REL/$ADJSHIELD_NAME" -o "$adjshield_log" -c "$adjshield_cfg" &
}

adjshield_stop()
{
    killall "$ADJSHIELD_NAME"
}

# return:status
adjshield_status()
{
    local err
    if [ "$(ps -A | grep "$ADJSHIELD_NAME")" != "" ]; then
        echo "Running. See $adjshield_log for details."
    else
        # "Error: Log file not found"
        err="$(cat "$adjshield_log" | grep Error | head -n 1 | cut -d: -f2)"
        if [ "$err" != "" ]; then
            echo "Not running.$err."
        else
            echo "Not running. Unknown reason."
        fi
    fi
}
