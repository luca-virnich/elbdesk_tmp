---
sidebar_position: 1
---

# Setup CI/CD

In this document we are going to set up CI/CD pipeline for ElbDesk Mailer hosted on a simple VPS instance.

## Prerequisites

You should have:

- A VPS instance with Docker installed
- A `mailer.<domain>.<tld>` subdomain pointing to your VPS instance
- GitHub repository with GitHub Actions support and sufficient privileges to manipulate those (we are going to be covering this in this documentation)

:::warning AVOID POTENTIAL CONFLICTS

To avoid any potential conflicts, the vps should not host any other services except a single instance of **ElbDesk Mailer**.

:::

## Introduction

We will be using `elbdesk_mailer` as our project name and `mailer.elbdesk.com` as our domain name.

After we set up GitHub Actions secrets, in order to configure this pipeline we will be focusing on a single file: `deployment-docker-production.yml`.

We are going to be covering how to setup each file specifically so that by the end of this document we have a fully working pipeline that takes advantage of GitHub Actions and Docker containers to build and deploy our docker image as well as running the database migration process all automatically without us needing to give it any special or manual input but a push to a specific branch to test migrations and upon its success to merge the pull request to start the build and deploy process.

## Server setup

On our VPS / server we need to generate a keypair and add the public key to the authorized_keys file in order to deploy our Serverpod project. We will do that in these two commands on our VPS instance:

1. `ssh-keygen -t rsa -b 4096`
2. `cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys`

Now we need to copy the private key and have it in the clipboard, we will need it to set up our first secret variable in the next chapter. We are going to do that by running the following command on our VPS:

- _`cat ~/.ssh/id_rsa`_
- Now select the entire output with the mouse and copy it to clipboard.

That is all for our server setup, we won't need to touch it anymore.

## Setting up GitHub secrets

You can navigate to your repository's secrets by going to the following URL [https://github.com/app-ahoi/elbdesk_mailer/settings/secrets/actions](https://www.github.com/app-ahoi/elbdesk_mailer/settings/secrets/actions).

The final result after we are done importing secrets should look like this:

![GitHub Actions secrets and variables](/img/github-actions-secrets-mailer.png)

Here we can see a 9 secret variables that we need to create in order to be available for our GitHub actions scrips. So let's dive into them one by one:

- SSH_PRIVATE_KEY - paste the private key we've just copied from our VPS.
- SSH_HOST - here you should define the IP of your VPS server or a domain name which points to it.
- SSH_USER - type the user from your VPS that you want the GitHub action to use for the ssh connection while deploying our project ➝ often `root`
- SMTP_SERVER - set the SMTP server from your mail provider
- SMTP_USERNAME - set the SMTP username from your mail provider
- SMTP_PASSWORD - set the SMTP password from your mail provider
- PB_URL - set this url to `mailer.<domain>.<tld>/pb`
- PB_EMAIL - set this to an email address which you will be useing as the ElbDesk Mailer admin account
- PB_PASSWORD - set this to the password for the ElbDesk Mailer admin account
- HASH_KEY - set this to the password you will be using to encrypt the token into the hash.

## Set up GitHub Action for deployment

In order to trigger the deployment we need to configure our workflow file. We will only have a single production environment hence in the `elbdesk_mailer/.github/workflows` directory we need to create `eployment-docker-production.yml` file like so:

```yaml
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
      PROJECT_NAME: "elbdesk_mailer"
      ENVIRONMENT_NAME: "production"
      DOMAIN: "elbdesk.com"
      PB_PORT: "8090:8080"
    secrets:
      SSH_PRIVATE_KEY: ${{ secrets.SSH_PRIVATE_KEY }}
      SSH_HOST: ${{ secrets.SSH_HOST }}
      SSH_USER: ${{ secrets.SSH_USER }}
      PB_URL: ${{ secrets.PB_URL }}
      PB_EMAIL: ${{ secrets.PB_EMAIL }}
      PB_PASSWORD: ${{ secrets.PB_PASSWORD }}
      HASH_KEY: ${{ secrets.HASH_KEY }}
      SMTP_SERVER: ${{ secrets.SMTP_SERVER }}
      SMTP_USERNAME: ${{ secrets.SMTP_USERNAME }}
      SMTP_PASSWORD: ${{ secrets.SMTP_PASSWORD }}
```

The only variable that we need to modify in this file when deploying a separate instance is the `DOMAIN` and possibly `PROJECT_NAME` if we're forking the `elbdesk_mailer` under a different name

## Setup ElbDesk Mailer admin account

- SSH into the VPS
- execute 
  ```sh
  docker exec -it production-pocketbase-1 ./pb/pocketbase superuser create <PB_EMAIL> <PB_PASSWORD>
  ```

- if you got the following output then the deployment is done
  ```sh
  Successfully created new superuser "nick@email.com"!
  ```


That's it! We have successfully set up our ElbDesk Mailer instance.
