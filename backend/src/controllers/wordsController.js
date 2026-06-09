const wordsService = require('../services/wordsService');

exports.getWords = async (req, res) => {
  try {
    const words = await wordsService.getWords();
    res.status(200).json(words);
  } catch (error) {
    console.error('Error getting words:', error);
    res.status(500).json({ message: 'Failed to retrieve words' });
  }
};

exports.addWord = async (req, res) => {
  try {
    const { word, meaning, translation } = req.body;
    
    if (!word || !meaning || !translation) {
      return res.status(400).json({ message: 'Missing required fields' });
    }

    const newWord = await wordsService.addWord({ word, meaning, translation });
    res.status(201).json(newWord);
  } catch (error) {
    console.error('Error adding word:', error);
    res.status(500).json({ message: 'Failed to add word' });
  }
};
