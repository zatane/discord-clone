@echo off
SETLOCAL ENABLEDELAYEDEXPANSION

echo Checking if Node.js is installed...\r\nnode -v >nul 2>&1\r\nIF ERRORLEVEL 1 (\r\n    echo Node.js is not installed. Please install it from https://nodejs.org/\r\n    exit /b\r\n) ELSE (\r\n    echo Node.js is installed. Version: !node -v!\r\n)\r\n
echo Checking if PostgreSQL is installed...\r\npg_isready >nul 2>&1\r\nIF ERRORLEVEL 1 (\r\n    echo PostgreSQL is not installed. Please install it from https://www.postgresql.org/\r\n    exit /b\r\n) ELSE (\r\n    echo PostgreSQL is installed.\r\n)\r\n
echo Cloning or navigating to the project directory...\r\nIF NOT EXIST "discord-clone" (\r\n    git clone https://github.com/zatane/discord-clone.git\r\n)\r\ncd discord-clone\r\n
echo Installing frontend dependencies...\r\ncd frontend\r\nnpm install\r\nIF ERRORLEVEL 1 (\r\n    echo Failed to install frontend dependencies.\r\n    exit /b\r\n)\r\ncd ..\r\n
echo Installing backend dependencies...\r\ncd backend\r\nnpm install\r\nIF ERRORLEVEL 1 (\r\n    echo Failed to install backend dependencies.\r\n    exit /b\r\n)\r\ncd ..\r\n
echo Creating .env files...\r\nIF NOT EXIST ".env" (\r\n    echo DB_HOST=localhost > .env\r\n    echo DB_USER=your_username >> .env\r\n    echo DB_PASS=your_password >> .env\r\n    echo DB_NAME=your_database >> .env\r\n)\r\n
echo Creating PostgreSQL database...\r\npsql -U your_username -c "CREATE DATABASE your_database;"\r\nIF ERRORLEVEL 1 (\r\n    echo Failed to create database. Please check your PostgreSQL setup.\r\n    exit /b\r\n)\r\n
echo Starting frontend and backend servers...\r\nstart cmd /c "cd frontend && npm start"\r\nstart cmd /c "cd backend && npm start"\r\necho Setup completed successfully. Servers are running.\r\nENDLOCAL