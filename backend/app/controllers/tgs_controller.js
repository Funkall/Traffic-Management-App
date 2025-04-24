const { getSmartSignagePlan } = require('../utils/algorithm_utils');
const { getLatLngOffsets } = require('../utils/map_utils');

const generateTGS = async (req, res) => {
    try {
        const {
            location,
            roadType,
            speedLimit,
            workType,
            position,
            movementType
        } = req.body;

        if (!location || !roadType || !speedLimit || !workType || !position || !movementType) {
            return res.status(400).json({ error: 'Missing required fields in request body.' });
        }

        const tgsPlan = getSmartSignagePlan({
            location,
            roadType,
            speedLimit,
            workType,
            position,
            movementType
        });

        const placements = tgsPlan.items.map(item => {
            const offset = getLatLngOffsets(location, item.distance, item.angle);
            return {
                ...item,
                lat: offset.lat,
                lng: offset.lng,
                image: `/assets/images/signs/${item.signCode || item.type}.png`
            };
        });

        return res.json({
            baseLocation: location,
            placements,
            editable: true
        });

    } catch (error) {
        console.error('❌ Error generating TGS:', error);
        return res.status(500).json({ error: 'Internal Server Error' });
    }
};

module.exports = {
    generateTGS
};