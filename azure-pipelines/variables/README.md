# Enterprise Variable Strategy

## Common Variables
- Application Name
- Docker Repository
- Build Configuration

## DEV Variables
- Dev Environment Name
- Dev Resource Group
- Dev Namespace

## UAT Variables
- UAT Environment Name
- UAT Resource Group
- UAT Namespace

## PROD Variables
- Production Environment Name
- Production Resource Group
- Production Namespace

## Secrets

The following values will NOT be stored in Git.

- Azure Service Connection
- Azure Subscription ID
- ACR Password
- Key Vault Secrets
- Database Password
- API Keys

These will be managed using Azure DevOps Variable Groups and Azure Key Vault.