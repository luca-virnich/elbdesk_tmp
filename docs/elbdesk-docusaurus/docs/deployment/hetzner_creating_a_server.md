---
sidebar_position: 2
---

# Creating a VPS on Hetzner Cloud

![Hetzner](/img/hetzner_logo.png)

## Introduction

In order to deploy our server and we app we need to set up an ssh key to our Hetzner account, create a new vps with Docker CE preinstalled.

To create a new server on your [Cloud Console](https://console.hetzner.cloud/), please open your project and do the following:

## Add a New Project

|![Hetzner](/img/hetzner_add_project_001.png)|![Hetzner](/img/hetzner_add_project_002.png)|
|:-:|:-:|
|Add a new project|Name a new project|

## Create a Server

Go to `Create Resource` -> `Server`

![Hetzner](/img/hetzner_create_server_001.png)

We should create our server with the following features:

- **Location**: Nuremberg
- **Image**: Docker CE app
- **Type**: Arm64 (Ampere)
- **Networking**: Public IPv4 and Public IPv6
- **SSH keys**: select ssh key we've configured in the [How to login to your Hetzner instance with an SSH Key](deployment/hetzner_ssh_login.md) step.

Leave everything else unselected.

:::warning

Since we don't have a backup strategy we won't even use the Hetzner backup until we make a final strategy decision.

:::

:::danger

Do not deploy **production** environment before we have defined and working backup and roll back strategy

:::

Click **Create & Buy now** and we're done creating a server on Hetzner!
