@echo off
echo Starting the Traffic Management App setup...

:: Step 1: Check Node.js installation
where node
IF %ERRORLEVEL% NEQ 0 (
    echo Node.js not found. Please install Node.js manually from https://nodejs.org
    exit /b
)

:: Step 2: Check MySQL installation
where mysql
IF %ERRORLEVEL% NEQ 0 (
    echo MySQL not found. Please install MySQL manually from https://dev.mysql.com/downloads/mysql/
    exit /b
)

:: Step 3: Install backend dependencies
echo Installing backend dependencies...
cd backend
npm install

:: Step 4: Install frontend dependencies
echo Installing frontend dependencies...
cd ../frontend
npm install

:: Step 5: Configure environment variables
echo Configuring environment variables...
cd ../config
if not exist env_variables.json (
    echo Creating environment variables file...
    echo { > env_variables.json
    echo     "PORT": 3000, >> env_variables.json
    echo     "DB_HOST": "localhost", >> env_variables.json
    echo     "DB_USER": "root", >> env_variables.json
    echo     "DB_PASSWORD": "password", >> env_variables.json
    echo     "DB_NAME": "traffic_management", >> env_variables.json
    echo     "GOOGLE_MAPS_API_KEY": "your-google-maps-api-key" >> env_variables.json
    echo } >> env_variables.json
) else (
    echo Environment variables file already exists.
)

:: Step 6: Initialize database
echo Initializing database...
cd ../database
mysql -u root -p -e "CREATE DATABASE IF NOT EXISTS traffic_management;"
mysql -u root -p traffic_management < schema.sql

:: Step 7: Start the app
echo Starting the backend server...
cd ../backend
start cmd /k "npm start"

echo Starting the frontend app...
cd ../frontend
start cmd /k "npm start"

echo Setup complete! The Traffic Management App is running.
pause

# Step 7: Run Seeder
echo "Seeding database with sample data..."
cd backend/database/seeders
node seed.js

# Step 8: Run Tests
echo "Running backend tests..."
cd ../../
npm test

echo "Running frontend tests..."
cd ../../frontend
npm test

