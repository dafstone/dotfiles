#!/bin/bash
# Auto-update uv and tools weekly (runs on shell start)

TIMESTAMP_FILE="$HOME/.config/uv/last-update"
LOG_FILE="$HOME/.config/uv/logs/update.log"
UPDATE_INTERVAL=$((7 * 24 * 60 * 60))  # 7 days in seconds

# Ensure directories exist
mkdir -p "$(dirname "$TIMESTAMP_FILE")"
mkdir -p "$(dirname "$LOG_FILE")"

# Check if update is needed
if [ -f "$TIMESTAMP_FILE" ]; then
    LAST_UPDATE=$(cat "$TIMESTAMP_FILE")
    CURRENT_TIME=$(date +%s)
    TIME_DIFF=$((CURRENT_TIME - LAST_UPDATE))

    if [ $TIME_DIFF -lt $UPDATE_INTERVAL ]; then
        # Not time to update yet
        return 0
    fi
fi

# Show notification (non-blocking)
echo "🔄 Updating uv and tools in background..."

# Update in background, log results
{
    echo "=== Update started: $(date) ===" >> "$LOG_FILE"

    # Update uv itself
    echo "Updating uv..." >> "$LOG_FILE"
    uv self update >> "$LOG_FILE" 2>&1

    # Update all tools
    echo "Updating tools..." >> "$LOG_FILE"
    uv tool upgrade --all >> "$LOG_FILE" 2>&1

    echo "=== Update completed: $(date) ===" >> "$LOG_FILE"
    echo "" >> "$LOG_FILE"

    # Update timestamp
    date +%s > "$TIMESTAMP_FILE"
} &

# Disown the background process so it doesn't block shell
disown
