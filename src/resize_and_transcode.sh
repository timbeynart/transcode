#!/bin/sh

width=1920
height=1080
echo "resizing $1 to 1920x1080 and ecoding to 4096k"


if [ $# -ne 1 ]
	then echo 'provide an input file, moron. For example, resize.sh input/video.mp4'
	exit 1
fi
#strip filename down to just the name, no ext, no path:
xbase=`basename $1`
name=${xbase%.*}

ffmpeg -y -stats \
-i $1 \
-metadata title="$name" \
-pix_fmt yuv420p \
-vcodec libx264 \
-acodec libvo_aacenc \
-r 29.97 \
-level 3.1 \
-profile:v main \
-force_key_frames 60 \
-b:v 8500k \
-minrate 8500k \
-maxrate 8500k \
-bufsize 8000k \
-filter:v "scale=iw*sar:ih, scale=-1:$height, pad=$width:$height:($width-iw*min($width/iw\,$height/ih))/2:($height-ih*min($width/iw\,$height/ih))/2" \
"output/${name}_FHD.mp4"

# -metadata title="The Title You Want"

#
# scale filter
# i realized the non-square pixels were screwing up the scaler. use this first: scale=iw*sar:ih  (from https://ffmpeg.org/pipermail/ffmpeg-user/2011-November/003203.html)

# -filter:v "scale=iw*sar:ih, scale=iw*min($width/iw\,$height/ih):ih*min($width/iw\,$height/ih), pad=$width:$height:($width-iw*min($width/iw\,$height/ih))/2:($height-ih*min($width/iw\,$height/ih))/2" \
# not necessayr, use built in -size and -aspect options
#
#