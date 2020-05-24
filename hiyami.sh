#!/bin/bash

# Default Configuration, You Can Change This.

default_fansub="SEKAI DOT ID"
default_lang="ind"

######################################################################
# Warning!. not recommended to change the code below, unless you understand what you are doing
######################################################################

prog="HIYAMI"
ver="Version Develop"
motto="Make Hardsub Its Easy!"
wt="whiptail --nocancel --title"

$wt "$prog - $ver" --msgbox \
    "$prog, $motto . Press Ok to continue" 20 70 10

fansub=$($wt "$prog - $ver" --inputbox \
    "Input Your Name / Your Fansub Name" 20 70 "$default_fansub" \
    3>&1 1>&2 2>&3)

vid=$($wt "$prog - $ver" --menu \
    "Choose Video Format" 20 70 10 \
    "1" "x264. Safest choice for compatibility" \
    "2" "x265. Next generation video format" \
    "3" "VP9. Next generation video format, the best choice for streaming" \
    "4" "AV1. Experimental Use Only" \
    3>&1 1>&2 2>&3)

res=$($wt "$prog - $ver" --menu \
    "Choose Video Resolution" 20 70 10 \
    "1" "nHD (640x360)" \
    "2" "qHD (960x540)" \
    "3" "HD (1280x720)" \
    "4" "FHD (1920x1080)" \
    "5" "2K DCI (2048x1080)" \
    "6" "WQHD (2560x1440)" \
    "7" "UHD (3840x2160)" \
    "8" "4k DCI (4096x2160)" \
    3>&1 1>&2 2>&3)

qua=$($wt "$prog - $ver" --menu \
    "Choose Video Quality" 20 70 10 \
    "1" "High Quality" \
    "2" "Medium Quality" \
    "3" "Low Quality" \
    "4" "Very Low Quality" \
    3>&1 1>&2 2>&3)

lang=$($wt "$prog - $ver" --inputbox \
    "Subtitle Language. ISO 639-2 Language Code" 20 70 "$default_lang" \
    3>&1 1>&2 2>&3)
