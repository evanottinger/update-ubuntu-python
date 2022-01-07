#!/bin/bash

# Ottinger Digital Labs, LLC
# 
# Author: Evan Ottinger  @OttySec
# 
# Description: A script to update Python3 to the latest
# version on Ubuntu.
#
# Not guaranteed, use at your own risk, yadayada.

## Add the deadsnakes ppa branch to the apt repository
add-apt-repository ppa:deadsnakes/ppa

## Update the apt database
apt update

## Install the latest version of Python
apt install python3.10

## Make Python3.10 the default version
update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.8 1
update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.10 2

## Remove the default version of Python
apt remove python3.8
apt autoremove

## Fix pip3
apt install python3.10-distutils
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python3.10 get-pip.py
rm get-pip.py

## Fix venv
apt install python3.10-venv

## Fix Python3-apt
apt remove --purge python3-apt
apt autoremove

## Fix link to Python3
update-alternatives --config python3