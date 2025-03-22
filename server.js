const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors'); // Import the cors middleware
const { Client } = require('pg');

const app = express();
const port = 3000; // Ensure the correct port is used for the Express server

const client = new Client({
    user: 'postgres',
    host: 'localhost',
    database: 'customer_base',
    password: 'Wasntme12345',
    port: 5432, // PostgreSQL port
});

client.connect()
    .then(() => console.log('Connected to PostgreSQL'))
    .catch(err => console.error('Connection error', err.stack));

app.use(bodyParser.json());
app.use(cors({ origin: '*' })); // Enable CORS for all routes and allow any origin

app.post('/submit-form', async (req, res) => {
    const { name, email, businessName, message } = req.body;

    console.log('Received form submission:', req.body); // Log the request body

    try {
        const result = await client.query(
            'INSERT INTO customer_info (name, email, business_name, message) VALUES ($1, $2, $3, $4) RETURNING *',
            [name, email, businessName, message]
        );
        res.status(200).json(result.rows[0]);
    } catch (error) {
        console.error('Error inserting data:', error); // Log the error
        console.error('Request body:', req.body); // Log the request body
        res.status(500).json({ error: 'Internal Server Error', details: error.message });
    }
});

app.listen(port, () => {
    console.log(`Server running at http://localhost:${port}/`);
});
