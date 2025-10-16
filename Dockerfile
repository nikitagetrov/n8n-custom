# Базовый образ
FROM n8nio/n8n:latest

# Переключаемся на root для установки зависимостей
USER root

# Устанавливаем системные зависимости для Puppeteer / Playwright
RUN apt-get update && apt-get install -y \
    ca-certificates \
    fonts-liberation \
    libasound2 \
    libatk-bridge2.0-0 \
    libatk1.0-0 \
    libcups2 \
    libdrm2 \
    libgbm1 \
    libxcomposite1 \
    libxdamage1 \
    libxfixes3 \
    libxrandr2 \
    libxkbcommon0 \
    libxshmfence1 \
    libx11-xcb1 \
    wget \
    gnupg \
    --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

# Устанавливаем Chromium (легковесный вариант)
RUN apt-get update && apt-get install -y chromium

# Устанавливаем кастомные ноды глобально
# (пример: puppeteer, proxy, telegram и т.д.)
RUN npm install -g \
    n8n-nodes-puppeteer \
    n8n-nodes-puppeteer-extended

# Меняем пользователя обратно
USER node

