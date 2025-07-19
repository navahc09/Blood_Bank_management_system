# Blood Bank 🩸🏥  
**Modern blood bank management system for hospitals, donors, and recipients**

[![License: ISC](https://img.shields.io/badge/License-ISC-blue.svg)](LICENSE)
[![Node.js](https://img.shields.io/badge/Node.js-18.x-green)](https://nodejs.org/)
[![React](https://img.shields.io/badge/React-18.x-blue)](https://reactjs.org/)

## Features ✨
- Donor and recipient management with secure authentication
- Real-time blood inventory tracking and request processing
- Hospital and admin dashboards with analytics and reports
- Role-based access for hospitals, admins, and recipients
- Responsive React UI with modern design
- MySQL database for reliable data storage

## Tech Stack 🛠️
| Category       | Technologies |
|----------------|-------------|
| **Frontend**   | React, TypeScript, Vite, shadcn-ui, Tailwind CSS |
| **Backend**    | Node.js, Express, MySQL |
| **Database**   | MySQL |
| **DevOps**     | Git, GitHub, Concurrently |

## Installation ⚙️
```bash
# Clone repository
git clone https://github.com/yourusername/blood-bank.git

# Install all dependencies (root, frontend, backend)
cd blood-bank
npm run install:all

# Initialize the database (ensure MySQL is running)
npm run db:init

# Start the development servers (frontend + backend)
npm run dev
``` 