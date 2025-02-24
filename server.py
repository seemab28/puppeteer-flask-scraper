from flask import Flask, jsonify
import json

app = Flask(__name__)

# Load the scraped data
def load_data():
    try:
        with open('scraped_data.json', 'r') as file:
            return json.load(file)
    except FileNotFoundError:
        return {"error": "Scraped data not found. Run the scraper first."}

@app.route('/')
def get_scraped_data():
    data = load_data()
    return jsonify(data)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)
