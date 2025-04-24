// tools/fetch_signs_sa_puppeteer.js
const fs = require('fs');
const path = require('path');
const puppeteer = require('puppeteer');

const baseUrl = 'https://signindex.dit.sa.gov.au/signs?matchAll=false';
const imageDir = path.join(__dirname, '../frontend/public/assets/images/signs');
const metadataPath = path.join(__dirname, '../backend/database/signs_metadata.json');

if (!fs.existsSync(imageDir)) fs.mkdirSync(imageDir, { recursive: true });

(async () => {
    const browser = await puppeteer.launch({ headless: false, defaultViewport: null });
    const page = await browser.newPage();
    const signs = [];

    console.log('🌐 Navigating to SA Sign Index search page...');
    await page.goto(baseUrl, { waitUntil: 'domcontentloaded' });

    // ✅ Click the "Search" button
    await page.waitForSelector('button[type="submit"]');
    await page.click('button[type="submit"]');
    console.log('🔘 Clicked search button...');

    // ✅ Wait for sign table to appear
    await page.waitForSelector('#tblResults tbody tr', { timeout: 20000 });

    const rows = await page.$$('#tblResults tbody tr');
    console.log(`📋 Found ${rows.length} signs`);

    for (const row of rows) {
        try {
            const imageEl = await row.$('td:nth-child(1) img');
            const signCodeEl = await row.$('td:nth-child(3)');
            const descEl = await row.$('td:nth-child(4)');

            const imageSrc = await (await imageEl.getProperty('src')).jsonValue();
            const signCode = (await (await signCodeEl.getProperty('textContent')).jsonValue()).trim();
            const description = (await (await descEl.getProperty('textContent')).jsonValue()).trim();

            const imageFileName = `${signCode.replace(/\\s+/g, '_')}.png`;
            const imagePath = path.join(imageDir, imageFileName);

            const viewSource = await page.goto(imageSrc);
            fs.writeFileSync(imagePath, await viewSource.buffer());
            console.log(`✅ Saved: ${imageFileName}`);

            signs.push({
                code: signCode,
                description,
                image: `/assets/images/signs/${imageFileName}`
            });
        } catch (err) {
            console.error('❌ Failed to process row:', err.message);
        }
    }

    fs.writeFileSync(metadataPath, JSON.stringify(signs, null, 2));
    console.log(`✅ Metadata saved to: ${metadataPath}`);

    await browser.close();
})();
