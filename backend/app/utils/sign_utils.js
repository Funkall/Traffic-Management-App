const path = require('path');
const fs = require('fs');

// ✅ Corrected path to JSON file in /data/
const signsPath = path.join(__dirname, '../data/traffic_signs.json');

// Load and parse the sign dataset
let trafficSigns = [];
try {
    const rawData = fs.readFileSync(signsPath);
    trafficSigns = JSON.parse(rawData);
    console.log(`✅ Loaded ${trafficSigns.length} traffic signs`);
} catch (error) {
    console.error("❌ Failed to load traffic sign dataset:", error);
}

// Optional: Search by sign code
function findSignByCode(code) {
    return trafficSigns.find(sign => sign.code === code.toUpperCase());
}

// Export for use elsewhere
module.exports = {
    trafficSigns,
    findSignByCode
};
