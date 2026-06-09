const express = require('express');
const cors = require('cors');
const wordsRoutes = require('./src/routes/wordsRoutes');

const app = express();
const port = process.env.PORT || 3000;

app.use(cors());
app.use(express.json());

app.use('/words', wordsRoutes);

// Health check endpoint
app.get('/health', (req, res) => {
  res.status(200).json({ status: 'ok' });
});

app.listen(port, () => {
  console.log(`LingoBreeze Backend running on port ${port}`);
});
