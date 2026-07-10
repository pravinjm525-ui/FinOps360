#!/bin/bash

set -e

PROJECT_ROOT=$(cd "$(dirname "$0")/.." && pwd)

cd "$PROJECT_ROOT"

echo "========================"
echo "Starting FinOps360"
echo "========================"

source versions/version.env

export BACKEND_TAG
export FRONTEND_TAG

TEMP_ENV=/tmp/finops360.env

cat \
config/common.env \
config/dev/database.env \
config/dev/app.env \
config/dev/docker.env \
> $TEMP_ENV

docker compose \
--env-file $TEMP_ENV \
-f docker/docker-compose.yml \
up -d

rm $TEMP_ENV

echo ""
echo "Application Started Successfully"
