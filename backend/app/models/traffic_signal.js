const { DataTypes } = require('sequelize');
const sequelize = require('../config/database');

const TrafficSignal = sequelize.define('TrafficSignal', {
    location: { type: DataTypes.STRING, allowNull: false },
    status: { type: DataTypes.STRING, allowNull: false }
});

module.exports = TrafficSignal;
