#!/bin/bash

temp_in=/tmp/temp
temp_out=/tmp/temp.pdf

cat > $temp_in

cd /tmp
ls -la >&2 

soffice \
  --headless \
  --convert-to pdf \
  $temp_in \
  >&2

if [ -d ./images ]; then
  rm -rf ./images
fi
mkdir ./images

convert $temp_out ./images/%03d.png
convert -append ./images/*.png out.png


cat out.png