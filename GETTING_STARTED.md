# Getting Started with Discord Clone

## Installation and Setup Instructions

### Prerequisites
- Node.js (version 14 or higher)
- PostgreSQL (version 12 or higher)

### Node.js Setup
1. Download and install Node.js from the [official website](https://nodejs.org/).
2. Verify the installation:
   ```bash
   node -v
   npm -v
   ```

### PostgreSQL Configuration
1. Download and install PostgreSQL from the [official PostgreSQL website](https://www.postgresql.org/download/).
2. Create a new database for the Discord clone:
   ```sql
   CREATE DATABASE discord_clone;
   ```
3. Adjust your PostgreSQL settings as necessary (e.g. user roles, permissions).

### Environment Variables
1. Create a `.env` file in the root directory of your project.
2. Add the following variables:
   ```env
   DATABASE_URL=postgres://<username>:<password>@localhost:5432/discord_clone
   PORT=5000
   JWT_SECRET=<your_jwt_secret>
   ```
   Replace `<username>`, `<password>`, and `<your_jwt_secret>` with your actual database username, password, and a secure secret key.

### Running the Servers
#### Backend Server
1. Navigate to the backend directory:
   ```bash
   cd backend
   ```
2. Install backend dependencies:
   ```bash
   npm install
   ```
3. Start the backend server:
   ```bash
   npm start
   ```

#### Frontend Server
1. Navigate to the frontend directory:
   ```bash
   cd frontend
   ```
2. Install frontend dependencies:
   ```bash
   npm install
   ```
3. Start the frontend server:
   ```bash
   npm start
   ```

## Conclusion
You should now have the Discord Clone application running on your local machine. Enjoy exploring and contributing to the project!
