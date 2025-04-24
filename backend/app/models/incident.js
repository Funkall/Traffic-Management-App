const { DataTypes } = require('sequelize');
const sequelize = require('../config/database');

const Incident = sequelize.define('Incident', {
    location: { type: DataTypes.STRING, allowNull: false },
    description: { type: DataTypes.TEXT, allowNull: false },
    severity: { type: DataTypes.ENUM('low', 'medium', 'high'), allowNull: false },
});

module.exports = Incident;
