# System Architecture

## Overview
DevOps Simulator follows a microservices architecture designed for high availability, scalability, and flexibility across both production and development environments.

---

## Components

### 1. Application Server
- **Technology**: Node.js + Express  
- **Production Port**: 8080  
- **Development Port**: 3000  
- **Scaling**:  
  - Production: Horizontal auto-scaling enabled  
  - Development: Manual (single instance with hot reload)  
- **Debug**: Chrome DevTools debugger on port 9229 (development only)  

---

### 2. Database Layer
- **Database**: PostgreSQL 14  
- **Production Configuration**: Master-slave replication  
- **Development Configuration**: Single local instance  
- **Backups**:  
  - Production: Daily automated backups  
  - Development: Manual backups only  
- **Seeding**: Auto-seed with test data on startup (development only)  

---

### 3. Monitoring System
- **Tool**: Prometheus + Grafana  
- **Production Metrics**: CPU, Memory, Disk, Network  
- **Development Metrics**: Includes Build time  
- **Alerts**:  
  - Production: Email notifications for critical issues  
  - Development: Console warnings only  
- **Dashboard**: Web dashboard (in development mode)  

---

### 4. Container Orchestration (Development Only)
- **Tool**: Docker Compose  
- **Services**: App, Database, Redis cache  
- **Volume Mounts**: Code directory for hot reload  

---

### 5. Authentication System (Beta - Development)
- **Method**: OAuth2 + JWT  
- **Providers**: Google, GitHub  
- **Sessions**: Redis-based session storage  

---

## Deployment Strategy
- **Production**: Rolling updates with zero-downtime and automated rollback  
- **Development**: Docker Compose hot reload, rollback via Git  

---

## Security
- **Production**:  
  - SSL/TLS encryption  
  - Database connection encryption  
  - Regular security audits  
- **Development**:  
  - SSL/TLS disabled (local only)  
  - Credentials stored in plain text  
  - CORS enabled for all origins  
  - Debug endpoints exposed  

---

## Experimental Features (Development Only)
⚠️ **Warning**: The following features are experimental:
- Multi-cloud deployment  
- AI-powered log analysis  
- Automatic rollback on anomaly detection  

