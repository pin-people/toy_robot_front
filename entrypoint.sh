#!/bin/bash
set -e

rm -f /unlocode_app/tmp/pids/server.pid

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"