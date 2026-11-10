# SmartLapor — Tugas 5

**Nama:** Bunga Citra Lestari  
**NPM:** 24311069  
**Kelas:** SI 23 A  

SmartLapor adalah aplikasi Smart City untuk pelaporan masalah pelayanan publik. Implementasi menggunakan React + Vite + TypeScript, Rust + Axum + SQLx, dan PostgreSQL.

## Fitur yang diimplementasikan
- Login, registrasi, logout, JWT authentication dan role-based authorization.
- Role: masyarakat, petugas, admin, pimpinan.
- Dashboard statistik berbasis data PostgreSQL.
- CRUD laporan: buat, lihat, ubah, hapus sesuai hak akses.
- Workflow status: Diajukan → Diverifikasi → Ditugaskan → Diproses → Menunggu Verifikasi → Selesai / Ditolak.
- Assignment laporan ke petugas.
- Kategori dan wilayah dari database.
- Manajemen pengguna (read-only untuk admin/pimpinan pada UI).
- GIS OpenStreetMap/Leaflet untuk melihat dan memilih titik lokasi.
- Analitik status laporan.
- Upload gambar melalui backend dengan pembatasan tipe dan ukuran.
- Validasi backend, parameterized query SQLx, password Argon2, CORS terkontrol, error message aman.

## Struktur
```text
smartlapor/
├── backend/       # Rust + Axum + SQLx
│   ├── src/main.rs
│   └── migrations/
├── frontend/      # React + Vite + TypeScript
├── uploads/
├── docs/
├── docker-compose.yml
└── .env.example
```

## Cara menjalankan
### 1. PostgreSQL
Pastikan PostgreSQL aktif lalu buat database `smartlapor`, atau gunakan:
```bash
docker compose up -d db
```

### 2. Backend
```bash
cd backend
copy ..\\.env.example .env   # Windows
# atau: cp ../.env.example .env
cargo run
```
Migration berjalan otomatis saat backend start.

### 3. Frontend
Terminal baru:
```bash
cd frontend
npm install
npm run dev
```
Buka `http://localhost:5173`.

## Akun demo (SEED_DEV=true)
- Admin: admin@smartlapor.local / Admin123!
- Petugas: petugas1@smartlapor.local / Petugas123!
- Warga: warga1@smartlapor.local / Warga123!
- Pimpinan: pimpinan@smartlapor.local / Pimpinan123!

**Untuk produksi, ganti semua password demo dan JWT_SECRET. Jangan commit `.env`.**

## Catatan logo
Logo resmi Pemerintah Daerah dan Universitas Teknokrat Indonesia harus menggunakan file asset resmi yang diberikan oleh dosen/instansi. Template tidak membuat logo resmi secara palsu.

## Validasi sebelum pengumpulan
1. `cargo check` dan `cargo run` berhasil.
2. `npm install` dan `npm run build` berhasil.
3. Login tiap role berhasil.
4. Buat laporan tersimpan di PostgreSQL.
5. Perubahan status dan assignment tersimpan di PostgreSQL.
6. CRUD laporan sesuai hak akses.
7. Dashboard/analitik menampilkan data database, bukan mockup.
8. Tidak ada `.env`, `node_modules`, atau `target` di ZIP.

Copyright©2026 by Bunga Citra Lestari dan Dr. Erliyan Redy Susanto, M.Kom

## Jalankan paling mudah (Windows)
Gunakan Docker Desktop. Setelah Docker Desktop aktif, masuk ke folder `smartlapor` lalu double-click `START_WINDOWS.bat`. Buka `http://localhost:5173`.

Login demo: `warga1@smartlapor.local` / `Warga123!`.
