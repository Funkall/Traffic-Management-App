const TrafficPlan = require('../models/traffic_plan');
const TrafficControlMeasure = require('../models/traffic_control_measures');
const TrafficGuidanceScheme = require('../models/traffic_guidance_scheme');

// ✅ Fetch all traffic plans
const getTrafficPlans = async (req, res) => {
    try {
        const plans = await TrafficPlan.findAll();
        res.json(plans);
    } catch (error) {
        console.error("❌ Error fetching traffic plans:", error);
        res.status(500).json({ error: "Internal Server Error" });
    }
};

// ✅ Fetch TGS for a specific plan (expanded to include AR-style data)
const getTGS = async (req, res) => {
    const { id } = req.params;
    try {
        const plan = await TrafficPlan.findByPk(id);
        if (!plan) return res.status(404).json({ error: 'Traffic Plan not found' });

        const tgsData = {
            signs: [
                { lat: -33.8690, lng: 151.2090, type: "Stop Sign" },
                { lat: -33.8692, lng: 151.2095, type: "Speed Limit" }
            ],
            cones: [
                { lat: -33.8688, lng: 151.2088 },
                { lat: -33.8687, lng: 151.2087 }
            ],
            barriers: [
                { lat: -33.8693, lng: 151.2086 }
            ],
            controllers: [
                { lat: -33.8691, lng: 151.2089, name: "Controller 1" },
                { lat: -33.8694, lng: 151.2092, name: "Controller 2" }
            ],
            controllerVehicles: [
                { lat: -33.8689, lng: 151.2094, vehicleId: "TC-VAN-01" }
            ],
            plantVehicles: [
                { lat: -33.8695, lng: 151.2084, type: "Excavator" }
            ],
            workers: [
                { lat: -33.8696, lng: 151.2091, name: "Worker A" },
                { lat: -33.8697, lng: 151.2088, name: "Worker B" }
            ],
            zone: [
                { lat: -33.869, lng: 151.208 },
                { lat: -33.8695, lng: 151.2085 },
                { lat: -33.8692, lng: 151.2092 },
                { lat: -33.8687, lng: 151.2090 }
            ]
        };

        res.json(tgsData);
    } catch (error) {
        console.error("❌ Error fetching TGS:", error);
        res.status(500).json({ error: "Internal Server Error" });
    }
};

// ✅ Fetch all control measures
const getTrafficMeasures = async (req, res) => {
    try {
        const measures = await TrafficControlMeasure.findAll();
        res.json(measures);
    } catch (error) {
        console.error("❌ Error fetching traffic control measures:", error);
        res.status(500).json({ error: "Internal Server Error" });
    }
};

// ✅ Fetch all guidance schemes
const getTrafficGuidanceSchemes = async (req, res) => {
    try {
        const schemes = await TrafficGuidanceScheme.findAll();
        res.json(schemes);
    } catch (error) {
        console.error("❌ Error fetching TGS:", error);
        res.status(500).json({ error: "Internal Server Error" });
    }
};

// ✅ Get TGS by plan ID
const getTrafficGuidanceSchemeByPlan = async (req, res) => {
    try {
        const { id } = req.params;
        const schemes = await TrafficGuidanceScheme.findAll({ where: { traffic_plan_id: id } });
        if (!schemes.length) return res.status(404).json({ error: 'No TGS found for this plan' });
        res.json(schemes);
    } catch (error) {
        console.error("❌ Error fetching TGS by plan:", error);
        res.status(500).json({ error: "Internal Server Error" });
    }
};

// ✅ Add new TGS
const addTrafficGuidanceScheme = async (req, res) => {
    try {
        const { traffic_plan_id, image_path, description } = req.body;
        const newTGS = await TrafficGuidanceScheme.create({ traffic_plan_id, image_path, description });
        res.status(201).json(newTGS);
    } catch (error) {
        console.error("❌ Error adding new TGS:", error);
        res.status(500).json({ error: "Internal Server Error" });
    }
};

module.exports = {
    getTrafficPlans,
    getTGS,
    getTrafficMeasures,
    getTrafficGuidanceSchemes,
    getTrafficGuidanceSchemeByPlan,
    addTrafficGuidanceScheme
};
