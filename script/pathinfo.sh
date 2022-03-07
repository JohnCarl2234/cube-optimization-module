#!/system/bin/sh
# Module Path Header
#Script by: rei_ryota

SCRIPT_DIR="/script"
BIN_DIR="/bin"
MODULE_PATH="$(dirname $(readlink -f "$0"))"
MODULE_PATH="${MODULE_PATH%$SCRIPT_DIR}"
PANEL_FILE="/sdcard/Android/memory_enhancement.txt"
