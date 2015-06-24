#!/bin/bash
#ffmpeg
# -- global options --
### overwrite output files
# -y
### show info
#-stats

# -- input file options --

### input file
# -i %(filename)s

# -- output file options --

# -pix_fmt yuv420p
# -vcodec libx264
# -acodec libvo_aacenc
### -r rate set frame rate (Hz value, fraction or abbreviation)
# -r 30
### the target h.264 settings, best-practice via apple
#-level 4.2 -profile:v high
### bitrate: this stuff enforces a constant bitrate, so we can target renditions apropriately
### see https://trac.ffmpeg.org/wiki/Encode/H.264#crf
# -b:v 1400k -minrate 1400k -maxrate 1400k -bufsize 1835k

### GOP (iframe) settings
# -g 300 ###set one every 10s for 29.97 video
# -force_key_frames 50
# -s 640x360

# ourput file
# tim.ts

#### Video Bit Rate (kbps)
#200; 400; 700; 1200; 1843; 2560; 4096;
#Video Frame Size
#416 x 234 (crop);200,400
#640 x 360 (crop);700
#960 x 540 (crop); 1200,1843
#1280 x 720 (stretch); 2560
#1920 x 1080 (stretch); 4096

#ffmpeg -y -stats -i /Users/Tim/Dev/github/ffmpeg-hls-demo/GOPR0014.MP4 -pix_fmt yuv420p -vcodec libx264 -acodec libvo_aacenc -r 29.97 -level 3.1 -profile:v main -s 1920x1080 -t 300 -force_key_frames 60 -b:v 4096k -minrate 4096k -maxrate 4096k -bufsize 5000k tim.ts

#ffmpeg -y -stats -i $1 -pix_fmt yuv420p -vcodec libx264 -acodec libvo_aacenc -r 29.97 -level 3.1 -profile:v main -s 1280x720 -t 300 -g 300 -b:v 6500k -minrate 6500k -maxrate 6500k -bufsize 1835k "$outputpath/6500/${name}-6500k.mp4"
#ffmpeg -y -stats -i $1 -pix_fmt yuv420p -vcodec libx264 -acodec libvo_aacenc -r 59.94 -level 4.0 -profile:v high -s 1920x1080 -t 300 -g 300 -b:v 8500k -minrate 8500k -maxrate 8500k -bufsize 5000k "$outputpath/8500/${name}-8500k.mp4"


#strip filename down to just the name, no ext, no path:
xbase=`basename $1`
name=${xbase%_FHD.*}
outputpath="output/stream/${name}"

mkdir -p "$outputpath"
#mkdir -p "$outputpath/400"
#mkdir -p "$outputpath/600"
#mkdir -p "$outputpath/1200"
#mkdir -p "$outputpath/3500"
#mkdir -p "$outputpath/5000"
#mkdir -p "$outputpath/6500"
#mkdir -p "$outputpath/8500"
#apple
ffmpeg -y -stats -i $1 -pix_fmt yuv420p -vcodec libx264 -acodec libvo_aacenc -r 29.97 -level 3.0 -profile:v baseline -s 416x234 -t 300 -g 300 -b:v 200k -minrate 200k -maxrate 200k -bufsize 1835k  "$outputpath/${name}-200k.mp4"
ffmpeg -y -stats -i $1 -pix_fmt yuv420p -vcodec libx264 -acodec libvo_aacenc -r 29.97 -level 3.0 -profile:v baseline -s 480x270 -t 300 -g 300 -b:v 400k -minrate 400k -maxrate 400k -bufsize 1835k "$outputpath/${name}-400k.mp4"
ffmpeg -y -stats -i $1 -pix_fmt yuv420p -vcodec libx264 -acodec libvo_aacenc -r 29.97 -level 3.0 -profile:v baseline -s 640x360 -t 300 -g 300 -b:v 700k -minrate 600k -maxrate 600k -bufsize 1835k "$outputpath/${name}-600k.mp4"
ffmpeg -y -stats -i $1 -pix_fmt yuv420p -vcodec libx264 -acodec libvo_aacenc -r 29.97 -level 3.0 -profile:v baseline -s 640x360 -t 300 -g 300 -b:v 1200k -minrate 1200k -maxrate 1200k -bufsize 1835k "$outputpath/${name}-1200k.mp4"
ffmpeg -y -stats -i $1 -pix_fmt yuv420p -vcodec libx264 -acodec libvo_aacenc -r 29.97 -level 3.1 -profile:v main -s 960x540 -t 300 -g 300 -b:v 3500k -minrate 3500k -maxrate 3500k -bufsize 1835k "$outputpath/${name}-3500k.mp4"
ffmpeg -y -stats -i $1 -pix_fmt yuv420p -vcodec libx264 -acodec libvo_aacenc -r 29.97 -level 3.1 -profile:v main -s 1280x720 -t 300 -g 300 -b:v 5000k -minrate 5000k -maxrate 5000k -bufsize 1835k "$outputpath/${name}-5000k.mp4"
