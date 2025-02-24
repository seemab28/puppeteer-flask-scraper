# --- STAGE 1: Node.js Scraper ---
FROM node:18-slim AS scraper

# Install dependencies for Puppeteer
RUN apt-get update && apt-get install -y \
    chromium \
    fonts-liberation \
    libappindicator3-1 \
    libasound2 \
    libatk-bridge2.0-0 \
    libatk1.0-0 \
    libcups2 \
    libdbus-1-3 \
    libgbm1 \
    libgtk-3-0 \
    libnspr4 \
    libnss3 \
    libx11-xcb1 \
    libxcomposite1 \
    libxdamage1 \
    libxfixes3 \
    libxrandr2 \
    xdg-utils \
    && rm -rf /var/lib/apt/lists/*

# Set environment variable to use system Chromium
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true \
    PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium

# Create app directory
WORKDIR /app

# Copy files
COPY package.json package-lock.json ./
RUN npm install
COPY scrape.js ./

# Run scraper
ENV SCRAPE_URL=https://example.com
RUN node scrape.js

# --- STAGE 2: Python Flask Server ---
FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Copy necessary files from the scraper stage
COPY --from=scraper /app/scraped_data.json .
COPY server.py .
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose Flask server port
EXPOSE 5000

# Run the Flask server
CMD ["python", "server.py"]
