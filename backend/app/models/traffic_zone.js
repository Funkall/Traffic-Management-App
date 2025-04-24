const { DataTypes } = require('sequelize');
const sequelize = require('../config/database');

const TrafficZone = sequelize.define('TrafficZone', {
    location: { type: DataTypes.STRING, allowNull: false },
    start_time: { type: DataTypes.DATE, allowNull: false },
    end_time: { type: DataTypes.DATE, allowNull: false },
});

module.exports = TrafficZone;
