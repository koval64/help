#!/bin/bash

#This script is designed to provide a reverse playback video clip
#using mplayer, mencoder, ffmpeg and sox. For home use only it
#offers the user the ability to generate short video clips with
#both video and audio in reverse. It's not perfect by any means
#but for casual use does the job.

#If you don't need the audio you can comment out the audio section,
#the remux section, and the remove section. These are highlighted.

#Requisites: mplayer, mencoder, ffmpeg, sox.

#Advice: use ffmpeg -i movie.avi to discern frame rate before you start
#You'll need the input video in the same directory as the script!
#Leave STARTNO & MAXFILES variables alone

#Usage:
#Make sure you have plenty of disk space, a 1 minute clip can
#generate up to 1500 jpg images taking up 750mb space!

#place script and target video in a directory of your choice
#ensure script is executable
#cd to the directory with the script and the movie in it
#edit the script variables to ensure correct start and end positions
#(STARTPOS is the starting point of the clip, ENDPOS is the length of the clip)
#You may need to play around with the speed setting to generate all the
#frames if you have a slow PC

#type ./scriptname moviename at the command line

#variables
STARTPOS=00:01:00 #start of the clip
ENDPOS=00:00:30 #duration of the clip
QUALITY=100 #for best quality output
MAXFILES=100000 #allows for an hour of jpegs
START=99999 #allows for an hour of jpegs
SPEED=0.15 #reduce speed accordingly for longer segments
FPS=25 #either 25 or 23.976
#inputvideo = $1 (from the filename you type)
#
#extract and reverse audio using ffmpeg and sox
#this could be streamlined but provides an "out of the box" solution
####Comment out the three lines below if you do not need audio###
ffmpeg -i $1 -ss $STARTPOS -t $ENDPOS -vn -ac 2 -ar 44100 input.wav
sox -V input.wav output.wav reverse
ffmpeg -i output.wav -acodec libmp3lame -ac 2 -ab 128k -ar 44100 output.mp3
#
#grab jpegs
mplayer -idx -speed $SPEED -ss $STARTPOS -endpos $ENDPOS -vo jpeg:quality=$QUALITY:maxfiles=$MAXFILES $1
#
#rename files in reverse
i=$START
for f in *.jpg
do
mv $f $i.jpg
i=$(($i -1))
echo $i
done
#
#encode jpegs back to a movie
mencoder "mf://*.jpg" -mf type=jpg:fps=$FPS -o reverse.avi -ovc lavc -lavcopts vcodec=mpeg4
#
#remux audio and video
###Comment out the line below if you do not need audio###
mencoder reverse.avi -ovc copy -oac copy -audiofile output.mp3 -o reverseoutput.avi
#
#cleanup
rm *.jpg
rm *.wav
rm *.mp3
###Comment out the line below if you do not need audio###
rm reverse.avi
#
#end

#Nothing to undo 
