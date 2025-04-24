const { DataTypes } = require('sequelize');
const sequelize = require('../../config/database');

const TrafficGuidanceScheme = sequelize.define('traffic_guidance_scheme', {
    id: {
        type: DataTypes.INTEGER,
        autoIncrement: true,
        primaryKey: true
    },
    traffic_plan_id: {
        type: DataTypes.INTEGER,
        allowNull: false
    },
    image_path: {
        type: DataTypes.STRING,
        allowNull: false
    },
    description: {
        type: DataTypes.TEXT
    }
}, {
    timestamps: true
});

module.exports = TrafficGuidanceScheme;
