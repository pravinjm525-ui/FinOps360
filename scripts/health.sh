#!/bin/bash

PROJECT_ROOT=$(cd "$(dirname "$0")/.." && pwd)

source "$PROJECT_ROOT/config/common.env"

echo "======================================="
echo "      FinOps360 Health Check"
echo "======================================="
echo ""

echo "Backend"

until curl -fs http://localhost:${BACKEND_PORT}/actuator/health >/dev/null 2>&1
do
    echo "Waiting for Backend..."
    sleep 2
done

echo "Backend is UP"
echo ""
echo ""
echo "Frontend"

until curl -I http://localhost:${FRONTEND_PORT} >/dev/null 2>&1
do
    echo "Waiting for Frontend..."
    sleep 2
done

echo "Frontend is UP"
echo ""
echo ""
echo "Postgres"

docker exec finops360-postgres pg_isready \
-U admin \
-d finopsdb

echo ""
echo ""
echo "Health Check Completed"
