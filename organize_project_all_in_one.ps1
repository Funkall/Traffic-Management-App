$base = "C:\Users\adams\Dropbox\traffic-management-app"

Set-Location $base

# ===== 1. Backup Section =====
$backupPath = "$base\__backup_$(Get-Date -Format 'yyyyMMdd_HHmmss')"
New-Item -ItemType Directory -Path $backupPath -Force
Copy-Item -Path $base\* -Destination $backupPath -Recurse -Force
Write-Output "✅ Backup completed to $backupPath"

# ===== 2. Ensure Required Folders =====
New-Item -ItemType Directory -Force -Path "$base\backend\app\controllers"
New-Item -ItemType Directory -Force -Path "$base\backend\app\models"
New-Item -ItemType Directory -Force -Path "$base\backend\app\routes"
New-Item -ItemType Directory -Force -Path "$base\backend\app\middlewares"
New-Item -ItemType Directory -Force -Path "$base\backend\app\utils"
New-Item -ItemType Directory -Force -Path "$base\backend\config"
New-Item -ItemType Directory -Force -Path "$base\backend\database\migrations"
New-Item -ItemType Directory -Force -Path "$base\backend\database\seeders"
New-Item -ItemType Directory -Force -Path "$base\frontend\public\assets\icons"
New-Item -ItemType Directory -Force -Path "$base\frontend\public\assets\images"
New-Item -ItemType Directory -Force -Path "$base\frontend\src\components"
New-Item -ItemType Directory -Force -Path "$base\frontend\src\pages"
New-Item -ItemType Directory -Force -Path "$base\frontend\src\utils"
New-Item -ItemType Directory -Force -Path "$base\frontend\src\styles"
New-Item -ItemType Directory -Force -Path "$base\docs\diagrams"
New-Item -ItemType Directory -Force -Path "$base\config"
New-Item -ItemType Directory -Force -Path "$base\database"

# ===== 3. Move Files =====


$found = Get-ChildItem -Path $base -Recurse -Filter "MapView.js" -File -ErrorAction SilentlyContinue | Select-Object -First 1
if ($found) {
    Move-Item -Path $found.FullName -Destination "$base\frontend\src\components\MapView.js" -Force
    Write-Output "✅ Moved MapView.js to frontend\src\components"
} else {
    Write-Output "⚠️ MapView.js not found"
}

$found = Get-ChildItem -Path $base -Recurse -Filter "TrafficControl.js" -File -ErrorAction SilentlyContinue | Select-Object -First 1
if ($found) {
    Move-Item -Path $found.FullName -Destination "$base\frontend\src\components\TrafficControl.js" -Force
    Write-Output "✅ Moved TrafficControl.js to frontend\src\components"
} else {
    Write-Output "⚠️ TrafficControl.js not found"
}

$found = Get-ChildItem -Path $base -Recurse -Filter "UserProfile.js" -File -ErrorAction SilentlyContinue | Select-Object -First 1
if ($found) {
    Move-Item -Path $found.FullName -Destination "$base\frontend\src\components\UserProfile.js" -Force
    Write-Output "✅ Moved UserProfile.js to frontend\src\components"
} else {
    Write-Output "⚠️ UserProfile.js not found"
}

$found = Get-ChildItem -Path $base -Recurse -Filter "Dashboard.js" -File -ErrorAction SilentlyContinue | Select-Object -First 1
if ($found) {
    Move-Item -Path $found.FullName -Destination "$base\frontend\src\pages\Dashboard.js" -Force
    Write-Output "✅ Moved Dashboard.js to frontend\src\pages"
} else {
    Write-Output "⚠️ Dashboard.js not found"
}

$found = Get-ChildItem -Path $base -Recurse -Filter "IncidentManagement.js" -File -ErrorAction SilentlyContinue | Select-Object -First 1
if ($found) {
    Move-Item -Path $found.FullName -Destination "$base\frontend\src\pages\IncidentManagement.js" -Force
    Write-Output "✅ Moved IncidentManagement.js to frontend\src\pages"
} else {
    Write-Output "⚠️ IncidentManagement.js not found"
}

$found = Get-ChildItem -Path $base -Recurse -Filter "TemporaryZones.js" -File -ErrorAction SilentlyContinue | Select-Object -First 1
if ($found) {
    Move-Item -Path $found.FullName -Destination "$base\frontend\src\pages\TemporaryZones.js" -Force
    Write-Output "✅ Moved TemporaryZones.js to frontend\src\pages"
} else {
    Write-Output "⚠️ TemporaryZones.js not found"
}

$found = Get-ChildItem -Path $base -Recurse -Filter "mapUtils.js" -File -ErrorAction SilentlyContinue | Select-Object -First 1
if ($found) {
    Move-Item -Path $found.FullName -Destination "$base\frontend\src\utils\mapUtils.js" -Force
    Write-Output "✅ Moved mapUtils.js to frontend\src\utils"
} else {
    Write-Output "⚠️ mapUtils.js not found"
}

$found = Get-ChildItem -Path $base -Recurse -Filter "main.css" -File -ErrorAction SilentlyContinue | Select-Object -First 1
if ($found) {
    Move-Item -Path $found.FullName -Destination "$base\frontend\src\styles\main.css" -Force
    Write-Output "✅ Moved main.css to frontend\src\styles"
} else {
    Write-Output "⚠️ main.css not found"
}

$found = Get-ChildItem -Path $base -Recurse -Filter "App.js" -File -ErrorAction SilentlyContinue | Select-Object -First 1
if ($found) {
    Move-Item -Path $found.FullName -Destination "$base\frontend\src\App.js" -Force
    Write-Output "✅ Moved App.js to frontend\src"
} else {
    Write-Output "⚠️ App.js not found"
}

$found = Get-ChildItem -Path $base -Recurse -Filter "index.js" -File -ErrorAction SilentlyContinue | Select-Object -First 1
if ($found) {
    Move-Item -Path $found.FullName -Destination "$base\frontend\src\index.js" -Force
    Write-Output "✅ Moved index.js to frontend\src"
} else {
    Write-Output "⚠️ index.js not found"
}

$found = Get-ChildItem -Path $base -Recurse -Filter "index.html" -File -ErrorAction SilentlyContinue | Select-Object -First 1
if ($found) {
    Move-Item -Path $found.FullName -Destination "$base\frontend\public\index.html" -Force
    Write-Output "✅ Moved index.html to frontend\public"
} else {
    Write-Output "⚠️ index.html not found"
}

$found = Get-ChildItem -Path $base -Recurse -Filter "package.json" -File -ErrorAction SilentlyContinue | Select-Object -First 1
if ($found) {
    Move-Item -Path $found.FullName -Destination "$base\frontend\package.json" -Force
    Write-Output "✅ Moved package.json to frontend"
} else {
    Write-Output "⚠️ package.json not found"
}

$found = Get-ChildItem -Path $base -Recurse -Filter ".env" -File -ErrorAction SilentlyContinue | Select-Object -First 1
if ($found) {
    Move-Item -Path $found.FullName -Destination "$base\frontend\.env" -Force
    Write-Output "✅ Moved .env to frontend"
} else {
    Write-Output "⚠️ .env not found"
}

$found = Get-ChildItem -Path $base -Recurse -Filter "traffic_signals_controller.js" -File -ErrorAction SilentlyContinue | Select-Object -First 1
if ($found) {
    Move-Item -Path $found.FullName -Destination "$base\backend\app\controllers\traffic_signals_controller.js" -Force
    Write-Output "✅ Moved traffic_signals_controller.js to backend\app\controllers"
} else {
    Write-Output "⚠️ traffic_signals_controller.js not found"
}

$found = Get-ChildItem -Path $base -Recurse -Filter "temporary_zones_controller.js" -File -ErrorAction SilentlyContinue | Select-Object -First 1
if ($found) {
    Move-Item -Path $found.FullName -Destination "$base\backend\app\controllers\temporary_zones_controller.js" -Force
    Write-Output "✅ Moved temporary_zones_controller.js to backend\app\controllers"
} else {
    Write-Output "⚠️ temporary_zones_controller.js not found"
}

$found = Get-ChildItem -Path $base -Recurse -Filter "incident_management_controller.js" -File -ErrorAction SilentlyContinue | Select-Object -First 1
if ($found) {
    Move-Item -Path $found.FullName -Destination "$base\backend\app\controllers\incident_management_controller.js" -Force
    Write-Output "✅ Moved incident_management_controller.js to backend\app\controllers"
} else {
    Write-Output "⚠️ incident_management_controller.js not found"
}

$found = Get-ChildItem -Path $base -Recurse -Filter "traffic_guidance_schemes_controller.js" -File -ErrorAction SilentlyContinue | Select-Object -First 1
if ($found) {
    Move-Item -Path $found.FullName -Destination "$base\backend\app\controllers\traffic_guidance_schemes_controller.js" -Force
    Write-Output "✅ Moved traffic_guidance_schemes_controller.js to backend\app\controllers"
} else {
    Write-Output "⚠️ traffic_guidance_schemes_controller.js not found"
}

$found = Get-ChildItem -Path $base -Recurse -Filter "traffic_plans_controller.js" -File -ErrorAction SilentlyContinue | Select-Object -First 1
if ($found) {
    Move-Item -Path $found.FullName -Destination "$base\backend\app\controllers\traffic_plans_controller.js" -Force
    Write-Output "✅ Moved traffic_plans_controller.js to backend\app\controllers"
} else {
    Write-Output "⚠️ traffic_plans_controller.js not found"
}

$found = Get-ChildItem -Path $base -Recurse -Filter "user.js" -File -ErrorAction SilentlyContinue | Select-Object -First 1
if ($found) {
    Move-Item -Path $found.FullName -Destination "$base\backend\app\models\user.js" -Force
    Write-Output "✅ Moved user.js to backend\app\models"
} else {
    Write-Output "⚠️ user.js not found"
}

$found = Get-ChildItem -Path $base -Recurse -Filter "traffic_zone.js" -File -ErrorAction SilentlyContinue | Select-Object -First 1
if ($found) {
    Move-Item -Path $found.FullName -Destination "$base\backend\app\models\traffic_zone.js" -Force
    Write-Output "✅ Moved traffic_zone.js to backend\app\models"
} else {
    Write-Output "⚠️ traffic_zone.js not found"
}

$found = Get-ChildItem -Path $base -Recurse -Filter "incident.js" -File -ErrorAction SilentlyContinue | Select-Object -First 1
if ($found) {
    Move-Item -Path $found.FullName -Destination "$base\backend\app\models\incident.js" -Force
    Write-Output "✅ Moved incident.js to backend\app\models"
} else {
    Write-Output "⚠️ incident.js not found"
}

$found = Get-ChildItem -Path $base -Recurse -Filter "traffic_guidance_scheme.js" -File -ErrorAction SilentlyContinue | Select-Object -First 1
if ($found) {
    Move-Item -Path $found.FullName -Destination "$base\backend\app\models\traffic_guidance_scheme.js" -Force
    Write-Output "✅ Moved traffic_guidance_scheme.js to backend\app\models"
} else {
    Write-Output "⚠️ traffic_guidance_scheme.js not found"
}

$found = Get-ChildItem -Path $base -Recurse -Filter "traffic_control_measure.js" -File -ErrorAction SilentlyContinue | Select-Object -First 1
if ($found) {
    Move-Item -Path $found.FullName -Destination "$base\backend\app\models\traffic_control_measure.js" -Force
    Write-Output "✅ Moved traffic_control_measure.js to backend\app\models"
} else {
    Write-Output "⚠️ traffic_control_measure.js not found"
}

$found = Get-ChildItem -Path $base -Recurse -Filter "traffic_plan.js" -File -ErrorAction SilentlyContinue | Select-Object -First 1
if ($found) {
    Move-Item -Path $found.FullName -Destination "$base\backend\app\models\traffic_plan.js" -Force
    Write-Output "✅ Moved traffic_plan.js to backend\app\models"
} else {
    Write-Output "⚠️ traffic_plan.js not found"
}

$found = Get-ChildItem -Path $base -Recurse -Filter "traffic_routes.js" -File -ErrorAction SilentlyContinue | Select-Object -First 1
if ($found) {
    Move-Item -Path $found.FullName -Destination "$base\backend\app\routes\traffic_routes.js" -Force
    Write-Output "✅ Moved traffic_routes.js to backend\app\routes"
} else {
    Write-Output "⚠️ traffic_routes.js not found"
}

$found = Get-ChildItem -Path $base -Recurse -Filter "user_routes.js" -File -ErrorAction SilentlyContinue | Select-Object -First 1
if ($found) {
    Move-Item -Path $found.FullName -Destination "$base\backend\app\routes\user_routes.js" -Force
    Write-Output "✅ Moved user_routes.js to backend\app\routes"
} else {
    Write-Output "⚠️ user_routes.js not found"
}

$found = Get-ChildItem -Path $base -Recurse -Filter "incident_routes.js" -File -ErrorAction SilentlyContinue | Select-Object -First 1
if ($found) {
    Move-Item -Path $found.FullName -Destination "$base\backend\app\routes\incident_routes.js" -Force
    Write-Output "✅ Moved incident_routes.js to backend\app\routes"
} else {
    Write-Output "⚠️ incident_routes.js not found"
}

$found = Get-ChildItem -Path $base -Recurse -Filter "tgs_routes.js" -File -ErrorAction SilentlyContinue | Select-Object -First 1
if ($found) {
    Move-Item -Path $found.FullName -Destination "$base\backend\app\routes\tgs_routes.js" -Force
    Write-Output "✅ Moved tgs_routes.js to backend\app\routes"
} else {
    Write-Output "⚠️ tgs_routes.js not found"
}

$found = Get-ChildItem -Path $base -Recurse -Filter "tmp_routes.js" -File -ErrorAction SilentlyContinue | Select-Object -First 1
if ($found) {
    Move-Item -Path $found.FullName -Destination "$base\backend\app\routes\tmp_routes.js" -Force
    Write-Output "✅ Moved tmp_routes.js to backend\app\routes"
} else {
    Write-Output "⚠️ tmp_routes.js not found"
}

$found = Get-ChildItem -Path $base -Recurse -Filter "auth_middleware.js" -File -ErrorAction SilentlyContinue | Select-Object -First 1
if ($found) {
    Move-Item -Path $found.FullName -Destination "$base\backend\app\middlewares\auth_middleware.js" -Force
    Write-Output "✅ Moved auth_middleware.js to backend\app\middlewares"
} else {
    Write-Output "⚠️ auth_middleware.js not found"
}

$found = Get-ChildItem -Path $base -Recurse -Filter "error_handler.js" -File -ErrorAction SilentlyContinue | Select-Object -First 1
if ($found) {
    Move-Item -Path $found.FullName -Destination "$base\backend\app\middlewares\error_handler.js" -Force
    Write-Output "✅ Moved error_handler.js to backend\app\middlewares"
} else {
    Write-Output "⚠️ error_handler.js not found"
}

$found = Get-ChildItem -Path $base -Recurse -Filter "rate_limiter.js" -File -ErrorAction SilentlyContinue | Select-Object -First 1
if ($found) {
    Move-Item -Path $found.FullName -Destination "$base\backend\app\middlewares\rate_limiter.js" -Force
    Write-Output "✅ Moved rate_limiter.js to backend\app\middlewares"
} else {
    Write-Output "⚠️ rate_limiter.js not found"
}

$found = Get-ChildItem -Path $base -Recurse -Filter "request_logger.js" -File -ErrorAction SilentlyContinue | Select-Object -First 1
if ($found) {
    Move-Item -Path $found.FullName -Destination "$base\backend\app\middlewares\request_logger.js" -Force
    Write-Output "✅ Moved request_logger.js to backend\app\middlewares"
} else {
    Write-Output "⚠️ request_logger.js not found"
}

$found = Get-ChildItem -Path $base -Recurse -Filter "algorithm_utils.js" -File -ErrorAction SilentlyContinue | Select-Object -First 1
if ($found) {
    Move-Item -Path $found.FullName -Destination "$base\backend\app\utils\algorithm_utils.js" -Force
    Write-Output "✅ Moved algorithm_utils.js to backend\app\utils"
} else {
    Write-Output "⚠️ algorithm_utils.js not found"
}

$found = Get-ChildItem -Path $base -Recurse -Filter "map_utils.js" -File -ErrorAction SilentlyContinue | Select-Object -First 1
if ($found) {
    Move-Item -Path $found.FullName -Destination "$base\backend\app\utils\map_utils.js" -Force
    Write-Output "✅ Moved map_utils.js to backend\app\utils"
} else {
    Write-Output "⚠️ map_utils.js not found"
}

$found = Get-ChildItem -Path $base -Recurse -Filter "database.js" -File -ErrorAction SilentlyContinue | Select-Object -First 1
if ($found) {
    Move-Item -Path $found.FullName -Destination "$base\backend\config\database.js" -Force
    Write-Output "✅ Moved database.js to backend\config"
} else {
    Write-Output "⚠️ database.js not found"
}

$found = Get-ChildItem -Path $base -Recurse -Filter "env.js" -File -ErrorAction SilentlyContinue | Select-Object -First 1
if ($found) {
    Move-Item -Path $found.FullName -Destination "$base\backend\config\env.js" -Force
    Write-Output "✅ Moved env.js to backend\config"
} else {
    Write-Output "⚠️ env.js not found"
}

$found = Get-ChildItem -Path $base -Recurse -Filter "google_maps.js" -File -ErrorAction SilentlyContinue | Select-Object -First 1
if ($found) {
    Move-Item -Path $found.FullName -Destination "$base\backend\config\google_maps.js" -Force
    Write-Output "✅ Moved google_maps.js to backend\config"
} else {
    Write-Output "⚠️ google_maps.js not found"
}

$found = Get-ChildItem -Path $base -Recurse -Filter "schema.sql" -File -ErrorAction SilentlyContinue | Select-Object -First 1
if ($found) {
    Move-Item -Path $found.FullName -Destination "$base\backend\database\schema.sql" -Force
    Write-Output "✅ Moved schema.sql to backend\database"
} else {
    Write-Output "⚠️ schema.sql not found"
}

$found = Get-ChildItem -Path $base -Recurse -Filter "server.js" -File -ErrorAction SilentlyContinue | Select-Object -First 1
if ($found) {
    Move-Item -Path $found.FullName -Destination "$base\backend\server.js" -Force
    Write-Output "✅ Moved server.js to backend"
} else {
    Write-Output "⚠️ server.js not found"
}

$found = Get-ChildItem -Path $base -Recurse -Filter "README.md" -File -ErrorAction SilentlyContinue | Select-Object -First 1
if ($found) {
    Move-Item -Path $found.FullName -Destination "$base\docs\README.md" -Force
    Write-Output "✅ Moved README.md to docs"
} else {
    Write-Output "⚠️ README.md not found"
}

$found = Get-ChildItem -Path $base -Recurse -Filter "API_Documentation.md" -File -ErrorAction SilentlyContinue | Select-Object -First 1
if ($found) {
    Move-Item -Path $found.FullName -Destination "$base\docs\API_Documentation.md" -Force
    Write-Output "✅ Moved API_Documentation.md to docs"
} else {
    Write-Output "⚠️ API_Documentation.md not found"
}

$found = Get-ChildItem -Path $base -Recurse -Filter "Austroads_Guidelines.pdf" -File -ErrorAction SilentlyContinue | Select-Object -First 1
if ($found) {
    Move-Item -Path $found.FullName -Destination "$base\docs\Austroads_Guidelines.pdf" -Force
    Write-Output "✅ Moved Austroads_Guidelines.pdf to docs"
} else {
    Write-Output "⚠️ Austroads_Guidelines.pdf not found"
}

$found = Get-ChildItem -Path $base -Recurse -Filter "database_schema.png" -File -ErrorAction SilentlyContinue | Select-Object -First 1
if ($found) {
    Move-Item -Path $found.FullName -Destination "$base\docs\diagrams\database_schema.png" -Force
    Write-Output "✅ Moved database_schema.png to docs\diagrams"
} else {
    Write-Output "⚠️ database_schema.png not found"
}

$found = Get-ChildItem -Path $base -Recurse -Filter "system_architecture.png" -File -ErrorAction SilentlyContinue | Select-Object -First 1
if ($found) {
    Move-Item -Path $found.FullName -Destination "$base\docs\diagrams\system_architecture.png" -Force
    Write-Output "✅ Moved system_architecture.png to docs\diagrams"
} else {
    Write-Output "⚠️ system_architecture.png not found"
}

$found = Get-ChildItem -Path $base -Recurse -Filter "google_maps_api_key.json" -File -ErrorAction SilentlyContinue | Select-Object -First 1
if ($found) {
    Move-Item -Path $found.FullName -Destination "$base\config\google_maps_api_key.json" -Force
    Write-Output "✅ Moved google_maps_api_key.json to config"
} else {
    Write-Output "⚠️ google_maps_api_key.json not found"
}

$found = Get-ChildItem -Path $base -Recurse -Filter "env_variables.json" -File -ErrorAction SilentlyContinue | Select-Object -First 1
if ($found) {
    Move-Item -Path $found.FullName -Destination "$base\config\env_variables.json" -Force
    Write-Output "✅ Moved env_variables.json to config"
} else {
    Write-Output "⚠️ env_variables.json not found"
}

$found = Get-ChildItem -Path $base -Recurse -Filter "traffic_management.db" -File -ErrorAction SilentlyContinue | Select-Object -First 1
if ($found) {
    Move-Item -Path $found.FullName -Destination "$base\database\traffic_management.db" -Force
    Write-Output "✅ Moved traffic_management.db to database"
} else {
    Write-Output "⚠️ traffic_management.db not found"
}

$found = Get-ChildItem -Path $base -Recurse -Filter "db_config.sql" -File -ErrorAction SilentlyContinue | Select-Object -First 1
if ($found) {
    Move-Item -Path $found.FullName -Destination "$base\database\db_config.sql" -Force
    Write-Output "✅ Moved db_config.sql to database"
} else {
    Write-Output "⚠️ db_config.sql not found"
}

# ===== 4. File Verification =====


if (Test-Path "$base\frontend\src\components\MapView.js") {
    Write-Output "✅ MapView.js found in frontend\src\components"
} else {
    Write-Output "❌ MapView.js MISSING from frontend\src\components"
}

if (Test-Path "$base\frontend\src\components\TrafficControl.js") {
    Write-Output "✅ TrafficControl.js found in frontend\src\components"
} else {
    Write-Output "❌ TrafficControl.js MISSING from frontend\src\components"
}

if (Test-Path "$base\frontend\src\components\UserProfile.js") {
    Write-Output "✅ UserProfile.js found in frontend\src\components"
} else {
    Write-Output "❌ UserProfile.js MISSING from frontend\src\components"
}

if (Test-Path "$base\frontend\src\pages\Dashboard.js") {
    Write-Output "✅ Dashboard.js found in frontend\src\pages"
} else {
    Write-Output "❌ Dashboard.js MISSING from frontend\src\pages"
}

if (Test-Path "$base\frontend\src\pages\IncidentManagement.js") {
    Write-Output "✅ IncidentManagement.js found in frontend\src\pages"
} else {
    Write-Output "❌ IncidentManagement.js MISSING from frontend\src\pages"
}

if (Test-Path "$base\frontend\src\pages\TemporaryZones.js") {
    Write-Output "✅ TemporaryZones.js found in frontend\src\pages"
} else {
    Write-Output "❌ TemporaryZones.js MISSING from frontend\src\pages"
}

if (Test-Path "$base\frontend\src\utils\mapUtils.js") {
    Write-Output "✅ mapUtils.js found in frontend\src\utils"
} else {
    Write-Output "❌ mapUtils.js MISSING from frontend\src\utils"
}

if (Test-Path "$base\frontend\src\styles\main.css") {
    Write-Output "✅ main.css found in frontend\src\styles"
} else {
    Write-Output "❌ main.css MISSING from frontend\src\styles"
}

if (Test-Path "$base\frontend\src\App.js") {
    Write-Output "✅ App.js found in frontend\src"
} else {
    Write-Output "❌ App.js MISSING from frontend\src"
}

if (Test-Path "$base\frontend\src\index.js") {
    Write-Output "✅ index.js found in frontend\src"
} else {
    Write-Output "❌ index.js MISSING from frontend\src"
}

if (Test-Path "$base\frontend\public\index.html") {
    Write-Output "✅ index.html found in frontend\public"
} else {
    Write-Output "❌ index.html MISSING from frontend\public"
}

if (Test-Path "$base\frontend\package.json") {
    Write-Output "✅ package.json found in frontend"
} else {
    Write-Output "❌ package.json MISSING from frontend"
}

if (Test-Path "$base\frontend\.env") {
    Write-Output "✅ .env found in frontend"
} else {
    Write-Output "❌ .env MISSING from frontend"
}

if (Test-Path "$base\backend\app\controllers\traffic_signals_controller.js") {
    Write-Output "✅ traffic_signals_controller.js found in backend\app\controllers"
} else {
    Write-Output "❌ traffic_signals_controller.js MISSING from backend\app\controllers"
}

if (Test-Path "$base\backend\app\controllers\temporary_zones_controller.js") {
    Write-Output "✅ temporary_zones_controller.js found in backend\app\controllers"
} else {
    Write-Output "❌ temporary_zones_controller.js MISSING from backend\app\controllers"
}

if (Test-Path "$base\backend\app\controllers\incident_management_controller.js") {
    Write-Output "✅ incident_management_controller.js found in backend\app\controllers"
} else {
    Write-Output "❌ incident_management_controller.js MISSING from backend\app\controllers"
}

if (Test-Path "$base\backend\app\controllers\traffic_guidance_schemes_controller.js") {
    Write-Output "✅ traffic_guidance_schemes_controller.js found in backend\app\controllers"
} else {
    Write-Output "❌ traffic_guidance_schemes_controller.js MISSING from backend\app\controllers"
}

if (Test-Path "$base\backend\app\controllers\traffic_plans_controller.js") {
    Write-Output "✅ traffic_plans_controller.js found in backend\app\controllers"
} else {
    Write-Output "❌ traffic_plans_controller.js MISSING from backend\app\controllers"
}

if (Test-Path "$base\backend\app\models\user.js") {
    Write-Output "✅ user.js found in backend\app\models"
} else {
    Write-Output "❌ user.js MISSING from backend\app\models"
}

if (Test-Path "$base\backend\app\models\traffic_zone.js") {
    Write-Output "✅ traffic_zone.js found in backend\app\models"
} else {
    Write-Output "❌ traffic_zone.js MISSING from backend\app\models"
}

if (Test-Path "$base\backend\app\models\incident.js") {
    Write-Output "✅ incident.js found in backend\app\models"
} else {
    Write-Output "❌ incident.js MISSING from backend\app\models"
}

if (Test-Path "$base\backend\app\models\traffic_guidance_scheme.js") {
    Write-Output "✅ traffic_guidance_scheme.js found in backend\app\models"
} else {
    Write-Output "❌ traffic_guidance_scheme.js MISSING from backend\app\models"
}

if (Test-Path "$base\backend\app\models\traffic_control_measure.js") {
    Write-Output "✅ traffic_control_measure.js found in backend\app\models"
} else {
    Write-Output "❌ traffic_control_measure.js MISSING from backend\app\models"
}

if (Test-Path "$base\backend\app\models\traffic_plan.js") {
    Write-Output "✅ traffic_plan.js found in backend\app\models"
} else {
    Write-Output "❌ traffic_plan.js MISSING from backend\app\models"
}

if (Test-Path "$base\backend\app\routes\traffic_routes.js") {
    Write-Output "✅ traffic_routes.js found in backend\app\routes"
} else {
    Write-Output "❌ traffic_routes.js MISSING from backend\app\routes"
}

if (Test-Path "$base\backend\app\routes\user_routes.js") {
    Write-Output "✅ user_routes.js found in backend\app\routes"
} else {
    Write-Output "❌ user_routes.js MISSING from backend\app\routes"
}

if (Test-Path "$base\backend\app\routes\incident_routes.js") {
    Write-Output "✅ incident_routes.js found in backend\app\routes"
} else {
    Write-Output "❌ incident_routes.js MISSING from backend\app\routes"
}

if (Test-Path "$base\backend\app\routes\tgs_routes.js") {
    Write-Output "✅ tgs_routes.js found in backend\app\routes"
} else {
    Write-Output "❌ tgs_routes.js MISSING from backend\app\routes"
}

if (Test-Path "$base\backend\app\routes\tmp_routes.js") {
    Write-Output "✅ tmp_routes.js found in backend\app\routes"
} else {
    Write-Output "❌ tmp_routes.js MISSING from backend\app\routes"
}

if (Test-Path "$base\backend\app\middlewares\auth_middleware.js") {
    Write-Output "✅ auth_middleware.js found in backend\app\middlewares"
} else {
    Write-Output "❌ auth_middleware.js MISSING from backend\app\middlewares"
}

if (Test-Path "$base\backend\app\middlewares\error_handler.js") {
    Write-Output "✅ error_handler.js found in backend\app\middlewares"
} else {
    Write-Output "❌ error_handler.js MISSING from backend\app\middlewares"
}

if (Test-Path "$base\backend\app\middlewares\rate_limiter.js") {
    Write-Output "✅ rate_limiter.js found in backend\app\middlewares"
} else {
    Write-Output "❌ rate_limiter.js MISSING from backend\app\middlewares"
}

if (Test-Path "$base\backend\app\middlewares\request_logger.js") {
    Write-Output "✅ request_logger.js found in backend\app\middlewares"
} else {
    Write-Output "❌ request_logger.js MISSING from backend\app\middlewares"
}

if (Test-Path "$base\backend\app\utils\algorithm_utils.js") {
    Write-Output "✅ algorithm_utils.js found in backend\app\utils"
} else {
    Write-Output "❌ algorithm_utils.js MISSING from backend\app\utils"
}

if (Test-Path "$base\backend\app\utils\map_utils.js") {
    Write-Output "✅ map_utils.js found in backend\app\utils"
} else {
    Write-Output "❌ map_utils.js MISSING from backend\app\utils"
}

if (Test-Path "$base\backend\config\database.js") {
    Write-Output "✅ database.js found in backend\config"
} else {
    Write-Output "❌ database.js MISSING from backend\config"
}

if (Test-Path "$base\backend\config\env.js") {
    Write-Output "✅ env.js found in backend\config"
} else {
    Write-Output "❌ env.js MISSING from backend\config"
}

if (Test-Path "$base\backend\config\google_maps.js") {
    Write-Output "✅ google_maps.js found in backend\config"
} else {
    Write-Output "❌ google_maps.js MISSING from backend\config"
}

if (Test-Path "$base\backend\database\schema.sql") {
    Write-Output "✅ schema.sql found in backend\database"
} else {
    Write-Output "❌ schema.sql MISSING from backend\database"
}

if (Test-Path "$base\backend\server.js") {
    Write-Output "✅ server.js found in backend"
} else {
    Write-Output "❌ server.js MISSING from backend"
}

if (Test-Path "$base\docs\README.md") {
    Write-Output "✅ README.md found in docs"
} else {
    Write-Output "❌ README.md MISSING from docs"
}

if (Test-Path "$base\docs\API_Documentation.md") {
    Write-Output "✅ API_Documentation.md found in docs"
} else {
    Write-Output "❌ API_Documentation.md MISSING from docs"
}

if (Test-Path "$base\docs\Austroads_Guidelines.pdf") {
    Write-Output "✅ Austroads_Guidelines.pdf found in docs"
} else {
    Write-Output "❌ Austroads_Guidelines.pdf MISSING from docs"
}

if (Test-Path "$base\docs\diagrams\database_schema.png") {
    Write-Output "✅ database_schema.png found in docs\diagrams"
} else {
    Write-Output "❌ database_schema.png MISSING from docs\diagrams"
}

if (Test-Path "$base\docs\diagrams\system_architecture.png") {
    Write-Output "✅ system_architecture.png found in docs\diagrams"
} else {
    Write-Output "❌ system_architecture.png MISSING from docs\diagrams"
}

if (Test-Path "$base\config\google_maps_api_key.json") {
    Write-Output "✅ google_maps_api_key.json found in config"
} else {
    Write-Output "❌ google_maps_api_key.json MISSING from config"
}

if (Test-Path "$base\config\env_variables.json") {
    Write-Output "✅ env_variables.json found in config"
} else {
    Write-Output "❌ env_variables.json MISSING from config"
}

if (Test-Path "$base\database\traffic_management.db") {
    Write-Output "✅ traffic_management.db found in database"
} else {
    Write-Output "❌ traffic_management.db MISSING from database"
}

if (Test-Path "$base\database\db_config.sql") {
    Write-Output "✅ db_config.sql found in database"
} else {
    Write-Output "❌ db_config.sql MISSING from database"
}

# ===== 5. Cleanup Empty Folders =====


Get-ChildItem -Path $base -Recurse -Directory |
    Where-Object { @(Get-ChildItem -LiteralPath $_.FullName -Force -Recurse).Count -eq 0 } |
    Remove-Item -Force -Recurse -Verbose
