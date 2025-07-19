const mysql = require("mysql2/promise");

async function addRequest() {
  try {
    // Connect to database
    const connection = await mysql.createConnection({
      host: "localhost",
      user: "root",
      password: "",
      database: "bloodhaven",
    });

    console.log("Connected to database");

    // Get first bank and recipient
    const [banks] = await connection.query(
      "SELECT bank_id FROM blood_banks LIMIT 1"
    );
    const [recipients] = await connection.query(
      "SELECT recipient_id FROM recipients LIMIT 1"
    );

    if (banks.length === 0 || recipients.length === 0) {
      console.log("No banks or recipients found");
      return;
    }

    // Insert record with ID 2
    await connection.query(
      `INSERT INTO blood_requests 
       (request_id, recipient_id, bank_id, blood_group, units_requested, required_by, purpose, status, notes, request_date) 
       VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, NOW())
       ON DUPLICATE KEY UPDATE
       blood_group = VALUES(blood_group),
       units_requested = VALUES(units_requested),
       required_by = VALUES(required_by),
       purpose = VALUES(purpose),
       status = VALUES(status),
       notes = VALUES(notes)`,
      [
        2,
        recipients[0].recipient_id,
        banks[0].bank_id,
        "AB+",
        1,
        "2024-02-23",
        "Scheduled Surgery",
        "pending",
        "Patient: Emily Johnson, Age: 35",
      ]
    );

    console.log("Added request with ID 2");

    // Add inventory for AB+ blood group
    await connection.query(
      `INSERT INTO blood_inventory 
       (bank_id, blood_group, available_units) 
       VALUES (?, ?, ?)
       ON DUPLICATE KEY UPDATE
       available_units = VALUES(available_units)`,
      [banks[0].bank_id, "AB+", 10]
    );

    console.log("Added/updated AB+ inventory with 10 units");

    // Close connection
    await connection.end();

    console.log("Done");
  } catch (error) {
    console.error("Error:", error);
  }
}

// Run the function
addRequest();
