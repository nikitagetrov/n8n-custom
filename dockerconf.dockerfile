FROM n8nio/n8n:latest

   USER root

   RUN apk update && apk add --no-cache \
     glib \
     gobject-introspection \
     gtk+3.0 \
     libxss \
     libxrandr \
     alsa-lib \
     pango \
     atk \
     cairo \
     gdk-pixbuf \
     libxcomposite \
     libxcursor \
     libxdamage \
     libxext \
     libxfixes \
     libxi \
     libxrender \
     libxtst \
     nss \
     nspr \
     at-spi2-atk \
     libdrm \
     libxkbcommon \
     at-spi2-core \
     libx11 \
     libxcb \
     xvfb \
     dbus \
     ttf-liberation \
     font-noto-emoji

   USER node