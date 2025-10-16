FROM n8nio/n8n:latest
   
   USER root
   
   # Установка Chrome и зависимостей одной командой
   RUN apk add --no-cache \
       chromium \
       nss \
       freetype \
       freetype-dev \
       harfbuzz \
       ca-certificates \
       ttf-freefont
   
   # Указываем Puppeteer использовать системный Chromium
   ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
   ENV CHROMIUM_PATH=/usr/bin/chromium-browser
   
   USER node
