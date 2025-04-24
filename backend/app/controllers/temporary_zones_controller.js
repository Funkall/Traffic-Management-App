const TemporaryZone = require('../models/traffic_zone');

exports.getTemporaryZones = async (req, res) => {
    try {
        const zones = await TemporaryZone.findAll();
        res.status(200).json(zones);
    } catch (error) {
        res.status(500).json({ error: 'Failed to fetch temporary zones' });
    }
};

exports.deleteTemporaryZone = async (req, res) => {
    try {
        const { id } = req.params;
        await TemporaryZone.destroy({ where: { id } });
        res.status(200).json({ message: 'Temporary zone deleted successfully' });
    } catch (error) {
        res.status(500).json({ error: 'Failed to delete temporary zone' });
    }
};
