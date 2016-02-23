#!/bin/sh
# tests [-t] if flac files in import dir are corrupted, treat warnings as errors [-w], keep quiet otherwise [-s]

for file in `find /import -type f -name *.flac`; do flac -tws $file; done
