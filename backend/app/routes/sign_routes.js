const express = require('express');
const router = express.Router();
const signsController = require('../controllers/signs_controller');

// Get all signs
router.get('/signs', signsController.getAllSigns);

// Get sign by code
router.get('/signs/:code', signsController.getSignByCode);

module.exports = router;
