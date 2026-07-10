#!/bin/bash

echo "======================================="
echo "      FinOps360 Environment Status"
echo "======================================="
echo ""

echo "Docker Containers"
docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"

echo ""

echo "Docker Images"
docker images --format "table {{.Repository}}\t{{.Tag}}\t{{.ID}}\t{{.Size}}" | grep -E "REPOSITORY|finops360"
echo ""

echo "Docker Network"
docker network ls | grep docker

echo ""

echo "Docker Volumes"
docker volume ls | grep postgres
