const express = require('express');
const router = express.Router();
const { generateTGS } = require('../controllers/tgs_controller');

router.post('/generate', generateTGS);

module.exports = router;