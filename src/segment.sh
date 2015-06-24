#!/bin/bash
path="output/stream/$1"
baseurl="stream/$1/hls"
mkdir -p "$path/hls/200"
mkdir -p "$path/hls/400"
mkdir -p "$path/hls/600"
mkdir -p "$path/hls/1200"
mkdir -p "$path/hls/3500"
mkdir -p "$path/hls/5000"
mediafilesegmenter -I -A -t 10 --start-segments-with-iframe -z iframe_index.m3u8 -b "$baseurl/200/" -f "$path/hls/200/" "$path/$1-200k.mp4"
mediafilesegmenter -I -A -t 10 --start-segments-with-iframe -z iframe_index.m3u8 -b "$baseurl/400/" -f "$path/hls/400/" "$path/$1-400k.mp4"
mediafilesegmenter -I -A -t 10 --start-segments-with-iframe -z iframe_index.m3u8 -b "$baseurl/600/" -f "$path/hls/600/" "$path/$1-600k.mp4"
mediafilesegmenter -I -A -t 10 --start-segments-with-iframe -z iframe_index.m3u8 -b "$baseurl/1200/" -f "$path/hls/1200/" "$path/$1-1200k.mp4"
mediafilesegmenter -I -A -t 10 --start-segments-with-iframe -z iframe_index.m3u8 -b "$baseurl/3500/" -f "$path/hls/3500/" "$path/$1-3500k.mp4"
mediafilesegmenter -I -A -t 10 --start-segments-with-iframe -z iframe_index.m3u8 -b "$baseurl/5000/" -f "$path/hls/5000/" "$path/$1-5000k.mp4"
variantplaylistcreator -o "$path/hls/master.m3u8" \
"$baseurl/200/prog_index.m3u8" "$path/$1-200k.plist" \
"$baseurl/400/prog_index.m3u8" "$path/$1-400k.plist" \
"$baseurl/600/prog_index.m3u8" "$path/$1-600k.plist" \
"$baseurl/1200/prog_index.m3u8" "$path/$1-1200k.plist" \
"$baseurl/3500/prog_index.m3u8" "$path/$1-3500k.plist" \
"$baseurl/5000/prog_index.m3u8" "$path/$1-5000k.plist"