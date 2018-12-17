#!/usr/bin/env bash
reflector --verbose --latest 40 --number 10 --sort rate --protocol https --thread 10 --save /etc/pacman.d/mirrorlist

