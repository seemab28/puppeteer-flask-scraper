﻿# Puppeteer Flask Scraper
# 🕸️ Puppeteer Flask Scraper

## 📌 Overview

This project is a **web scraper and API service** that extracts the title and heading from a webpage using **Puppeteer (Node.js)** and serves the data via a **Flask API (Python)**. The entire setup runs inside a **Docker container** for easy deployment.

---

## 📜 Features

✅ Scrapes webpage data using **Puppeteer** (Node.js).  
✅ Stores the extracted **title and heading** in `scraped_data.json`.  
✅ Serves the scraped data via a **Flask REST API**.  
✅ Uses **Docker** for seamless containerized deployment.  

---

## 🚀 Installation & Setup

### **1️⃣ Clone the Repository**
```bash
git clone https://github.com/yourusername/puppeteer-flask-scraper.git
cd puppeteer-flask-scraper

docker build -t puppeteer-flask-scraper .
docker run -p 5000:5000 puppeteer-flask-scraper

curl http://127.0.0.1:5000


📂 puppeteer-flask-scraper
├── 📄 Dockerfile          # Builds the project container
├── 📄 scrape.js           # Puppeteer script (Node.js) to scrape website data
├── 📄 server.py           # Flask API (Python) to serve scraped data
├── 📄 package.json        # Node.js dependencies
├── 📄 requirements.txt    # Python dependencies
├── 📄 scraped_data.json   # Stores extracted data
└── 📄 README.md           # Project documentation


docker run -p 5000:5000 -e SCRAPE_URL="https://yourwebsite.com" puppeteer-flask-scraper


This project is licensed under the MIT License – feel free to use and modify it.
