#!/bin/sh
echo "grab metadata from $1, save to output/metadata/..."
if [ $# -ne 1 ]
	then echo 'You need to provide an input file. For example, get_tags.sh video.mp4'
	exit 1
fi

xbase=`basename $1`
name=${xbase%.*}
echo "grab metadata from $1, save to output/metadata/${name}.json"

# -metadata title="The Title You Want"

# https://www.ffmpeg.org/ffprobe.html#Main-options
ffprobe -v error -show_entries format_tags=title:format=duration -of json $1 > "output/metadata/${name}.json"
# no key...
# https://trac.ffmpeg.org/wiki/FFprobeTips
# ffprobe -v error -show_entries format_tags=title -of default=noprint_wrappers=1:nokey=1 alabama-highlands.mp4

#first I tried the entire dump in json:m ffprobe -v error -show_format -show_streams -of json alabama-highlands.mp4
# then tried a shitload of different syntax
# -show_entries format=TAG
# -show_entries format=TAG=title
# -show_entries format=tag:title
# then I read the fuckin manual... https://www.ffmpeg.org/ffprobe.html#Main-options ... format_tags is right there. DUH.