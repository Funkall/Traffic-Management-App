const express = require('express');
const trafficController = require('../controllers/traffic_controller');
const tgsRoutes = require('./tgs_routes');
const { getAllSigns } = require('../controllers/traffic_signs_controller');

const router = express.Router();

// ✅ Mount the TGS smart generation route
router.use('/tgs', tgsRoutes);

// ✅ Route to fetch all traffic plans
router.get('/traffic/plans', trafficController.getTrafficPlans);

// ✅ Route to fetch TGS for a specific plan
router.get('/traffic/plans/:id/tgs', trafficController.getTGS);

// ✅ Route to fetch all traffic control measures
router.get('/traffic/measures', trafficController.getTrafficMeasures);

// ✅ Route to fetch all Traffic Guidance Schemes (TGS)
router.get('/traffic/guidance-schemes', trafficController.getTrafficGuidanceSchemes);

// ✅ Route to fetch TGS for a specific traffic plan
router.get('/traffic/plans/:id/guidance-schemes', trafficController.getTrafficGuidanceSchemeByPlan);

// ✅ Route to add a new Traffic Guidance Scheme (TGS)
router.post('/traffic/guidance-schemes', trafficController.addTrafficGuidanceScheme);

// ✅ Route to fetch all traffic signs (NEW!)
router.get('/traffic/signs', getAllSigns);

module.exports = router;
