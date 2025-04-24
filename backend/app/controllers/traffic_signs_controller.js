const { trafficSigns } = require('../utils/sign_utils');

const getAllSigns = (req, res) => {
    res.json(trafficSigns);
};

module.exports = { getAllSigns };
