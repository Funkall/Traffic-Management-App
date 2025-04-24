require('dotenv').config({ path: __dirname + '/.env' });

const express = require('express');
const cors = require('cors');
const bodyParser = require('body-parser');
const sequelize = require('./config/database');
const errorHandler = require('./app/middlewares/error_handler');

const trafficRoutes = require('./app/routes/traffic_routes');
const userRoutes = require('./app/routes/user_routes');
const signRoutes = require('./app/routes/sign_routes'); // ✅ Add sign API route

const app = express();
const PORT = process.env.PORT || 3000;

app.use(cors());
app.use(bodyParser.json());

app.use((req, res, next) => {
    console.log(`📡 Received ${req.method} request to: ${req.url}`);
    next();
});

app.get("/", (req, res) => {
    res.send("🚦 Traffic Management API is Running!");
});

app.use('/api', trafficRoutes);
app.use('/api', userRoutes);
app.use('/api', signRoutes); // ✅ Sign route included

app.use(errorHandler);

app.listen(PORT, () => {
    console.log(`✅ Server is running on port ${PORT}`);
});

sequelize.authenticate()
    .then(() => console.log('✅ Database connected successfully!'))
    .catch(err => {
        console.error('❌ Database connection failed:', err);
        process.exit(1);
    });
