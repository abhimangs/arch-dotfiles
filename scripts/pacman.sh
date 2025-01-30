#!/bin/bash

sudo mv -f /etc/pacman.conf /etc/pacman.conf.bak
sudo stow --target="/etc/" pacman