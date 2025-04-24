const fs = require('fs');
const path = require('path');

const signsPath = path.join(__dirname, '../data/traffic_signs.json');
const placementPath = path.join(__dirname, '../data/traffic_signs_placement.json');

function loadSigns() {
    try {
        const data = fs.readFileSync(signsPath, 'utf-8');
        return JSON.parse(data);
    } catch (error) {
        console.error('❌ Failed to load signs:', error);
        return [];
    }
}

function loadPlacementRules() {
    try {
        const data = fs.readFileSync(placementPath, 'utf-8');
        return JSON.parse(data);
    } catch (error) {
        console.error('❌ Failed to load placement rules:', error);
        return [];
    }
}

module.exports = { loadSigns, loadPlacementRules };
