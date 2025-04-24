
-- Drop existing tables if they exist (for clean setup)
DROP TABLE IF EXISTS worker_protection;
DROP TABLE IF EXISTS speed_management;
DROP TABLE IF EXISTS traffic_barriers;
DROP TABLE IF EXISTS road_closures;
DROP TABLE IF EXISTS traffic_devices;
DROP TABLE IF EXISTS traffic_signs;
DROP TABLE IF EXISTS traffic_plans;

-- Create `traffic_plans` table (Main traffic management plan details)
CREATE TABLE traffic_plans (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    location JSON NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    permit_approved BOOLEAN DEFAULT FALSE,
    permit_issuer VARCHAR(255),
    permit_date DATE,
    status ENUM('Pending', 'Approved', 'In Progress', 'Completed') DEFAULT 'Pending',
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Create `traffic_signs` table (Signs used in traffic management)
CREATE TABLE traffic_signs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    plan_id INT,
    type ENUM('Regulatory', 'Warning', 'Guide') NOT NULL,
    description VARCHAR(255) NOT NULL,
    location JSON NOT NULL,
    sign_structure ENUM('Single-Frame', 'Multi-Frame', 'Swing Frame') NOT NULL,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (plan_id) REFERENCES traffic_plans(id) ON DELETE CASCADE
);

-- Create `traffic_devices` table (Electronic and control devices)
CREATE TABLE traffic_devices (
    id INT AUTO_INCREMENT PRIMARY KEY,
    plan_id INT,
    device_type ENUM('E-Stop', 'Portable Signal', 'Boom Barrier', 'Speed Hump', 'Speed Limit Sign') NOT NULL,
    location JSON NOT NULL,
    status ENUM('Deployed', 'Pending', 'Removed') DEFAULT 'Pending',
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (plan_id) REFERENCES traffic_plans(id) ON DELETE CASCADE
);

-- Create `road_closures` table (Tracks road/lane closures & detours)
CREATE TABLE road_closures (
    id INT AUTO_INCREMENT PRIMARY KEY,
    plan_id INT,
    type ENUM('Full Road', 'Lane', 'Shoulder', 'Footpath') NOT NULL,
    closure_start DATETIME NOT NULL,
    closure_end DATETIME NOT NULL,
    detour_route JSON,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (plan_id) REFERENCES traffic_plans(id) ON DELETE CASCADE
);

-- Create `traffic_barriers` table (Tracks barriers used in traffic management)
CREATE TABLE traffic_barriers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    plan_id INT,
    barrier_type ENUM('Traffic Cone', 'Bollard', 'Water-Filled', 'Steel', 'Pedestrian Barrier') NOT NULL,
    location JSON NOT NULL,
    quantity INT NOT NULL DEFAULT 1,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (plan_id) REFERENCES traffic_plans(id) ON DELETE CASCADE
);

-- Create `speed_management` table (Speed-related measures for road safety)
CREATE TABLE speed_management (
    id INT AUTO_INCREMENT PRIMARY KEY,
    plan_id INT,
    type ENUM('Speed Limit', 'Speed Hump', 'Pavement Marking') NOT NULL,
    speed_limit INT DEFAULT NULL,
    location JSON NOT NULL,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (plan_id) REFERENCES traffic_plans(id) ON DELETE CASCADE
);

-- Create `worker_protection` table (Safety measures for workers on-site)
CREATE TABLE worker_protection (
    id INT AUTO_INCREMENT PRIMARY KEY,
    plan_id INT,
    protection_type ENUM('E-Stop', 'TMA', 'Flashing Lights', 'High-Visibility Barriers') NOT NULL,
    location JSON NOT NULL,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (plan_id) REFERENCES traffic_plans(id) ON DELETE CASCADE
);
