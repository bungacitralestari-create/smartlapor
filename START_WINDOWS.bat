@echo off
title SmartLapor - Tugas 5
where docker >nul 2>nul
if errorlevel 1 (
  echo Docker Desktop belum terpasang/berjalan.
  echo Install Docker Desktop lalu jalankan file ini lagi.
  pause
  exit /b 1
)
echo Menjalankan SmartLapor...
docker compose up --build
