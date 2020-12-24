FROM ubuntu:20.04
RUN apt update \
    && apt -y install --no-install-recommends \
    libreoffice libreoffice-l10n-ja \
    && apt clean \
    && rm -rf /var/lib/apt/lists/*
RUN apt update && apt install -y fonts-dejavu \
    fonts-dejavu-core \
    fonts-dejavu-extra \
    fonts-droid-fallback \
    fonts-dustin \
    fonts-f500 \
    fonts-fanwood \
    fonts-freefont-ttf \
    fonts-liberation \
    fonts-lmodern \
    fonts-lyx \
    fonts-sil-gentium \
    fonts-texgyre \
    fonts-tlwg-purisa \
    fonts-ipafont
RUN apt install -y imagemagick
RUN cp /etc/ImageMagick-6/policy.xml ./polycy.xml
RUN /etc/ImageMagick-6/policy.xml | grep -V '<policy domain="coder" rights="none" pattern="PDF" />' > /etc/ImageMagick-6/policy.xml
COPY run.sh /root/