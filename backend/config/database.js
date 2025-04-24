const { Sequelize } = require('sequelize');

const sequelize = new Sequelize('traffic_management', 'root', 'Funk11278', {
    host: '127.0.0.1',
    dialect: 'mysql',
    port: 3306,
    logging: false,
    define: {
        timestamps: true
    }
});

async function testConnection() {
    try {
        await sequelize.authenticate();
        console.log('✅ Database connected successfully!');
    } catch (error) {
        console.error('❌ Database connection failed:', error);
    }
}

testConnection();

module.exports = sequelize;
