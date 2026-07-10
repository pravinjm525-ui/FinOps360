#!/bin/bash

PROJECT_ROOT=$(cd "$(dirname "$0")/.." && pwd)
cd "$PROJECT_ROOT"

SERVICE=$1

if [ -z "$SERVICE" ]; then
    echo "Usage:"
    echo "./scripts/logs.sh backend"
    echo "./scripts/logs.sh frontend"
    echo "./scripts/logs.sh postgres"
    exit 1
fi

case "$SERVICE" in
    backend)
        CONTAINER=finops360-backend
        ;;
    frontend)
        CONTAINER=finops360-frontend
        ;;
    postgres)
        CONTAINER=finops360-postgres
        ;;
    *)
        echo "Unknown service: $SERVICE"
        echo ""
        echo "Available services:"
        echo "backend"
        echo "frontend"
        echo "postgres"
        exit 1
        ;;
esac

echo "======================================="
echo " Logs : $CONTAINER"
echo "======================================="

docker logs -f "$CONTAINER"
