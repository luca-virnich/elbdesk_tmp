---
sidebar_position: 1
title: Ahoi File Storage Server
---

# How to deploy an Ahoi File Storage Server

![Hetzner](/img/ahoi_file_storage_server_003.png)

## Introduction

Ahoi File Storage is a S3 compatible object storage server with Serverpod and Flutter integrations that consists of 3 parts:

- Ahoi File Storage Server
  - Self hosted server app used to handle incoming requests, uploads, downloads and managing authentication, server side storage and files.
- Ahoi File Storage
  - Serverpod integration package that implements CloudStorage methods and lets Serverpod talk to our Ahoi File Storage Server as well as prepare download descriptions for the client used in the Flutter apps.
- Ahoi File Storage Client
  - Serverpod Client addon that adds aditional client capabilities to talk to Ahoi File Storage Server from our app. It's not a direct Flutter app dependency but rather it's manually included into the Serverpod generated client.

### Prerequisites

- A Hetzner VPS instance with Docker preinstalled configured as per [Creating a VPS on Hetzner Cloud](deployment/hetzner_creating_a_server.md) document
- An SSH key used to programatically access the VPS created as described in [ElbDesk Deployment -> Setup CI/CD -> Server Setup](deployment/deployment.md#server-setup) section.

## Setting up GitHub secrets

You can navigate to your repository's secrets by going to the following URL [https://github.com/App-Ahoi/ahoi_file_storage_server/settings/secrets/actions](https://github.com/App-Ahoi/ahoi_file_storage_server/settings/secrets/actions).

The final result after we are done importing secrets should look like this:

![GitHub Actions secrets and variables](/img/github-actions-secrets-ahoi-file-storage-server.png)

Here we can see a 7 secret variables that we need to create in order to be available for our GitHub actions scrips. So let's dive into them one by one:

- **AFS_ACCESS_KEY_ID**
  - Generated AFSAccessId that's also used on the Serverpod and Serverpod Client side for request signing
- **AFS_SECRET_KEY**
  - Generated AFSSecretKey that's also used on the Serverpod and Serverpod Client side for request signing
- **ALLOWED_IP**
  - the IP of your serverpod server that's allowed to connect to delete and verify endpoints.
- **EMAIL**
  - type the email you are going to be using
- **SSH_HOST**
  - here you should define the IP of your VPS server or a domain name which points to it.
- **SSH_PRIVATE_KEY**
  - paste the private key we've just copied from our VPS.
- **SSH_USER**
  - type the user from your VPS that you want the GitHub action to use for the ssh connection while deploying our project ➝ often `root`

## Configuring build and deploy workflow

To build and deploy the ahoi_file_storage_server to the vps we need to define a GitHub Actions workflow file like so:

```yml
name: Deploy to Production

on:
  push:
    branches: [master]
  workflow_dispatch:
    inputs:
      target:
        description: "Target"
        required: true
        default: "production"
        type: choice
        options:
          - "production"

permissions:
  contents: read
  packages: write

jobs:
  call-deployment-docker-jobs:
    uses: ./.github/workflows/deployment-docker-jobs.yml
    with:
      target: ${{ github.event.inputs.target }}
      IMAGE_NAME: ${{ github.repository }}
      REGISTRY: ghcr.io
      # TODO Update with your GitHub username or organization
      GHCR_ORG: "app-ahoi"
      PROJECT_NAME: "fs_coe"
      ENVIRONMENT_NAME: "production"
      DOMAIN: "fs.coe.elbdesk.cloud"
    secrets:
      SSH_PRIVATE_KEY: ${{ secrets.SSH_PRIVATE_KEY }}
      SSH_HOST: ${{ secrets.SSH_HOST }}
      SSH_USER: ${{ secrets.SSH_USER }}
      EMAIL: ${{ secrets.EMAIL }}
      AFS_ACCESS_KEY_ID: ${{ secrets.AFS_ACCESS_KEY_ID}}
      AFS_SECRET_KEY: ${{ secrets.AFS_SECRET_KEY }}
      ALLOWED_IP: ${{ secrets.ALLOWED_IP }}
```

- **branches** - specify branch to which a PR push will trigger the deployment
- **PROJECT_NAME** - give the project name that's going to be used in the image name
- **ENVIRONMENT_NAME** - give the project environment name that's going to be used in the image name
- **DOMAIN** - specify the domain which is going to be used for the api endpoints
- **secrets** - Add all the GitHub secrets we've specified in the steps above

That's all, if you've done all the steps correctly you should end up with a working S3 compatible file storage server!
