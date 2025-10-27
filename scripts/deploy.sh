#!/bin/bash
set -e

echo "======================================="
echo "DevOps Simulator - Unified Deployment"
echo "======================================="

# Default: Production Configuration
DEPLOY_ENV="production"
DEPLOY_REGION="us-east-1"
APP_PORT=8080

# Optional: Development Mode
if [ "$1" == "dev" ]; then
  DEPLOY_ENV="development"
  DEPLOY_MODE="docker-compose"
  APP_PORT=3000
  ENABLE_DEBUG=true
fi

echo "Environment: $DEPLOY_ENV"
echo "Region: ${DEPLOY_REGION:-local}"
echo "Port: $APP_PORT"
if [ "$DEPLOY_ENV" == "development" ]; then
  echo "Mode: $DEPLOY_MODE"
  echo "Debug: $ENABLE_DEBUG"
fi
echo "======================================="

# Pre-deployment checks
echo "Running pre-deployment checks..."
if [ ! -f "config/app-config.yaml" ]; then
  echo "Error: Configuration file not found!"
  exit 1
fi

# Run environment-specific steps
if [ "$DEPLOY_ENV" == "production" ]; then
  echo "Starting production deployment..."
  echo "Pulling latest Docker images..."
  # docker pull devops-simulator:latest

  echo "Rolling update strategy initiated..."
  # kubectl rolling-update devops-simulator

  echo "Deployment completed successfully!"
  echo "Application available at: https://app.example.com"

else
  echo "Installing dependencies..."
  npm install

  echo "Running tests..."
  npm test

  echo "Starting development deployment..."
  docker-compose up -d

  echo "Waiting for application to start..."
  sleep 5

  echo "Performing health check..."
  curl -f http://localhost:$APP_PORT/health || exit 1

  echo "Deployment completed successfully!"
  echo "Application available at: http://localhost:$APP_PORT"
  echo "Hot reload enabled - code changes will auto-refresh"
fi
