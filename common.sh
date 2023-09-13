#!/usr/bin/env bash



PID_FILE=$HOME/PIDS.pid
LOG_DIR=$HOME/logs
DATA_DIR=$HOME/clients
BINARIES=$HOME/binaries

ERIGON_BINDIR=$BINARIES/erigon
LIGHTHOUSE_BINDIR=$BINARIES/lighthouse

print_step() {
    echo "

    "
    echo "--------------- $1 ---------------"
}

print_step_sleep() {
    echo "

    "
    echo "--------------- $1 ---------------"
    sleep $2
}

print_done() {
    echo "Done"
}

# Sleep with a message
sleeping() {
    echo sleeping $1
    echo $2
    sleep $1
}

# Execute the command with logs saved to a file.
#
# First parameter is log file name
# Second parameter is executable name
# Remaining parameters are passed to executable
execute_command() {
    LOG_NAME=$1
    EX_NAME=$2
    shift
    shift
    CMD="$EX_NAME $@ >> $LOG_DIR/$LOG_NAME > /dev/null 2>&1"
    echo "executing: $CMD"
    echo "$CMD" > "$LOG_DIR/$LOG_NAME"
    eval "$CMD &"
}

# Execute the command with logs saved to a file
# and is PID is saved to $PID_FILE.
#
# First parameter is log file name
# Second parameter is executable name
# Remaining parameters are passed to executable
execute_command_add_PID() {
    execute_command $@
    echo "$!" >> $PID_FILE
}

# export -f sleeping
# export -f execute_command
# export -f execute_command_add_PID