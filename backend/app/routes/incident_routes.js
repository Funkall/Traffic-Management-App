const express = require('express');
const { reportIncident } = require('../controllers/incident_management_controller');
const router = express.Router();

router.post('/report', reportIncident);

module.exports = router;


📦 Route Overview:
Endpoint	HTTP	Description	Controller Function
/traffic/plans	GET	Fetch all traffic plans	getTrafficPlans
/traffic/plans/:id/tgs	GET	Get TGS data (map-ready) for a specific traffic plan	getTGS
/traffic/measures	GET	Fetch all control measures	getTrafficMeasures
/traffic/guidance-schemes	GET	Fetch all stored TGS entries	getTrafficGuidanceSchemes
/traffic/plans/:id/guidance-schemes	GET	Fetch all TGS linked to a specific plan	getTrafficGuidanceSchemeByPlan
/traffic/guidance-schemes	POST	Add a new TGS	addTrafficGuidanceScheme
