// tools/fetch_signs_sa.js
const axios = require('axios');
const cheerio = require('cheerio');
const fs = require('fs');
const path = require('path');

// Base URL of SA Sign Index
const baseUrl = 'https://signindex.dit.sa.gov.au';

// Save paths
const imageDir = path.join(__dirname, '../frontend/public/assets/images/signs');
const metadataPath = path.join(__dirname, '../backend/database/signs_metadata.json');

// Ensure output directories exist
if (!fs.existsSync(imageDir)) fs.mkdirSync(imageDir, { recursive: true });

// Helper to download an image
async function downloadImage(url, filename) {
    const filePath = path.join(imageDir, filename);
    const writer = fs.createWriteStream(filePath);

    const response = await axios({
        url,
        method: 'GET',
        responseType: 'stream'
    });

    response.data.pipe(writer);

    return new Promise((resolve, reject) => {
        writer.on('finish', () => {
            console.log('✅ Downloaded:', filename);
            resolve();
        });
        writer.on('error', reject);
    });
}

// Main scraper function
async function fetchSigns() {
    const mainPage = await axios.get(baseUrl);
    const $ = cheerio.load(mainPage.data);
    const signLinks = [];

    $('a').each((i, elem) => {
        const href = $(elem).attr('href');
        if (href && href.startsWith('/Signs/View/')) {
            signLinks.push(`${baseUrl}${href}`);
        }
    });

    const signs = [];

    for (let url of signLinks) {
        try {
            const res = await axios.get(url);
            const $$ = cheerio.load(res.data);

            const code = $$('.display-4').text().trim();
            const desc = $$('.lead').first().text().trim();
            const imgSrc = $$('.img-fluid').attr('src');
            const fullImgUrl = `${baseUrl}${imgSrc}`;
            const fileName = `${code}.png`;

            await downloadImage(fullImgUrl, fileName);

            signs.push({ code, description: desc, image: `/assets/images/signs/${fileName}` });

        } catch (err) {
            console.error('❌ Error processing', url, err.message);
        }
    }

    fs.writeFileSync(metadataPath, JSON.stringify(signs, null, 2));
    console.log('✅ Metadata saved to:', metadataPath);
}

fetchSigns().catch(err => {
    console.error('❌ Scraper failed:', err.message);
});