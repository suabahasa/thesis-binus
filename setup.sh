#!/bin/bash

# ==================================================================
# Initial setup
# ------------------------------------------------------------------

    # Set ENV variables
    export APT_INSTALL="apt-get install -y --no-install-recommends"
    export PIP_INSTALL="python -m pip --no-cache-dir install --upgrade"
    export GIT_CLONE="git clone --depth 10"
    export DEBIAN_FRONTEND="noninteractive"

    # Update apt
    sudo apt update

# ==================================================================
# Tools
# ------------------------------------------------------------------

    sudo $APT_INSTALL \
        gcc \
        make \
        pkg-config \
        apt-transport-https \
        build-essential \
        apt-utils \
        ca-certificates \
        wget \
        rsync \
        git \
        vim \
        mlocate \
        libssl-dev \
        curl \
        openssh-client \
        unzip \
        unrar \
        zip \
        awscli \
        csvkit \
        emacs \
        joe \
        jq \
        dialog \
        man-db \
        manpages \
        manpages-dev \
        manpages-posix \
        manpages-posix-dev \
        nano \
        iputils-ping \
        sudo \
        ffmpeg \
        libsm6 \
        libxext6 \
        libboost-all-dev \
        gnupg \
        cifs-utils \
        zlib1g

# ==================================================================
# Git-lfs
# ------------------------------------------------------------------
    
    curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash
    sudo $APT_INSTALL git-lfs gh

    git config --global user.name "Joshua Gugun Siagian"
    git config --global user.email joshua.siagian@binus.ac.id

    git lfs install

# ==================================================================
# Python
# ------------------------------------------------------------------

    # Based on https://launchpad.net/~deadsnakes/+archive/ubuntu/ppa

    # Adding repository for python3.11
    sudo $APT_INSTALL software-properties-common
    sudo add-apt-repository ppa:deadsnakes/ppa -y

    # Installing python3.11
    sudo $APT_INSTALL \
        python3.11 \
        python3.11-dev \
        python3.11-venv \
        python3-distutils-extra

    # Add symlink so python and python3 commands use same python3.11 executable
    sudo ln -s /usr/bin/python3.11 /usr/local/bin/python3
    sudo ln -s /usr/bin/python3.11 /usr/local/bin/python

    # Grant access for pip to install in ~/.local
    sudo chmod -R a+rwx /home/paperspace/.local
    
    # Install pip
    curl -sS https://bootstrap.pypa.io/get-pip.py | python3
    export PATH=$PATH:/home/paperspace/.local/bin

# ==================================================================
# Installing CUDA packages (CUDA Toolkit 12.1.1 & CUDNN 8.9.3)
# ------------------------------------------------------------------

    # https://developer.nvidia.com/cuda-downloads

    wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-keyring_1.1-1_all.deb
    sudo dpkg -i cuda-keyring_1.1-1_all.deb
    sudo apt-get update
    sudo $APT_INSTALL cuda-toolkit-12-6
    export PATH=/usr/local/cuda-12.6/bin${PATH:+:${PATH}}
    export LD_LIBRARY_PATH=/usr/local/cuda-12.6/lib64\
                            ${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
    rm cuda-keyring_1.1-1_all.deb

    sudo apt-get update
    sudo $APT_INSTALL cudnn9-cuda-12

    sudo apt-get install -y nvidia-open nvidia-fabricmanager

    # https://askubuntu.com/a/1258909/826952
    ubuntu-drivers devices
    sudo ubuntu-drivers autoinstall

# ==================================================================
# astral uv
# ------------------------------------------------------------------

    curl -LsSf https://astral.sh/uv/install.sh | sh
    # source $HOME/.cargo/env

# ==================================================================
# Config & Cleanup
# ------------------------------------------------------------------

    echo "export PATH=${PATH}" >> ~/.bashrc
    echo "export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}" >> ~/.bashrc
    echo "export CUDA_HOME=${CUDA_HOME}" >> ~/.bashrc


# ==================================================================
# Finalize
# ------------------------------------------------------------------

    # Cleanup
    sudo apt autoremove -y
    sudo updatedb

    # Reboot
    sudo reboot


# ==================================================================
# What's next?
# ------------------------------------------------------------------

    # do `gh auth login`