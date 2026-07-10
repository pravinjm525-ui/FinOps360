#!/bin/bash

PROJECT_ROOT=$(cd "$(dirname "$0")/.." && pwd)
cd "$PROJECT_ROOT"

echo "======================================="
echo "      FinOps360 Rollback"
echo "======================================="

echo ""
echo "Available Backend Images:"
docker images "finops360-backend" --format "table {{.Repository}}\t{{.Tag}}\t{{.CreatedSince}}"

echo ""
read -p "Backend Tag : " BACKEND_TAG

echo ""
read -p "Frontend Tag : " FRONTEND_TAG
echo ""
echo "Updating version.env..."

cat > versions/version.env <<EOF
BACKEND_TAG=$BACKEND_TAG
FRONTEND_TAG=$FRONTEND_TAG
EOF
echo ""
echo "Restarting Application..."

./scripts/restart.sh

echo ""
echo "======================================="
echo "Rollback Completed"
echo " Backend Version : $BACKEND_TAG"
echo " Frontend Version: $FRONTEND_TAG"
echo "======================================="
