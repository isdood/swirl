const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const dotenv = require('dotenv');
const Web3 = require('web3');

dotenv.config();

const app = express();
const port = process.env.PORT || 5000;

app.use(cors());
app.use(bodyParser.json());

app.get('/', (req, res) => {
  res.send('Welcome to the Swirl web3 music sharing platform backend!');
});

app.listen(port, () => {
  console.log(`Server is running on port: ${port}`);
});
