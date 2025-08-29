---
sidebar_position: 1
---

# How to login to your Hetzner instance with an SSH Key

![Hetzner](/img/hetzner_logo.png)

## Introduction

In order to access your Hetzner instance from your local computer in a safe way, it is recommended to make use of an SSH Key. In this tutorial, I will guide you how to setup the secure login with your SSH Key on a new Hetzner instance.

Passwords are often very weak. If you increase the password strength, it gets very difficult to remember the password and the use of a password manager is unavoidable. SSH keys also benefit from their length. They can be as long as 4096 bits. You can also use different algorithms like ECC (Elliptic Curve Cryptography) using the standard `ed25519`, which we will also use in this tutorial.

#### Prerequisites

- A Hetzner Cloud Account
- Permissions for creating a Hetzner Project and a Hetzner instance
- `ssh-keygen`, `cat` and `nano` installed on your local computer

## Step 1 - Create your local SSH Key

- You need to create an SSH Key on your local machine. It is recommended to add a comment at the end in order to identify the SSH Key in the future. Some information about the computer itself could be useful. For example:

  ```SSH-Key - MacbookPro 13 Inch - example@example.com```

  <pre> ssh-keygen -t ed25519 -C "some comment here" </pre>

- Then you will be asked for the filename/location of the SSH key. You could just hit enter in order to leave the default name (`ed25519`) and location (`/home/user/.ssh/`). If you want to name the file to be able to distinguish between multiple keys for multiple different servers, you can enter `/home/user/.ssh/server01` where you replace `user` with your `username`

- Then you should set your own [passphrase](https://www.ssh.com/academy/ssh/passphrase) for adding more security to the server. There are many tutorials on YouTube and the whole internet, where adding a passphrase is just omitted or not recommended. We strongly recommend to set a passphrase in order to set up a secure instance. This passphrase will protect the private key, so no one can access the server even if they have access to your computer. You can configure your SSH client to communicate to keypass, to avoid entering the password every time, but understand, that typically keypass is active all the time, so direct access to your logged-in session would not prevent unpermitted access to the server in that case. Yet it protects anyone from copying the file and using it on another computer. By default, this command will create a public and a private key named `id_ed25519.pub` and `id_ed25519` respectively and they will be saved on the path `~/.ssh/`. The file `id_ed25519.pub` is the public key the server needs to authenticate the user and the file `id_ed25519` is your private key that no one should have access to except for you, especially if you skip the step of setting up a passphrase.

## Step 2 - Add the SSH Key to your Hetzner Cloud Console

In this step it is important to clarify that the SSH keys are not shared between Hetzner projects. That means that you need to repeat this step with the same key or different keys for each new project.

- Select one project or create a new one
- On left side menu of your project, select the `Security` menu item
- Click on the Add `SSH Key` button
- On your local machine execute the command `cat /home/user/.ssh/id_ed25519.pub` to see the content of your file or open it in the editor
- Copy the content of your `id_ed25519.pub` file from your local machine to the clipboard by selecting the output and using `ctrl`+`shift`+`c`
- Paste the SSH Key in the marked area on your Hetzner account
- Add a name for the SSH Key in order to identify it on the Hetzner Cloud Console or leave the automatically generated name based on the key comment
- That's it. This specific SSH Key is ready to be used every time you create a new instance for this specific project

## Step 4 - Test the login with the SSH Key from your local computer

- Copy the IP address of the Hetzner instance
- On your local computer start the login. Replace `xxx.xxx.xxx.xxx` with the IP address of the created Hetzner Instance
  <pre> ssh root@xxx.xxx.xxx.xxx </pre> 
- Type `yes` in order to add the fingerprint to the `known_host` file
- Enter the passphrase you set for the SSH Key
- And that's it. The process was successful if you see the welcome message of the Ubuntu Hetzner instance

## Step 5 - Add an SSH key to an already created server

If you created your server prior to adding the SSH key, you cannot assign it to your server via Cloud Console.

It is best to try this on a new server first, to not cut the SSH connection to a production environment. Since this will only take a few minutes, you can quickly setup a server and have at worst a few cents of cost. So create a new server with no SSH key and follow these steps.

- View the content of your public key file using:
  ```sh
  cat /home/user/.ssh/id_ed25519.pub 
  ```

  Select the output using `ctrl`+`shift`+`c`
- Log into your server using:
  ```sh
  ssh root@server_ip 
  ```

- Write the key to the server:
  - As root user:
    ```sh
    echo "keyfile_content" >> /root/.ssh/authorized_keys 
    ```

  - As any other user:
    ```sh
    echo "keyfile_content" >> /home/user/.ssh/authorized_keys 
    ```

  Replace `keyfile_content` with the content of `id_ed25519.pub` you just copied

  Replace `user` with the username
- Open the ssh config using:
  ```sh
  nano /etc/ssh/sshd_config 
  ```

  You can replace `nano` with the editor of your choice, if installed.
- If you want to disable password login, find a line with `PermitRootLogin` and replace it exactly with:
  ```sh
  PermitRootLogin prohibit-password 
  ```

  This will disable the ability to use insecure passwords and only accepts your SSH keys
- To reload your SSH deamon to activate the new configs, execute:
  ```sh
  systemctl restart sshd 
  ```

- Exit the SSH session and try to access it without a password. If you specified a passphrase to protect your local private key, you need to still insert the passphrase

If you followed these steps carefully and everything is working as intended, you can now proceed with your production server and delete the test server again.

## Conclusion

You can now login to your Hetzner instance with a secure method.
