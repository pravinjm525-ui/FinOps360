#!/bin/bash

set -e

echo "========================"
echo "Cleaning Docker"
echo "========================"

docker system prune -f

docker image prune -f

docker container prune -f

echo ""
echo "Cleanup Complete"
