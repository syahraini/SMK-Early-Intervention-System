# Early Warning System (EWS) - SMK Nusantara Jaya

**Sistem deteksi dini siswa berisiko drop-out berbasis dual-path risk engine.**

## Ringkasan Proyek

SMK Nusantara Jaya mengalami peningkatan angka drop-out dari 2.85% menjadi 3.72% dalam satu tahun. Penyebab utamanya adalah tidak adanya sistem terintegrasi untuk memantau absensi dan performa akademik siswa. Deteksi risiko baru terjadi setelah >1 bulan, saat intervensi sudah sulit dilakukan.

Saya merancang Early Warning System yang mengintegrasikan data absensi (50%) dan performa akademik (40%) dengan riwayat tinggal kelas (10%) menjadi risk score harian.

## Dampak Proyek

| Metrik | Sebelum | Sesudah | Perubahan |
|--------|---------|---------|-----------|
| Waktu deteksi risiko | >1 bulan | <5 hari | ↓ 86% |
| Angka drop-out | 3.72% | 0.83% | ↓ 78% |
| Akurasi identifikasi risiko | 19.4% | 81.9% | ↑ 322% |
| Beban administrasi guru | 4-6 jam/minggu | <30 menit/minggu | ↓ 88% |

## Lingkup Pekerjaan

- **Peran:** Business Analyst · Product Designer (System-Focused)
- **Tools:** Lucidchart (BPMN) · Figma (Wireframe)
- **Durasi:** 12 minggu
- **Cakupan:** 847 siswa, 30+ guru, 5 peran pengguna

## Yang Ada di Repository Ini

| File | Isi |
|------|-----|
| `EWS_SMK_Nusantara_Jaya_Portfolio.pdf` | Portofolio lengkap (30 halaman) |
| `images/dashboard-wali-kelas.png` | Wireframe dashboard utama |
| `images/profil-siswa.png` | Wireframe laman profil siswa |
| `images/log-intervensi.png` | Wireframe log intervensi |
| `images/arsitektur-sistem.png` | Diagram arsitektur 2-layer |
| `images/bpmn-as-is-to-be.png` | Pemetaan proses BPMN |

## Teknologi & Metodologi

- **Risk Engine:** Analytical Hierarchy Process (AHP) dengan bobot Absensi 50%, Akademik 40%, Riwayat 10%
- **Arsitektur:** Offline-first, sync batch, WhatsApp Gateway
- **Metodologi:** Stakeholder mapping (RACI), BPMN, Root cause analysis (Fishbone), Prioritasi (Pareto)

## Cara Mengakses Portofolio Lengkap

Klik file `EWS_SMK_Nusantara_Jaya_Portfolio.pdf` di atas untuk membaca dokumentasi end-to-end yang mencakup:
- Wawancara pemangku kepentingan
- Pemetaan proses AS-IS dan TO-BE
- Definisi kebutuhan fungsional & non-fungsional
- Perancangan dashboard dan log intervensi

## Tentang Analis
Halo, saya Syahraini. Saat ini sedang belajar dan mempraktikkan Analisis Bisnis.
Saya tertarik pada bagaimana informasi mengalir dalam pengambilan keputusan, bukan hanya melalui sistem atau laporan, tapi juga melalui kebiasaan sehari-hari orang dan organisasi.

## Kontak
LinkedIn: https://linkedin.com/in/nsyahraini
Portofolio: https://syahrainiaini.framer.website/
Email: syahraini.nur@outlook.com
