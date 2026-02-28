@echo off
REM Discord Clone - Otomatik Kurulum Scripti (Windows)
REM Bu script tüm gerekli bağımlılıkları yükler ve uygulamayı başlatır

setlocal enabledelayedexpansion
cls

echo.
echo ========================================
echo   DISCORD CLONE - WINDOWS KURULUM
echo ========================================
echo.

REM Renk tanımlamaları (basit mesajlar)
echo Checking prerequisites...
echo.

REM Node.js kontrolü
echo [1/5] Node.js kontrol ediliyor...
node -v >nul 2>&1
if errorlevel 1 (
    echo.
    echo [HATA] Node.js yüklü degil!
    echo Lütfen https://nodejs.org/ adresinden Node.js yükleyin (v16 veya üzeri)
    echo.
    pause
    exit /b 1
) else (
    for /f "tokens=*" %%i in ('node -v') do set NODE_VERSION=%%i
echo [OK] Node.js kurulu: !NODE_VERSION!
)

REM npm kontrolü
echo [2/5] npm kontrol ediliyor...
npm -v >nul 2>&1
if errorlevel 1 (
    echo.
    echo [HATA] npm yüklü degil!
pause
    exit /b 1
) else (
    for /f "tokens=*" %%i in ('npm -v') do set NPM_VERSION=%%i
echo [OK] npm kurulu: !NPM_VERSION!
)

REM Git kontrolü
echo [3/5] Git kontrol ediliyor...
git --version >nul 2>&1
if errorlevel 1 (
    echo.
    echo [HATA] Git yüklü degil!
echo Lütfen https://git-scm.com/ adresinden Git yükleyin
echo.
pause
    exit /b 1
) else (
echo [OK] Git kurulu
)

echo.
echo Tum ön koşullar sağlandı!
echo.
pause

REM Proje dizininin oluşturulması
if not exist "frontend" (
echo [4/5] Frontend klasörü oluşturuluyor...
mkdir frontend
)

if not exist "backend" (
echo Backend klasörü oluşturuluyor...
mkdir backend
)

REM Frontend kurulumu
echo.
echo [5/5] Frontend bağımlılıkları yükleniyor...
echo Lütfen bekleyin, bu birkaç dakika sürebilir...
echo.

cd frontend
if exist "package.json" (
echo package.json zaten mevcut, npm install çalıştırılıyor...
    call npm install
) else (
echo React uygulaması oluşturuluyor...
    call npx create-react-app . --template typescript
    call npm install
    call npm install zustand socket.io-client axios
    call npm install -D tailwindcss postcss autoprefixer
    call npx tailwindcss init -p
)

if errorlevel 1 (
echo.
echo [HATA] Frontend kurulumunda sorun oluştu!
    cd ..
pause
    exit /b 1
)

echo [OK] Frontend kurulumu tamamlandı
cd ..

REM Backend kurulumu
echo.
echo Backend bağımlılıkları yükleniyor...
echo Lütfen bekleyin...
echo.

cd backend
if exist "package.json" (
echo package.json zaten mevcut, npm install çalıştırılıyor...
    call npm install
) else (
echo Backend projesi başlatılıyor...
    call npm init -y
    call npm install express cors dotenv socket.io pg prisma
    call npm install -D typescript @types/node nodemon ts-node
    call npx tsc --init

    REM package.json scriptlerini güncelle
echo Npm scriptleri güncelleniyor...
    (
echo {
echo   "name": "discord-clone-backend",
echo   "version": "1.0.0",
echo   "description": "Discord Clone Backend",
echo   "main": "dist/server.js",
echo   "scripts": {
echo     "start": "node dist/server.js",
echo     "dev": "nodemon --exec ts-node src/server.ts",
echo     "build": "tsc"
echo   },
echo   "dependencies": {
echo     "express": "^4.18.2",
echo     "cors": "^2.8.5",
echo     "dotenv": "^16.0.3",
echo     "socket.io": "^4.5.4",
echo     "pg": "^8.8.0",
echo     "prisma": "^4.8.0"
echo   },
echo   "devDependencies": {
echo     "typescript": "^4.9.4",
echo     "@types/node": "^18.11.18",
echo     "nodemon": "^2.0.20",
echo     "ts-node": "^10.9.1"
echo   }
echo }
    ) > package.json.new
    move /y package.json.new package.json >nul
)

if errorlevel 1 (
echo.
echo [HATA] Backend kurulumunda sorun oluştu!
    cd ..
pause
    exit /b 1
)

echo [OK] Backend kurulumu tamamlandı
cd ..

REM .env dosyaları oluştur
echo.
echo Environment değişkenleri ayarlanıyor...

if not exist "backend\.env" (
echo Backend .env dosyası oluşturuluyor...
    (
echo DATABASE_URL=postgresql://postgres:password@localhost:5432/discord_clone_db
echo PORT=5000
echo NODE_ENV=development
echo JWT_SECRET=your_super_secret_jwt_key_change_this_in_production
    ) > backend\.env
    echo [OK] backend\.env oluşturuldu
) else (
echo [BILGI] backend\.env zaten mevcut
)

if not exist "frontend\.env" (
echo Frontend .env dosyası oluşturuluyor...
    (
echo REACT_APP_API_URL=http://localhost:5000
echo REACT_APP_WS_URL=http://localhost:5000
    ) > frontend\.env
    echo [OK] frontend\.env oluşturuldu
) else (
echo [BILGI] frontend\.env zaten mevcut
)

REM Kurulum tamamlandı
echo.
echo ========================================
echo   KURULUM TAMAMLANDI!
echo ========================================
echo.
echo Sunucuları başlatmak için:
echo.
echo 1. Backend sunucusunu başlatmak için:
echo    - Yeni bir Command Prompt penceresi açın
echo    - Şu komutu çalıştırın: cd backend ^&^& npm run dev
echo.
echo 2. Frontend sunucusunu başlatmak için:
echo    - Yeni bir Command Prompt penceresi açın
echo    - Şu komutu çalıştırın: cd frontend ^&^& npm start
echo.
echo 3. PostgreSQL veritabanını kurmak için:
echo    - PostgreSQL yükleyin ve psql'yi çalıştırın
echo    - Şu komutları çalıştırın:
echo    CREATE DATABASE discord_clone_db;
echo.
echo Uygulamaya şuradan erişebilirsiniz:
echo   Frontend: http://localhost:3000
echo   Backend API: http://localhost:5000
echo.
echo Proje klasörleri:
echo   - Frontend: ./frontend
echo   - Backend: ./backend
echo   - Dokümantasyon: README.md, GETTING_STARTED.md vb.
echo.
echo ========================================
echo.