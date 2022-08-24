#!/bin/sh

for file in $@
do
    filenames="$filenames -i $file "
done

ffmpeg $filenames -vcodec copy -acodec copy out.flv
