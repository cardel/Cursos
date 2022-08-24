#!/bin/bash
for i in *.mp4 
	do 
		ffmpeg -i "$i" -c:v libx264 -preset slow -crf 18 -c:a aac -b:a 192k -pix_fmt yuv420p "$i".mkv &
done
