
const TrafficGuidanceScheme = require('../models/traffic_guidance_scheme');

// ✅ Fetch all TGS entries
const getAllSchemes = async (req, res) => {
    try {
        const schemes = await TrafficGuidanceScheme.findAll();
        res.json(schemes);
    } catch (error) {
        console.error("❌ Error fetching schemes:", error);
        res.status(500).json({ error: "Internal Server Error" });
    }
};

// ✅ Add new TGS entry
const createScheme = async (req, res) => {
    try {
        const { traffic_plan_id, image_path, description } = req.body;
        const newScheme = await TrafficGuidanceScheme.create({ traffic_plan_id, image_path, description });
        res.status(201).json(newScheme);
    } catch (error) {
        console.error("❌ Error creating scheme:", error);
        res.status(500).json({ error: "Internal Server Error" });
    }
};

module.exports = {
    getAllSchemes,
    createScheme
};
