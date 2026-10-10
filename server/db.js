const mysql = require('mysql2/promise');

// Create the pool once at application startup cxn ma base de donnee 
const pool = mysql.createPool({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_NAME,
});
