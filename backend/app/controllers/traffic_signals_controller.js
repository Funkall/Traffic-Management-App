const TrafficSignal = require('../models/traffic_signal'); // Ensure you have a separate model

exports.getTrafficSignals = async (req, res) => {
    try {
        const signals = await TrafficSignal.findAll();
        res.status(200).json(signals);
    } catch (error) {
        res.status(500).json({ error: 'Failed to fetch traffic signals' });
    }
};

exports.updateTrafficSignal = async (req, res) => {
    try {
        const { id } = req.params;
        const { location, status } = req.body;
        const signal = await TrafficSignal.update({ location, status }, { where: { id } });
        res.status(200).json(signal);
    } catch (error) {
        res.status(500).json({ error: 'Failed to update traffic signal' });
    }
};

exports.deleteTrafficSignal = async (req, res) => {
    try {
        const { id } = req.params;
        await TrafficSignal.destroy({ where: { id } });
        res.status(200).json({ message: 'Traffic signal deleted successfully' });
    } catch (error) {
        res.status(500).json({ error: 'Failed to delete traffic signal' });
    }
};
