const puppeteer = require('puppeteer');
const fs = require('fs');

// Get URL from environment variable or default
const url = process.env.SCRAPE_URL || 'https://example.com';

(async () => {
    try {
        // Launch Puppeteer
        const browser = await puppeteer.launch({
            headless: true,
            args: ['--no-sandbox', '--disable-setuid-sandbox']
        });

        const page = await browser.newPage();
        await page.goto(url, { waitUntil: 'domcontentloaded' });

        // Extract page data
        const data = await page.evaluate(() => {
            return {
                title: document.title,
                heading: document.querySelector('h1') ? document.querySelector('h1').innerText : 'No H1 found'
            };
        });

        await browser.close();

        // Save to JSON file
        fs.writeFileSync('scraped_data.json', JSON.stringify(data, null, 2));
        console.log('Scraping complete! Data saved to scraped_data.json');

    } catch (error) {
        console.error('Error scraping:', error);
    }
})();
