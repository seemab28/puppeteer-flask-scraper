# 🕸️ Puppeteer Flask Scraper  

## 📌 Overview  

This project is a **web scraper and API service** that extracts the title and heading from a webpage using **Puppeteer (Node.js)** and serves the data via a **Flask API (Python)**. The entire setup runs inside a **Docker container** for easy deployment.  

## 📜 Features  

✅ Scrapes webpage data using **Puppeteer** (Node.js).  
✅ Stores the extracted **title and heading** in `scraped_data.json`.  
✅ Serves the scraped data via a **Flask REST API**.  
✅ Uses **Docker** for seamless containerized deployment.  

## 🚀 Installation & Setup  

### 1️⃣ Clone the Repository  
```bash
git clone https://github.com/yourusername/puppeteer-flask-scraper.git
cd puppeteer-flask-scraper
```

### 2️⃣ Install Dependencies  
Ensure you have **Node.js, Python, and Docker** installed.  

#### 📌 Install Node.js Dependencies  
```bash
npm install
```

#### 📌 Install Python Dependencies  
```bash
pip install -r requirements.txt
```

## 🏗️ How It Works  

1. The **Puppeteer script (`scrape.js`)** opens a webpage, extracts the **title** and **heading**, and stores it in `scraped_data.json`.  
2. The **Flask server (`server.py`)** reads the `scraped_data.json` and serves the extracted data via a REST API at `http://localhost:5000`.  
3. The whole system is **containerized using Docker** for easy deployment.  

## ▶️ Running the Application  

### 1️⃣ Run Puppeteer Scraper (Extracts Data)  
```bash
node scrape.js
```

### 2️⃣ Start Flask API (Serves Data)  
```bash
python server.py
```

### 3️⃣ Access API Output  
Once the server is running, open your browser or use **cURL/Postman** to access:  
🔗 `http://127.0.0.1:5000`  

Expected JSON output:  
```json
{
  "heading": "Example Domain",
  "title": "Example Domain"
}
```

## 🐳 Running with Docker  

### 1️⃣ Build the Docker Image  
```bash
docker build -t puppeteer-flask-scraper .
```

### 2️⃣ Run the Container  
```bash
docker run -p 5000:5000 puppeteer-flask-scraper
```

### 3️⃣ Access the API  
Open `http://127.0.0.1:5000` in a browser or use Postman to check the output.

## 📂 Project Structure  

```
puppeteer-flask-scraper/
│── scrape.js         # Puppeteer script for scraping
│── server.py         # Flask API server
│── requirements.txt  # Python dependencies
│── scraped_data.json # JSON file storing scraped data
│── Dockerfile        # Docker container setup
│── README.md         # Project documentation
│── package.json      # Node.js dependencies
└── .gitignore        # Git ignore file
```

## 🛠️ Technologies Used  

- **Node.js & Puppeteer** → Web scraping  
- **Python & Flask** → REST API  
- **Docker** → Containerization  
- **GitHub** → Version Control  

## 📌 Future Improvements  

🚀 Add support for **dynamic website scraping**  
🚀 Implement **database storage** instead of JSON  
🚀 Add **UI Dashboard** for viewing scraped data  

## 🤝 Contributing  

Feel free to fork the repo and submit a PR! 💡  

## 📄 License  

This project is **open-source** and available under the **MIT License**.  
