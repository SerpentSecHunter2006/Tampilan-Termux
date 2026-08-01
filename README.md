# 🐍 Serpent Security Hunter — Tampilan Termux

<p align="center">
  <img src="https://img.shields.io/badge/Version-2.0-green?style=for-the-badge"/>
  <img src="https://img.shields.io/badge/Platform-Termux-black?style=for-the-badge&logo=android"/>
  <img src="https://img.shields.io/badge/Shell-Bash-blue?style=for-the-badge&logo=gnu-bash"/>
  <img src="https://img.shields.io/badge/Author-SERPENT-red?style=for-the-badge"/>
</p>

> Tampilan terminal Termux profesional dengan sistem login aman, dashboard tools bug hunting, dan fitur background session menggunakan `tmux`.

---

## 📸 Preview

```
  ╔══════════════════════════════════════════════════════════╗
  ║         SERPENT SECURITY HUNTER  v2.0                   ║
  ╠══════════════════════════════════════════════════════════╣
  ║  COPYRIGHT : SERPENT                                    ║
  ║  GITHUB    : github.com/SerpentSecHunter2006            ║
  ║  STATUS    : ● ONLINE                                   ║
  ╚══════════════════════════════════════════════════════════╝
```

---

## ✨ Fitur

- 🔐 **Sistem Login Aman** — Username & Password dengan perlindungan lockout otomatis setelah 3x percobaan gagal
- 🎨 **Tampilan ASCII Art** — Logo kustom di halaman login dan dashboard
- 📋 **38 Tools Bug Hunting** — Tersusun rapi dalam 7 kategori
- 🔄 **Background Session (tmux)** — Keluar dari Termux tanpa menghentikan scan yang sedang berjalan
- 🚀 **Auto-start Permanen** — Login otomatis tampil setiap kali Termux dibuka
- 📝 **Log Percobaan Gagal** — Setiap percobaan login gagal dicatat otomatis di `~/.serpent_login.log`

---

## 📁 Struktur File

```
Tampilan-Termux/
├── login.sh          # Script halaman login
├── dashboard.sh      # Script dashboard tools
├── install.sh        # Script installer (jalankan sekali saja)
└── README.md         # Dokumentasi ini
```

---

## ⚙️ Instalasi

### 1. Clone Repository

```bash
git clone https://github.com/SerpentSecHunter2006/Tampilan-Termux.git
cd Tampilan-Termux
```

### 2. Jalankan Installer

```bash
chmod +x install.sh
./install.sh
```

### 3. Restart Termux

Tutup Termux sepenuhnya, lalu buka lagi. Halaman login akan muncul otomatis!

---

## 🔑 Kredensial Default

| Field    | Value              |
|----------|--------------------|
| Username | `SerpentSecHunter` |
| Password | `2007-07-19`       |

> ⚠️ Disarankan untuk mengganti password sesuai keinginan Anda setelah instalasi.

---

## 🛠️ Daftar 38 Tools Bug Hunting

### 🔍 1. Recon & Subdomain Discovery
| No | Tool | Fungsi |
|----|------|--------|
| 01 | Amass | Subdomain enumeration mendalam |
| 02 | Assetfinder | Pencarian subdomain cepat |
| 03 | Subfinder | Passive subdomain discovery |
| 04 | Dnsx | DNS resolver & probe |
| 05 | HTTPX | HTTP probing & fingerprinting |

### 👁️ 2. Visual Recon & Crawling
| No | Tool | Fungsi |
|----|------|--------|
| 06 | Gowitness | Screenshot website otomatis |
| 07 | Katana | Web crawler modern |
| 08 | Waybackurls | Ambil URL dari Wayback Machine |
| 09 | Gau | Kumpulkan URL dari berbagai sumber |
| 10 | Paramspider | Temukan parameter dari URL |

### 🎯 3. Parameter & Fuzzing
| No | Tool | Fungsi |
|----|------|--------|
| 11 | FFUF | Web fuzzer cepat |
| 12 | Gobuster | Directory & DNS brute-force |
| 13 | Dirsearch | Pencarian direktori tersembunyi |
| 14 | Arjun | HTTP parameter discovery |
| 15 | x8 | Hidden parameter finder |
| 16 | Qsreplace | Query string manipulation |

### 🐛 4. Vulnerability Scanning
| No | Tool | Fungsi |
|----|------|--------|
| 17 | SQLmap | SQL Injection otomatis |
| 18 | Nikto | Web server vulnerability scanner |
| 19 | Nuclei | Template-based vulnerability scanner |
| 20 | Dalfox | XSS finder & exploiter |
| 21 | skip403 | Bypass 403 Forbidden |
| 22 | Crlfuzz | CRLF injection scanner |
| 23 | Smuggler | HTTP request smuggling |
| 24 | Corsy | CORS misconfiguration scanner |
| 25 | SSRFmap | SSRF vulnerability scanner |
| 26 | CVE-2026-41940 | Exploit tool CVE khusus |

### 🌐 5. Network & Password Cracking
| No | Tool | Fungsi |
|----|------|--------|
| 27 | Nmap | Network scanner & port mapper |
| 28 | John the Ripper | Password cracker |
| 29 | Hydra | Online brute-force tool |
| 30 | Hashcat | GPU-based password cracker |

### 🔌 6. API, CMS & JS Analysis
| No | Tool | Fungsi |
|----|------|--------|
| 31 | Kiterunner | API endpoint discovery |
| 32 | Gitleaks | Secret scanner di Git repo |
| 33 | WPScan | WordPress vulnerability scanner |
| 34 | LinkFinder | Temukan endpoint di file JS |
| 35 | SecretFinder | Temukan secret di file JS |

### 🤖 7. Automation & OOB Detection
| No | Tool | Fungsi |
|----|------|--------|
| 36 | Notify | Kirim notifikasi ke berbagai platform |
| 37 | Interactsh-client | Out-of-band interaction testing |

---

## 💡 Cara Penggunaan

### Jalankan tool
Pilih nomor tool dari menu, tekan `ENTER`, dan tool akan langsung berjalan.

### Background Session (Fitur Andalan)
Jika Anda sedang melakukan scan panjang (misalnya SQLmap atau Nuclei) dan ingin keluar dari Termux:

1. Pilih opsi **`[88] Detach`** dari menu
2. Tutup Termux — scan **TETAP berjalan** di background!
3. Buka Termux lagi → login → **otomatis tersambung** kembali ke sesi scan

### Cegah Android Mematikan Termux
Jalankan perintah ini agar Android tidak mematikan Termux saat minimize:
```bash
termux-wake-lock
```

---

## 🔧 Konfigurasi Lanjutan

### Ganti Password
Edit file `~/.serpent/login.sh` dan ubah nilai `LOGIN_PASS`:
```bash
LOGIN_PASS="password_baru_kamu"
```

### Lokasi File Instalasi
Setelah `install.sh` dijalankan, file tersimpan di:
```
~/.serpent/login.sh
~/.serpent/dashboard.sh
```

### Lokasi Log Login Gagal
```
~/.serpent_login.log
```

---

## 📋 Persyaratan

- Termux (Android)
- `tmux` — diinstall otomatis oleh `install.sh`
- Tools yang sudah terinstall sesuai daftar di README PDF

---

## 👨‍💻 Developer

| | |
|---|---|
| **Author** | SERPENT |
| **GitHub** | [SerpentSecHunter2006](https://github.com/SerpentSecHunter2006) |
| **Repository** | [Tampilan-Termux](https://github.com/SerpentSecHunter2006/Tampilan-Termux) |
| **Versi** | 2.0 |

---

<p align="center">Made with ❤️ by SERPENT</p>
