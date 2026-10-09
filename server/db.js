const mysql = require('mysql2/promise');

// Create the pool once at application startup
const pool = mysql.createPool({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'library_db',
});
