---
sidebar_position: 3
---

# Creating a DNS record for an ElbDesk project

![Hetzner](/img/cloudflare_creating_dns_record.png)

To create a DNS record in the dashboard:

- Log in to the [Cloudflare dashboard ↗](https://dash.cloudflare.com/login) and select the `developer@app-ahoi.com` and the `elbdesk.cloud` domain.
  If the project has a custom domain then select that one.
- Go to **DNS** > **Records**.
- Select **Add record**.
- Choose a record Type **A**.
- Complete the required fields:
  - **Type**: A
  - **Name**: `*.<project-name>`
    This should be a project name, not a client name because a single client could have multiple projects.
    And this subdomain is tied to a single VPS.
  - **IPv4 address**: ip address of the vps where we are hosting the elbdesk instance.
  - **Proxy status**: DNS only
  - **TTL**: auto
