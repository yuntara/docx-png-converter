#!/bin/bash
DENSITY=$1
temp_in=/tmp/temp
temp_out=/tmp/temp.pdf

cat > $temp_in

cd /tmp
ls -la >&2 

LANG=ja_JP.utf8 soffice \
  --headless \
  --language=ja \
  --convert-to pdf \
  $temp_in \
  >&2

if [ -d ./images ]; then
  rm -rf ./images
fi
mkdir ./images

convert -density ${DENSITY} -units PixelsPerInch $temp_out ./images/%03d.png
convert -append ./images/*.png out.png

cat out.png