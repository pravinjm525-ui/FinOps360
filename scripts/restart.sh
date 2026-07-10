#!/bin/bash

PROJECT_ROOT=$(cd "$(dirname "$0")/.." && pwd)
cd "$PROJECT_ROOT"

echo "========================"
echo " Restarting FinOps360 "
echo "========================"

./scripts/stop.sh

if [ $? -ne 0 ]; then
    echo "Failed to stop application"
    exit 1
fi

echo ""

./scripts/run.sh

if [ $? -ne 0 ]; then
    echo "Failed to start application"
    exit 1
fi

echo ""
echo "Application Restarted Successfully"
