const http = require('http');
const fs = require('fs');
const path = require('path');
const { exec } = require('child_process');

const PORT = 3000;
const URL = `http://localhost:${PORT}/`;

const server = http.createServer((req, res) => {
  const filePath = path.join(__dirname, 'index.html');

  fs.readFile(filePath, (err, content) => {
    if (err) {
      res.writeHead(500, { 'Content-Type': 'text/plain' });
      res.end('Error loading index.html');
      return;
    }

    res.writeHead(200, { 'Content-Type': 'text/html' });
    res.end(content);
  });
});

server.listen(PORT, () => {
  console.log(`Server running at ${URL}`);

  // Automatically open the URL in the default browser based on the OS
  const openCommand =
    process.platform === 'win32'
      ? `start ${URL}`
      : process.platform === 'darwin'
      ? `open ${URL}`
      : `xdg-open ${URL}`;

  exec(openCommand, (err) => {
    if (err) {
      console.error('Could not open browser automatically:', err.message);
    }
  });
});
