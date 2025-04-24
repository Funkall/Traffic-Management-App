const path = require('path');
const fs = require('fs');

const signsData = JSON.parse(fs.readFileSync(path.join(__dirname, '../data/traffic_signs.json')));
const placementRules = JSON.parse(fs.readFileSync(path.join(__dirname, '../data/traffic_signs_placement.json')));

exports.getAllSigns = (req, res) => {
    const signsWithRules = signsData.map(sign => ({
        ...sign,
        placement_rules: placementRules[sign.code] || []
    }));
    res.json(signsWithRules);
};

exports.getSignByCode = (req, res) => {
    const { code } = req.params;
    const sign = signsData.find(s => s.code === code);
    if (!sign) {
        return res.status(404).json({ error: 'Sign not found' });
    }
    const rules = placementRules[code] || [];
    res.json({ ...sign, placement_rules: rules });
};
