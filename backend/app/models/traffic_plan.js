const { DataTypes } = require('sequelize');
const sequelize = require('../../config/database');


const TrafficPlan = sequelize.define('TrafficPlan', {
    id: {
        type: DataTypes.INTEGER,
        autoIncrement: true,
        primaryKey: true,
    },
    name: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    location: {
        type: DataTypes.JSON,
        allowNull: false,
    },
    start_date: {
        type: DataTypes.DATEONLY,
        allowNull: true,
    },
    end_date: {
        type: DataTypes.DATEONLY,
        allowNull: true,
    },
    permit_approved: {  // ✅ Make sure this matches the database column name!
        type: DataTypes.BOOLEAN,
        allowNull: true,
    },
    permit_issuer: {
        type: DataTypes.STRING,
        allowNull: true,
    },
    permit_date: {
        type: DataTypes.DATEONLY,
        allowNull: true,
    },
    status: {
        type: DataTypes.ENUM('Pending', 'Approved', 'In Progress', 'Completed'),
        allowNull: true,
    }
}, {
    timestamps: true,
    tableName: 'traffic_plans'
});

module.exports = TrafficPlan;

