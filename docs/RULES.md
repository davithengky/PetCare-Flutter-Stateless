# RULES.md — Detail Teknis PetCare

Pelengkap `AGENTS.md`. Baca keduanya sebelum mulai.

## 1. Template Scaffold Standar

```dart
@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(...),
    bottomNavigationBar: const BottomNavBar(currentIndex: X),
    body: SafeArea(
      top: false,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 480),
          child: <konten>,
        ),
      ),
    ),
  );
}
```

**Pengecualian**: SplashScreen (full screen warna primary), LoginScreen (pola form terpusat).

## 2. LoginScreen — Fix Center

```dart
@override
Widget build(BuildContext context) {
  return Scaffold(
    body: SafeArea(
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 420),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Icon(Icons.pets_rounded, color: AppColors.primary, size: 64),
                const SizedBox(height: 24),
                const Text(
                  'Selamat Datang di PetCare',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700, color: AppColors.textDark),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Masuk untuk mulai merawat hewan peliharaanmu',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 13, color: AppColors.textGrey),
                ),
                const SizedBox(height: 40),
                const TextField(decoration: InputDecoration(hintText: 'Email', prefixIcon: Icon(Icons.email_outlined))),
                const SizedBox(height: 16),
                const TextField(obscureText: true, decoration: InputDecoration(hintText: 'Password', prefixIcon: Icon(Icons.lock_outline))),
                const SizedBox(height: 24),
                SizedBox(height: 48, child: ElevatedButton(onPressed: () {}, child: const Text('Login'))),
                const SizedBox(height: 12),
                TextButton(onPressed: () {}, child: const Text('Masuk sebagai Tamu')),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
```

## 3. ServiceCard — Fix Overflow

```dart
class ServiceCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const ServiceCard({super.key, required this.icon, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 84,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 52, height: 52,
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Icon(icon, color: AppColors.primary, size: 26),
                ),
                const SizedBox(height: 8),
                Text(
                  label,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 11, height: 1.2, color: AppColors.textDark),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
```

ListView horizontal di Home:
```dart
SizedBox(
  height: 108,
  child: ListView.separated(
    scrollDirection: Axis.horizontal,
    padding: const EdgeInsets.symmetric(horizontal: 16),
    itemCount: services.length,
    separatorBuilder: (_, __) => const SizedBox(width: 8),
    itemBuilder: (context, i) => services[i],
  ),
)
```

## 4. PetCard — Fix Overflow

```dart
class PetCard extends StatelessWidget {
  final Pet pet;
  final VoidCallback? onTap;

  const PetCard({super.key, required this.pet, this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      child: Material(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    height: 80, width: double.infinity,
                    color: AppColors.primary.withValues(alpha: 0.1),
                    child: const Icon(Icons.pets, color: AppColors.primary, size: 32),
                  ),
                ),
                const SizedBox(height: 8),
                Text(pet.name, maxLines: 1, overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13, color: AppColors.textDark)),
                const SizedBox(height: 2),
                Text(pet.breed, maxLines: 1, overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 11, color: AppColors.textGrey)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
```

## 5. BottomNavBar — Rapikan

```dart
class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  const BottomNavBar({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (i) => _onTap(context, i),
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          elevation: 0,
          selectedItemColor: AppColors.primary,
          unselectedItemColor: AppColors.textGrey,
          selectedFontSize: 11,
          unselectedFontSize: 11,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.pets_rounded), label: 'My Pet'),
            BottomNavigationBarItem(icon: Icon(Icons.storefront_rounded), label: 'Shop'),
            BottomNavigationBarItem(icon: Icon(Icons.calendar_month_rounded), label: 'Booking'),
            BottomNavigationBarItem(icon: Icon(Icons.person_rounded), label: 'Profile'),
          ],
        ),
      ),
    );
  }

  void _onTap(BuildContext context, int index) {
    if (index == currentIndex) return;
    late String route;
    switch (index) {
      case 0: route = AppRoutes.home; break;
      case 1: route = AppRoutes.myPet; break;
      case 2: route = AppRoutes.petShop; break;
      case 3: route = AppRoutes.bookingKlinik; break;
      case 4: route = AppRoutes.profile; break;
      default: route = AppRoutes.home;
    }
    Navigator.pushReplacementNamed(context, route);
  }
}
```

## 6. GridView Pet Shop

```dart
GridView.builder(
  padding: const EdgeInsets.all(16),
  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    mainAxisSpacing: 12,
    crossAxisSpacing: 12,
    childAspectRatio: 0.68,
  ),
  itemCount: DummyData.products.length,
  itemBuilder: (context, index) => _ProductCard(product: DummyData.products[index]),
)
```

## 7. Checkout Flow — 3 File Baru

### 7.1 Update `AppRoutes`

Tambah:
```dart
static const String payment = '/payment';
static const String paymentSuccess = '/payment-success';
```

Di `generateRoute`:
```dart
case payment:
  return MaterialPageRoute(builder: (_) => const PaymentScreen());
case paymentSuccess:
  return MaterialPageRoute(builder: (_) => const PaymentSuccessScreen());
```

Tambah import:
```dart
import '../screens/cart/payment_screen.dart';
import '../screens/cart/payment_success_screen.dart';
```

### 7.2 `lib/screens/cart/payment_screen.dart`

```dart
import 'package:flutter/material.dart';
import '../../routes/app_routes.dart';
import '../../theme/app_theme.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  static const _methods = [
    {'icon': Icons.account_balance_outlined, 'label': 'Transfer Bank', 'sub': 'BCA, Mandiri, BNI'},
    {'icon': Icons.account_balance_wallet_outlined, 'label': 'E-Wallet', 'sub': 'GoPay, OVO, Dana'},
    {'icon': Icons.payments_outlined, 'label': 'COD', 'sub': 'Bayar di tempat'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pembayaran')),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 480),
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                const Text('Ringkasan Pesanan', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15)),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: AppColors.card,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.grey.shade200),
                  ),
                  child: const Column(
                    children: [
                      _SummaryRow(label: 'Subtotal', value: 'Rp140.000'),
                      SizedBox(height: 8),
                      _SummaryRow(label: 'Ongkir', value: 'Rp15.000'),
                      Divider(height: 20),
                      _SummaryRow(label: 'Total', value: 'Rp155.000', bold: true),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                const Text('Metode Pembayaran', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15)),
                const SizedBox(height: 12),
                ..._methods.map((m) => _PaymentMethodCard(
                  icon: m['icon'] as IconData,
                  label: m['label'] as String,
                  sub: m['sub'] as String,
                  selected: m['label'] == 'Transfer Bank',
                )),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            height: 48,
            child: ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, AppRoutes.paymentSuccess),
              child: const Text('Bayar Sekarang'),
            ),
          ),
        ),
      ),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  final String label;
  final String value;
  final bool bold;
  const _SummaryRow({required this.label, required this.value, this.bold = false});

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(
      fontSize: bold ? 15 : 13,
      fontWeight: bold ? FontWeight.w700 : FontWeight.w500,
      color: bold ? AppColors.textDark : AppColors.textGrey,
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Text(label, style: style), Text(value, style: style)],
    );
  }
}

class _PaymentMethodCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String sub;
  final bool selected;
  const _PaymentMethodCard({required this.icon, required this.label, required this.sub, this.selected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: selected ? AppColors.primary : Colors.grey.shade200,
          width: selected ? 1.5 : 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 40, height: 40,
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: AppColors.primary, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13)),
                Text(sub, style: const TextStyle(fontSize: 11, color: AppColors.textGrey)),
              ],
            ),
          ),
          Icon(
            selected ? Icons.radio_button_checked : Icons.radio_button_off,
            color: selected ? AppColors.primary : Colors.grey.shade400,
            size: 20,
          ),
        ],
      ),
    );
  }
}
```

### 7.3 `lib/screens/cart/payment_success_screen.dart`

```dart
import 'package:flutter/material.dart';
import '../../routes/app_routes.dart';
import '../../theme/app_theme.dart';

class PaymentSuccessScreen extends StatelessWidget {
  const PaymentSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 480),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 96, height: 96,
                    decoration: BoxDecoration(
                      color: AppColors.primary.withValues(alpha: 0.1),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.check_circle_rounded, color: AppColors.primary, size: 64),
                  ),
                  const SizedBox(height: 24),
                  const Text('Pembayaran Berhasil', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 8),
                  const Text(
                    'Pesananmu sedang diproses dan akan segera dikirim.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 13, color: AppColors.textGrey),
                  ),
                  const SizedBox(height: 24),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.card,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.grey.shade200),
                    ),
                    child: const Column(
                      children: [
                        _Row(label: 'Order ID', value: '#PC-20260912-001'),
                        SizedBox(height: 8),
                        _Row(label: 'Total', value: 'Rp155.000'),
                        SizedBox(height: 8),
                        _Row(label: 'Metode', value: 'Transfer Bank'),
                        SizedBox(height: 8),
                        _Row(label: 'Status', value: 'Menunggu Konfirmasi'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () => Navigator.pushNamedAndRemoveUntil(context, AppRoutes.home, (r) => false),
                      child: const Text('Kembali ke Home'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Row extends StatelessWidget {
  final String label;
  final String value;
  const _Row({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(fontSize: 12, color: AppColors.textGrey)),
        Text(value, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
      ],
    );
  }
}
```

### 7.4 Update `cart_screen.dart`

Ganti tombol checkout:
```dart
ElevatedButton(
  onPressed: () => Navigator.pushNamed(context, AppRoutes.payment),
  child: const Text('Checkout'),
)
```

## 8. Urutan Pengerjaan (WAJIB IKUTI)

1. `lib/theme/app_theme.dart` — fix `CardThemeData` → `CardTheme`
2. `lib/widgets/bottom_nav_bar.dart`
3. `lib/widgets/service_card.dart`
4. `lib/widgets/pet_card.dart`
5. `lib/widgets/section_title.dart`
6. `lib/screens/login/login_screen.dart`
7. `lib/screens/splash/splash_screen.dart`
8. `lib/screens/home/home_screen.dart`
9. `lib/screens/my_pet/my_pet_screen.dart`
10. `lib/screens/my_pet/health_record_screen.dart`
11. `lib/screens/consultation/consultation_screen.dart`
12. `lib/screens/consultation/doctor_list_screen.dart`
13. `lib/screens/booking_klinik/booking_klinik_screen.dart`
14. `lib/screens/grooming/grooming_screen.dart`
15. `lib/screens/pet_shop/pet_shop_screen.dart`
16. `lib/screens/pet_shop/product_detail_screen.dart`
17. `lib/screens/cart/cart_screen.dart`
18. `lib/routes/app_routes.dart` — tambah route payment & success
19. `lib/screens/cart/payment_screen.dart` — **FILE BARU**
20. `lib/screens/cart/payment_success_screen.dart` — **FILE BARU**

Setelah semua selesai:
```bash
flutter analyze
flutter run -d chrome
```

## 9. Setelah Selesai

Laporkan ke user dalam format:
```
✅ Selesai:
- [list file yang diubah]
- [fitur baru: payment + success screen]

⚠️ Perlu dicek:
- [hal yang butuh konfirmasi user]

🧪 Test:
- flutter analyze → 0 error
- Run di Chrome → OK
```