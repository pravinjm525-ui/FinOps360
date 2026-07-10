#!/bin/bash

PROJECT_ROOT=$(cd "$(dirname "$0")/.." && pwd)
cd "$PROJECT_ROOT"

echo "========================"
echo " FinOps360 CI Pipeline "
echo "========================"

./scripts/build.sh

if [ $? -ne 0 ]; then
    echo "Build Failed"
    exit 1
fi

echo ""
echo "CI Pipeline Completed Successfully"
