# Базовый образ n8n (alpine)
FROM n8nio/n8n:latest

# Переключаемся на root
USER root

# Устанавливаем системные зависимости, нужные для Puppeteer (через apk)
RUN apk add --no-cache \
    chromium \
    nss \
    freetype \
    harfbuzz \
    ca-certificates \
    ttf-freefont \
    nodejs \
    npm

# Указываем путь к chromium, чтобы Puppeteer его находил
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium

# Устанавливаем кастомные ноды глобально
RUN npm install -g \
    n8n-nodes-puppeteer \
    n8n-nodes-puppeteer-extended

# Возвращаем пользователя node (как требует n8n)
USER node

# Запускаем n8n
CMD ["n8n", "start"]
