#!/bin/bash

PROJECT_ROOT=$(cd "$(dirname "$0")/.." && pwd)
cd "$PROJECT_ROOT"

echo "======================================="
echo "      FinOps360 Deployment"
echo "======================================="

echo ""
echo "Stopping Existing Application..."
./scripts/stop.sh

if [ $? -ne 0 ]; then
    echo "Failed to stop application."
    exit 1
fi

echo ""
echo "Starting Latest Version..."
./scripts/run.sh

if [ $? -ne 0 ]; then
    echo "Deployment Failed."
    exit 1
fi

echo ""
echo "Running Health Check..."
./scripts/health.sh

if [ $? -ne 0 ]; then
    echo "Deployment Verification Failed."
    exit 1
fi

echo ""
echo "======================================="
echo " Deployment Successful"
echo "======================================="
