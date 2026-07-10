#!/bin/bash

PROJECT_ROOT=$(cd "$(dirname "$0")/.." && pwd)
cd "$PROJECT_ROOT"

echo "========================"
echo " FinOps360 Build "
echo "========================"

source build/build-info.sh

echo ""
echo "Building Backend..."

cd backend

mvn clean package

if [ $? -ne 0 ]; then
    echo "Backend Build Failed"
    exit 1
fi

docker build \
-t finops360-backend:$BUILD_ID \
-t finops360-backend:latest \
.

cd ..

echo ""
echo "Building Frontend..."

cd frontend

npm install

npm run build

if [ $? -ne 0 ]; then
    echo "Frontend Build Failed"
    exit 1
fi

docker build \
-t finops360-frontend:$BUILD_ID \
-t finops360-frontend:latest \
.

cd ..

echo ""
echo "========================"
echo " Build Successful"
echo "========================"
