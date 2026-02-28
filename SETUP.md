# Setup Instructions for Discord Clone

## Installation and Setup Instructions
This guide will help you set up the Discord Clone project locally.

### Frontend Setup
1. **Clone the Repository**
   ```bash
   git clone https://github.com/zatane/discord-clone.git
   cd discord-clone/frontend
   ```

2. **Install Dependencies**
   ```bash
   npm install
   ```

3. **Run the Frontend Developer Server**
   ```bash
   npm start
   ```
   The frontend will be running on `http://localhost:3000`.

### Backend Setup
1. **Navigate to the Backend Directory**
   ```bash
   cd discord-clone/backend
   ```

2. **Install Dependencies**
   ```bash
   npm install
   ```

3. **Configure Environment Variables**
   Create a `.env` file in the `backend` directory and add the following:
   ```plaintext
   DATABASE_URL=your_database_url_here
   JWT_SECRET=your_jwt_secret_here
   ```

4. **Run the Backend Server**
   ```bash
   npm start
   ```
   The backend will be running on `http://localhost:5000`.

### Database Configuration
1. **Set Up Your Database**
   Use PostgreSQL, MySQL, or any preferred database service.
   
2. **Run Database Migrations**
   Make sure to run the necessary migrations to set up the database schema.
   ```bash
   npm run migrate
   ```

### Running the Application Locally
To run the application locally, ensure both the frontend and backend servers are running. Open your browser and go to `http://localhost:3000` to access the Discord Clone application.
