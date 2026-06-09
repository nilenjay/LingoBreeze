const express = require('express');
const router = express.Router();
const wordsController = require('../controllers/wordsController');

router.get('/', wordsController.getWords);
router.post('/', wordsController.addWord);

module.exports = router;
