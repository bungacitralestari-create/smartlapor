@echo off
echo PERINGATAN: ini menghapus data database SmartLapor.
choice /M "Lanjut reset database"
if errorlevel 2 exit /b 0
docker compose down -v
docker compose up --build
