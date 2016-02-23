#!/bin/sh
# tests [-t] if flac files in import dir are corrupted, treat warnings as errors [-w], keep quiet otherwise [-s].
# IFS=$'\n' fixes an issue with spaces in file/folder names. 

IFS=$'\n'
for file in $(find /import/ -type f -iname '*.flac'); do
    flac -tws $file;
done
