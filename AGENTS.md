# AGENTS.md — PetCare Flutter Project

## 🎯 Project Context
- **Nama**: PetCare — aplikasi kesehatan hewan peliharaan
- **Jenis**: Tugas kuliah, **frontend-only** (no backend, no API, no state management library)
- **Tujuan**: Demo presentasi — harus rapi, jalan tanpa error, enak dilihat
- **Target**: Flutter Web (Chrome) — `flutter run -d chrome`
- **Flutter SDK**: 3.47.2

## ⚠️ ATURAN KERAS (JANGAN DILANGGAR)

1. **SEMUA screen WAJIB `StatelessWidget`**
   - Jangan konversi ke `StatefulWidget`
   - Jangan pakai `setState`, `initState`, atau lifecycle method
   - Kalau butuh timer/animasi, pakai `TweenAnimationBuilder` atau `FutureBuilder`

2. **JANGAN UBAH:**
   - Struktur folder di `lib/`
   - Nama class (`HomeScreen`, `MyPetScreen`, dll)
   - Nama file
   - Nama route di `lib/routes/app_routes.dart`
   - Isi `lib/data/dummy_data.dart` (kecuali diminta menambah data)

3. **JANGAN TAMBAH dependency** di `pubspec.yaml` tanpa izin user

4. **JANGAN pakai `withOpacity()`** — deprecated
   - Ganti jadi `.withValues(alpha: x)`

5. **JANGAN pakai `CardThemeData`** — di Flutter 3.47 sudah pakai `CardTheme`

## 📁 Struktur Folder (JANGAN DIUBAH)

```
lib/
├── app.dart
├── main.dart
├── routes/app_routes.dart
├── models/pet_model.dart
├── data/dummy_data.dart
├── theme/app_theme.dart
├── widgets/
│   ├── bottom_nav_bar.dart
│   ├── service_card.dart
│   ├── pet_card.dart
│   └── section_title.dart
└── screens/
    ├── splash/splash_screen.dart
    ├── login/login_screen.dart
    ├── home/home_screen.dart
    ├── my_pet/my_pet_screen.dart
    ├── my_pet/health_record_screen.dart
    ├── consultation/consultation_screen.dart
    ├── consultation/doctor_list_screen.dart
    ├── booking_klinik/booking_klinik_screen.dart
    ├── grooming/grooming_screen.dart
    ├── pet_shop/pet_shop_screen.dart
    ├── pet_shop/product_detail_screen.dart
    ├── cart/cart_screen.dart
    └── profile/profile_screen.dart
```

## 🎨 Design System

### Warna (dari `AppColors`)
- Primary: `#2FA6A0` (teal)
- Primary Dark: `#1E8B85`
- Secondary: `#FFA940` (orange)
- Background: `#F5F7F9`
- Card: `#FFFFFF`
- Text Dark: `#1E293B`
- Text Grey: `#64748B`
- Danger: `#E74C3C`

### Spacing (kelipatan 4)
- Pakai hanya: `4, 8, 12, 16, 20, 24, 32`
- Padding horizontal halaman: **16**
- Padding vertikal section: **20–24**
- Jarak antar card: **12**
- Jarak antar section: **24**

### Tipografi
- Judul section: `fontSize 16, w700, textDark`
- Subjudul: `fontSize 12, textGrey`
- Body: `fontSize 14, height 1.4`
- Harga: `fontSize 14, w700, primary`

### Radius
- Card: **16** | Button: **12** | Input: **12** | Thumbnail: **10**

## 📐 ATURAN LAYOUT (PALING SERING SALAH)

### 1. Constraint Web (WAJIB)
Web sangat lebar. Semua halaman **wajib** max width:

```dart
body: SafeArea(
  child: Center(
    child: ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 480),
      child: <konten>,
    ),
  ),
)
```

### 2. Overflow (garis kuning-hitam)
Setiap widget dengan tinggi tetap + teks **wajib**:
- Pakai `Expanded`/`Flexible`, atau
- Set `maxLines` + `overflow: TextOverflow.ellipsis`, atau
- Naikkan tinggi container

### 3. ListView dalam Column
- Horizontal → bungkus `SizedBox(height: X)`
- Vertikal → pakai `Expanded` atau `shrinkWrap: true`

### 4. Login Screen
Form login **jangan** nempel atas. Pakai `Center` + `SingleChildScrollView` + `ConstrainedBox(maxWidth: 420)`.

## 🖼️ GAMBAR — ATURAN KHUSUS

**MASALAH**: gambar dari `placehold.co`, `placekitten.com` **sering blank** di web dan bikin layout rusak.

**SOLUSI**: ganti semua `Image.network` jadi **icon-based placeholder**:

```dart
Container(
  height: 80,
  width: double.infinity,
  decoration: BoxDecoration(
    color: AppColors.primary.withValues(alpha: 0.1),
    borderRadius: BorderRadius.circular(12),
  ),
  child: const Icon(Icons.pets, color: AppColors.primary, size: 32),
)
```

Kalau tetap pakai `Image.network`, **WAJIB** ada `loadingBuilder` + `errorBuilder`.

## 🎯 CHECKOUT FLOW (FITUR BARU)

### Alur:
```
Cart → tombol "Checkout" → Payment Screen → tombol "Bayar"
  → Payment Success Screen → tombol "Kembali ke Home" → Home
```

### File baru yang harus dibuat:
- `lib/screens/cart/payment_screen.dart`
- `lib/screens/cart/payment_success_screen.dart`

### Route baru di `app_routes.dart`:
```dart
static const String payment = '/payment';
static const String paymentSuccess = '/payment-success';
```

### Aturan:
- Tetap **StatelessWidget**
- Metode pembayaran: list const (Transfer / E-Wallet / COD)
- Pilihan metode **visual saja** (satu di-highlight, tidak perlu berubah)
- Success screen: icon centang, ringkasan pesanan, tombol ke Home

## 🧪 CHECKLIST SEBELUM SELESAI

- [ ] `flutter analyze` **0 error, 0 warning**
- [ ] Tidak ada overflow di semua halaman
- [ ] Semua halaman punya `maxWidth: 480` di web
- [ ] Login screen **center** di layar
- [ ] Tidak ada `withOpacity` (harus `withValues`)
- [ ] Tidak ada `CardThemeData` (harus `CardTheme`)
- [ ] Tombol checkout → PaymentScreen
- [ ] PaymentScreen → PaymentSuccessScreen → Home
- [ ] Semua text bahasa Indonesia konsisten

## 🚫 ANTI-PATTERN

```dart
// ❌ Column tanpa constraint di web
Scaffold(body: Column(children: [...]))

// ✅ Benar
Scaffold(body: Center(child: ConstrainedBox(
  constraints: BoxConstraints(maxWidth: 480),
  child: Column(children: [...]),
)))

// ❌ withOpacity (deprecated)
color: AppColors.primary.withOpacity(0.1)

// ✅ Benar
color: AppColors.primary.withValues(alpha: 0.1)

// ❌ ListView di Column tanpa tinggi
Column(children: [ListView(...)])

// ✅ Benar
Column(children: [SizedBox(height: 120, child: ListView(...))])
```

## 📝 CARA KERJA

1. Baca `AGENTS.md` dan `docs/RULES.md` dulu
2. Edit **satu file** dulu, jangan batch
3. Setelah edit, jalankan `flutter analyze`
4. Kalau ada error, perbaiki dulu sebelum lanjut
5. Kerjakan sesuai urutan di `docs/RULES.md`