# Wav-silencer-script

A simple `.bat` script that silences `.wav` files using FFmpeg.

## What it does
This script overrides `.wav` audio files and makes them silent so that you dont have to use audio editing software.

## Requirements

You need FFmpeg installed for this to work.

### Install FFmpeg 
Download FFmpeg here:  
https://ffmpeg.org/download.html#build-windows

Make sure FFmpeg is added to your system PATH so it can be used from the command line.

If you're not sure how to do that, look up a quick tutorial on installing FFmpeg on Windows.

## How to use

1. Put your `.wav` files in the same folder as the `.bat` file (or edit the script paths if needed)
2. Run the `.bat` file
3. The processed files will be generated in the same directory (or as defined in the script)

##Note:
this overrides the .wav file to be silent. so if you want to keep the original version make sure to make a copy that is NOT in the same folder as this .bat script
