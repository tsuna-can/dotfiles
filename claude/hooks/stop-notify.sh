#!/bin/bash
# Only notify when the session is truly done, not just paused waiting on
# background subagents/tasks to report back (each of which also ends a turn
# and would otherwise fire this hook).
input=$(cat)

PENDING=$(echo "$input" | jq '((.background_tasks // []) | length) + ((.session_crons // []) | length)')

if [ "$PENDING" -eq 0 ]; then
    osascript -e 'display notification "Claude Code session completed" with title "✅ Claude Code Complete" sound name "Glass"'
fi
exit 0
