
async function main() {
  try {
    console.log('--- Connection test ---');
    const conn = await pool.getConnection();
    console.log('Connected to MySQL ✓');
    conn.release();

    console.log('\n--- All books ---');
    console.log(await getAllBooks());

  } catch (error) {
    console.error('Something went wrong:', error.message);
  } finally {
    await pool.end();
  }
}

main();