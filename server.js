const express = require('express');
const path = require('path');
const app = express();

const PORT = 3000;
const HOST = '0.0.0.0';

// Serve index.html and any static assets (CSS, JS, images) in this folder
app.use(express.static(__dirname));

app.listen(PORT, HOST, () => {
  console.log(`Server running on http://${HOST}:${PORT}`);
});
