# Blood Bank Management System

> **Group Project Notice**
>
> This repository is my fork of a group academic project. The original repository, containing the collaborative work of all team members, can be found at: [Ashmit-Borawake/Blood_Bank](https://github.com/Ashmit-Borawake/Blood_Bank).

---

## 📋 Project Overview

This project is a comprehensive Blood Bank Management System developed as part of our Database Management Systems coursework. The system provides an efficient, web-based platform for managing blood inventory, donor information, and blood requests from hospitals. It aims to streamline the process of blood donation and distribution, ensuring timely access to blood for those in need and providing a robust administrative interface for blood bank staff.

---

## ✨ Key Features

* **User Authentication:** Secure login and registration for both Admins and hospital staff.
* **Inventory Management:** Admins can add, update, and view the current stock of blood bags, categorized by blood type.
* **Donor Management:** Functionality to add new donors, record their details, and track donation history.
* **Request & Approval System:** Hospitals can request specific quantities of blood, which admins can then view, approve, or reject based on availability.
* **Dynamic Dashboard:** A user-friendly interface built with React that allows for easy navigation and clear data visualization.
* **Robust Database:** Powered by SQL to ensure data integrity, with a well-structured schema for managing complex relationships between donors, inventory, and requests.

---

## 🛠️ Technologies Used

* **Frontend:** React, HTML, CSS
* **Backend:** Node.js, Express.js (or similar for handling API requests)
* **Database:** SQL (managed via a database system like MySQL or PostgreSQL)
* **Development Tools:** Git, GitHub, VS Code

---

## 🤝 Project Team & Contributions

This project was a collaborative effort by a team of four students. We worked together on the design, development, and testing phases.

* **Ashmit Borawake**
* **Shubham Chavan (Me)**
* **Vedant Dhere**
* **Atharva Chaudhari**

My primary contributions involved developing key components of the React frontend, designing parts of the SQL database schema, and integrating the frontend with backend APIs.

---

## 🚀 Getting Started

### Prerequisites

* Node.js and npm installed
* A running SQL database server

### Installation & Setup

1.  **Clone the repository:**
    ```sh
    git clone [https://github.com/navahc09/Blood_Bank_management_system.git](https://github.com/navahc09/Blood_Bank_management_system.git)
    cd Blood_Bank_management_system
    ```

2.  **Install frontend dependencies:**
    ```sh
    npm install
    ```

3.  **Set up the database:**
    * Import the provided `.sql` file into your SQL database to create the necessary tables and schema.

4.  **Configure environment variables:**
    * Create a `.env` file in the root directory and add your database connection details (e.g., `DB_HOST`, `DB_USER`, `DB_PASS`, `DB_NAME`).

5.  **Run the application:**
    ```sh
    npm start
    ```
