FROM ubuntu:20.04
RUN apt update
RUN apt install -y unzip wget fontconfig && fc-cache -f

RUN wget -q https://noto-website-2.storage.googleapis.com/pkgs/NotoSansCJKjp-hinted.zip \
    && wget -q https://noto-website-2.storage.googleapis.com/pkgs/NotoSerifCJKjp-hinted.zip \
    && unzip NotoSansCJKjp-hinted.zip && unzip -o NotoSerifCJKjp-hinted.zip && mkdir -p /usr/share/fonts/TTF && mv *.otf /usr/share/fonts/TTF \
    && rm *.zip \
    && fc-cache -f

RUN apt install -y language-pack-ja-base language-pack-ja
RUN update-locale LANG=ja_JP.UTF-8

RUN apt update \
    && apt -y install --no-install-recommends \
    libreoffice libreoffice-l10n-ja \
    && apt clean \
    && rm -rf /var/lib/apt/lists/*
RUN apt update && apt install -y imagemagick
RUN cp /etc/ImageMagick-6/policy.xml ./policy.xml

RUN cat ./policy.xml | grep -V '<policy domain="coder" rights="none" pattern="PDF" />' > /etc/ImageMagick-6/policy.xml
COPY run.sh /root/