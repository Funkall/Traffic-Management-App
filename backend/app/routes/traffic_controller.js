const trafficRoutes = require('./app/routes/traffic_routes');
app.use('/api', trafficRoutes); // This connects traffic_routes.js to the server

const TrafficPlan = require('../models/traffic_plan'); // Ensure this model exists

const getTGS = async (req, res) => {
    const { id } = req.params;

    try {
        const trafficPlan = await TrafficPlan.findByPk(id);
        if (!trafficPlan) {
            return res.status(404).json({ error: 'Traffic Plan not found' });
        }

        // Mock function to generate TGS based on Austroads rules
        const tgs = generateTGS(trafficPlan);

        res.json(tgs);
    } catch (error) {
        console.error('Error fetching TGS:', error);
        res.status(500).json({ error: 'Internal Server Error' });
    }
};

module.exports = { getTGS };

// Mock function to generate TGS (to be replaced with real logic)
const generateTGS = (plan) => {
    return {
        signs: ["Roadwork Ahead", "Detour"],
        cones: 20,
        laneClosures: "Left lane closed",
        speedLimits: 40,
        markers: [
            { lat: -33.8688, lng: 151.2093, type: "Sign" },
            { lat: -33.8695, lng: 151.2100, type: "Cone" }
        ],
        zone: [
            { lat: -33.8690, lng: 151.2080 },
            { lat: -33.8695, lng: 151.2095 }
        ]
    };
};
