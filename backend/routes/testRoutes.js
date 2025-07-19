const express = require("express");
const router = express.Router();
const pool = require("../db");

// Add test request
router.get("/add-test-request", async (req, res) => {
  const connection = await pool.getConnection();

  try {
    await connection.beginTransaction();

    // Get first bank and recipient
    const [banks] = await connection.query(
      "SELECT bank_id FROM blood_banks LIMIT 1"
    );
    const [recipients] = await connection.query(
      "SELECT recipient_id FROM recipients LIMIT 1"
    );

    if (banks.length === 0 || recipients.length === 0) {
      await connection.rollback();
      return res.status(400).json({
        success: false,
        message: "No banks or recipients found",
      });
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

    // Add inventory for AB+ blood group if it doesn't exist
    await connection.query(
      `INSERT INTO blood_inventory 
       (bank_id, blood_group, available_units) 
       VALUES (?, ?, ?)
       ON DUPLICATE KEY UPDATE
       available_units = VALUES(available_units)`,
      [banks[0].bank_id, "AB+", 10]
    );

    await connection.commit();

    res.status(200).json({
      success: true,
      message: "Test request created/updated successfully",
      data: {
        request_id: 2,
        bank_id: banks[0].bank_id,
        recipient_id: recipients[0].recipient_id,
        blood_group: "AB+",
        units: 1,
      },
    });
  } catch (error) {
    await connection.rollback();
    console.error("Error creating test request:", error);
    res.status(500).json({
      success: false,
      message: "Server Error",
    });
  } finally {
    connection.release();
  }
});

module.exports = router;
