# Caps2Esc
It is a simple program. it will change you system capslock to esc.


# Install Script for udevmon Configuration

This repository contains a simple Bash script to automate the installation and configuration of `udevmon`. The script performs the following steps:

1. Creates a directory `/etc/interception/`.
2. Copies the `udevmon.yaml` file to the created directory.
3. Enables and starts the `udevmon` service.

## Prerequisites

- A Unix-like operating system (e.g., Linux)
- `sudo` privileges

## Usage

1. Clone this repository to your local machine:

    ```bash
    git clone https://github.com/jayaadeep11/Caps2Esc.git
    cd Caps2Esc
    ```

2. Ensure that the `udevmon.yaml` file is in the same directory as the script.

3. Make the script executable:

    ```bash
    chmod +x install.sh
    ```

4. Run the script with `sudo`:

    ```bash
    sudo ./install.sh
    ```

5. You will be prompted to confirm the installation:

    ```bash
    Would you like to continue with the install (y,n)
    ```

    Press `y` to proceed with the installation or any other key to abort.

## Script Details

The script performs the following actions:

1. Prompts the user for confirmation before proceeding.
2. Creates the directory `/etc/interception/` if it does not already exist.
3. Copies the `udevmon.yaml` file from the current directory to `/etc/interception/udevmon.yaml`.
4. Enables the `udevmon` service to start on boot.
5. Starts the `udevmon` service.
6. Prints "**Capslock Sucks**" upon successful completion.
