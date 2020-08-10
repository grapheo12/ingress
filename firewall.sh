#!/bin/bash

# Run as root

ufw default deny incoming
ufw allow OpenSSH
ufw allow in "Nginx Full"

# Enabling may disrupt SSH Connections

ufw enable
