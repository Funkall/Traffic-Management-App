const Incident = require('../models/incident');

exports.reportIncident = async (req, res) => {
    try {
        const { location, description, severity } = req.body;
        const newIncident = await Incident.create({ location, description, severity });
        res.status(201).json(newIncident);
    } catch (error) {
        res.status(500).json({ error: 'Failed to report incident' });
    }
};
