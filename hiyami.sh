#!/bin/bash

######################################################################
######################################################################
# Default Configuration, You Can Change This.
######################################################################
######################################################################

# Input Your Name / Fansub / Fanshare
default_fansub="SEKAI DOT ID"

# CRF (Constant Rate Factor)
default_quality="25"

# Video Bit
# 8-Bit : yuv444p
# 10-Bit : yuv444p10le
# 12-Bit : yuv444p12le
# 14-Bit : yuv444p14le
# 16-Bit : yuv444p16le
default_pix_fmt="yuv444p"

# Subtitle Format
# Advanced SubStation Alpha : ass
# SubRip : srt
default_subtitle="ass"

# ISO 639-2 Language Code
default_lang="ind"

######################################################################
######################################################################
# Warning!. not recommended to change the code below, unless you understand what you are doing
######################################################################
######################################################################

prog="HIYAMI"
ver="Version 0.1"
motto=""

fansub=$(whiptail --nocancel --title "$prog - $ver" --inputbox \
  "Input Your Name / Your Fansub Name" 20 70 "$default_fansub" \
3>&1 1>&2 2>&3)

vid=$(whiptail --nocancel --title "$prog - $ver" --menu \
  "Choose Video Format" 20 70 10 \
  "libx264" "H264 Video Format. Safest choice for compatibility" \
  "libx265" "H265 Video Format. Next generation video format" \
3>&1 1>&2 2>&3)

for i in *.mkv; do
######################################################################
# nHD
######################################################################

# Convert Resolution videos
ffmpeg -i "$i" -filter_complex "scale=640:360" -c:v $vid -preset veryslow -crf $default_quality -pix_fmt $default_pix_fmt -c:a aac -b:a 384k "$prog-${i%.*}.mp4"
# Rename
mv "$prog-${i%.*}.mp4" "[$prog]-${i%.*}-[nHD][$vid].mp4"
# MKV Merge
mkvmerge --default-language $default_lang -o "$prog-${i%.*}.mkv" "[$prog]-${i%.*}-[nHD][$vid].mp4" "${i%.*}.$default_subtitle"
# Delete .mp4 convert videos after MKV Merge
rm "[$prog]-${i%.*}-[nHD][$vid].mp4"
# Generate CRC32 .mkv
crc=$(crc32 "$prog-${i%.*}.mkv")
# Rename .mkv files with CRC32
mv "$prog-${i%.*}.mkv" "[$fansub]-${i%.*}-[nHD][$vid][${crc::8}].mkv"
# Add to .tar.xz archive
tar cf - "[$fansub]-${i%.*}-[nHD][$vid][${crc::8}].mkv" | xz -z -9 - > "$prog-${i%.*}.tar.xz"
# Generate CRC32 .tar.xz
crcxz=$(crc32 "$prog-${i%.*}.tar.xz")
# move to output directory
mv "[$fansub]-${i%.*}-[nHD][$vid][${crc::8}].mkv" output/"[$fansub]-${i%.*}-[nHD][$vid][${crc::8}].mkv"
mv "$prog-${i%.*}.tar.xz" output/"[$fansub]-${i%.*}-[nHD][$vid][${crcxz::8}].tar.xz"

######################################################################
# qHD
######################################################################

# Convert Resolution videos
ffmpeg -i "$i" -filter_complex "scale=960:540" -c:v $vid -preset veryslow -crf $default_quality -pix_fmt $default_pix_fmt -c:a aac -b:a 384k "$prog-${i%.*}.mp4"
# Rename
mv "$prog-${i%.*}.mp4" "[$prog]-${i%.*}-[qHD][$vid].mp4"
# MKV Merge
mkvmerge --default-language $default_lang -o "$prog-${i%.*}.mkv" "[$prog]-${i%.*}-[qHD][$vid].mp4" "${i%.*}.$default_subtitle"
# Delete .mp4 convert videos after MKV Merge
rm "[$prog]-${i%.*}-[qHD][$vid].mp4"
# Generate CRC32 .mkv
crc=$(crc32 "$prog-${i%.*}.mkv")
# Rename .mkv files with CRC32
mv "$prog-${i%.*}.mkv" "[$fansub]-${i%.*}-[qHD][$vid][${crc::8}].mkv"
# Add to .tar.xz archive
tar cf - "[$fansub]-${i%.*}-[qHD][$vid][${crc::8}].mkv" | xz -z -9 - > "$prog-${i%.*}.tar.xz"
# Generate CRC32 .tar.xz
crcxz=$(crc32 "$prog-${i%.*}.tar.xz")
# move to output directory
mv "[$fansub]-${i%.*}-[qHD][$vid][${crc::8}].mkv" output/"[$fansub]-${i%.*}-[qHD][$vid][${crc::8}].mkv"
mv "$prog-${i%.*}.tar.xz" output/"[$fansub]-${i%.*}-[qHD][$vid][${crcxz::8}].tar.xz"

######################################################################
# HD
######################################################################

# Convert Resolution videos
ffmpeg -i "$i" -filter_complex "scale=1280:720" -c:v $vid -preset veryslow -crf $default_quality -pix_fmt $default_pix_fmt -c:a aac -b:a 384k "$prog-${i%.*}.mp4"
# Rename
mv "$prog-${i%.*}.mp4" "[$prog]-${i%.*}-[HD][$vid].mp4"
# MKV Merge
mkvmerge --default-language $default_lang -o "$prog-${i%.*}.mkv" "[$prog]-${i%.*}-[HD][$vid].mp4" "${i%.*}.$default_subtitle"
# Delete .mp4 convert videos after MKV Merge
rm "[$prog]-${i%.*}-[HD][$vid].mp4"
# Generate CRC32 .mkv
crc=$(crc32 "$prog-${i%.*}.mkv")
# Rename .mkv files with CRC32
mv "$prog-${i%.*}.mkv" "[$fansub]-${i%.*}-[HD][$vid][${crc::8}].mkv"
# Add to .tar.xz archive
tar cf - "[$fansub]-${i%.*}-[HD][$vid][${crc::8}].mkv" | xz -z -9 - > "$prog-${i%.*}.tar.xz"
# Generate CRC32 .tar.xz
crcxz=$(crc32 "$prog-${i%.*}.tar.xz")
# move to output directory
mv "[$fansub]-${i%.*}-[HD][$vid][${crc::8}].mkv" output/"[$fansub]-${i%.*}-[HD][$vid][${crc::8}].mkv"
mv "$prog-${i%.*}.tar.xz" output/"[$fansub]-${i%.*}-[HD][$vid][${crcxz::8}].tar.xz"

######################################################################
# FHD
######################################################################

# Convert Resolution videos
ffmpeg -i "$i" -filter_complex "scale=1920:1080" -c:v $vid -preset veryslow -crf $default_quality -pix_fmt $default_pix_fmt -c:a aac -b:a 384k "$prog-${i%.*}.mp4"
# Rename
mv "$prog-${i%.*}.mp4" "[$prog]-${i%.*}-[FHD][$vid].mp4"
# MKV Merge
mkvmerge --default-language $default_lang -o "$prog-${i%.*}.mkv" "[$prog]-${i%.*}-[FHD][$vid].mp4" "${i%.*}.$default_subtitle"
# Delete .mp4 convert videos after MKV Merge
rm "[$prog]-${i%.*}-[FHD][$vid].mp4"
# Generate CRC32 .mkv
crc=$(crc32 "$prog-${i%.*}.mkv")
# Rename .mkv files with CRC32
mv "$prog-${i%.*}.mkv" "[$fansub]-${i%.*}-[FHD][$vid][${crc::8}].mkv"
# Add to .tar.xz archive
tar cf - "[$fansub]-${i%.*}-[FHD][$vid][${crc::8}].mkv" | xz -z -9 - > "$prog-${i%.*}.tar.xz"
# Generate CRC32 .tar.xz
crcxz=$(crc32 "$prog-${i%.*}.tar.xz")
# move to output directory
mv "[$fansub]-${i%.*}-[FHD][$vid][${crc::8}].mkv" output/"[$fansub]-${i%.*}-[FHD][$vid][${crc::8}].mkv"
mv "$prog-${i%.*}.tar.xz" output/"[$fansub]-${i%.*}-[FHD][$vid][${crcxz::8}].tar.xz"

done
