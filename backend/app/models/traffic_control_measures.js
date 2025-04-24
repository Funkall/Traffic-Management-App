const { DataTypes } = require('sequelize');
const sequelize = require('../../config/database');

const TrafficControlMeasure = sequelize.define('TrafficControlMeasure', {
    id: {
        type: DataTypes.INTEGER,
        autoIncrement: true,
        primaryKey: true
    },
    name: {
        type: DataTypes.STRING,
        allowNull: false
    },
    type: {
        type: DataTypes.ENUM('Sign', 'Barrier', 'Signal', 'Road Closure', 'Speed Management', 'Worker Protection'),
        allowNull: false
    },
    description: {
        type: DataTypes.TEXT,
        allowNull: true
    },
    usage_conditions: {
        type: DataTypes.TEXT,
        allowNull: true
    }
}, {
    timestamps: true,
    tableName: 'traffic_control_measures' // ✅ Ensure this matches your DB table name
});

module.exports = TrafficControlMeasure;
