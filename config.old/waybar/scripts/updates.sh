#!/bin/bash

# change this script to your os specific command

checkupdates 2>/dev/null | wc -l || echo "0" # -> arch linux based

# xbps-install -nuM | wc -l | echo "0" # -> void linux
