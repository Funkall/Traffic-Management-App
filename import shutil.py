import shutil

# Define the output ZIP file path
zip_file_path = mntdatatraffic_management_app.zip

# Create the directory structure and files
project_structure = {
    traffic_management_appbackendserver.js 
const express = require('express');
const cors = require('cors');
const bodyParser = require('body-parser');
const trafficRoutes = require('.approutestraffic_routes');
const userRoutes = require('.approutesuser_routes');
const incidentRoutes = require('.approutesincident_routes');

const app = express();
app.use(cors());
app.use(bodyParser.json());

app.use('apitraffic', trafficRoutes);
app.use('apiusers', userRoutes);
app.use('apiincidents', incidentRoutes);

const PORT = process.env.PORT  3000;
app.listen(PORT, () = {
    console.log(`Server running on port ${PORT}`);
});
,
    traffic_management_appbackendconfigdatabase.js 
const mysql = require('mysql2');
const dbConfig = {
    host 'localhost',
    user 'root',
    password 'password',
    database 'traffic_management'
};

const connection = mysql.createConnection(dbConfig);
connection.connect(error = {
    if (error) throw error;
    console.log('Connected to MySQL database.');
});

module.exports = connection;
,
    traffic_management_appbackendappcontrollerstraffic_signals_controller.js 
const getAllSignals = async (req, res) = {
    res.json({ message Fetching all traffic signals });
};
module.exports = { getAllSignals };
,
    traffic_management_appbackendappcontrollersincident_management_controller.js 
const getAllIncidents = async (req, res) = {
    res.json({ message Fetching all traffic incidents });
};
module.exports = { getAllIncidents };
,
    traffic_management_appbackendapproutestraffic_routes.js 
const express = require('express');
const { getAllSignals } = require('..controllerstraffic_signals_controller');
const router = express.Router();
router.get('signals', getAllSignals);
module.exports = router;
,
    traffic_management_appbackendapproutesincident_routes.js 
const express = require('express');
const { getAllIncidents } = require('..controllersincident_management_controller');
const router = express.Router();
router.get('incidents', getAllIncidents);
module.exports = router;
,
    traffic_management_appfrontendsrccomponentsMapView.js 
import React, { useEffect } from 'react';
const MapView = () = {
    useEffect(() = {
        console.log(Map component mounted);
    }, []);
    return div data-testid=map-containerMap will be displayed herediv;
};
export default MapView;
,
    traffic_management_appfrontendsrcApp.js 
import React from 'react';
import MapView from '.componentsMapView';
const App = () = {
    return (
        div
            h1Traffic Management Apph1
            MapView 
        div
    );
};
export default App;
,
    traffic_management_app.githubworkflowsci.yml 
name CI Pipeline
on [push, pull_request]

jobs
  build
    runs-on ubuntu-latest
    steps
      - name Checkout Repository
        uses actionscheckout@v3
      
      - name Setup Node.js
        uses actionssetup-node@v3
        with
          node-version '16'
      
      - name Install Dependencies
        run npm install
      
      - name Run Tests
        run npm test
,
    traffic_management_appdatabasemigrationsinit.sql 
CREATE DATABASE IF NOT EXISTS traffic_management;
USE traffic_management;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE traffic_signals (
    id INT AUTO_INCREMENT PRIMARY KEY,
    location VARCHAR(255) NOT NULL,
    status ENUM('red', 'yellow', 'green') NOT NULL
);

CREATE TABLE incidents (
    id INT AUTO_INCREMENT PRIMARY KEY,
    type VARCHAR(100) NOT NULL,
    description TEXT,
    location VARCHAR(255),
    reported_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

}

# Create directories and files
for path, content in project_structure.items()
    file_path = fmntdata{path}
    dir_path = .join(file_path.split()[-1])
    
    # Ensure the directory exists
    shutil.os.makedirs(dir_path, exist_ok=True)
    
    # Write content to the file
    with open(file_path, w) as file
        file.write(content)

# Create ZIP file
shutil.make_archive(zip_file_path.replace(.zip, ), 'zip', mntdatatraffic_management_app)

# Return the path to the ZIP file
zip_file_path
