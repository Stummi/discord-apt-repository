# Discord Repository for apt

I created this because I am tired of manually downloading and installing
the latest package whenever Discord says so, and apparently there is no official repository.

This repository just provides the default apt repository structure, that can be easily accessed using
the GitHub raw URL.

An action checks for a new release of Discord once per hour, and updates the package if a new version is available.

# Usage

Create new file (e.g. discord.list) within /etc/apt/sources.list.d/ with this content:

```
deb [arch=amd64 trusted=yes] https://github.com/Stummi/discord-apt-repository/raw/refs/heads/main stable main
```

Note: I haven't bothered yet to sign the packages, so you have to use `trusted=yes` for now.

## Install discord

```sh
sudo apt update
sudo apt install discord
```

## Update discord

```sh
sudo apt update
sudo apt upgrade
```