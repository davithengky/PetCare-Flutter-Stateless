import 'package:flutter/material.dart';
import '../../routes/app_routes.dart';
import '../../theme/app_theme.dart';

class PaymentScreen extends StatelessWidget {
  final String itemName;
  final int subtotal;
  final int shippingFee;

  const PaymentScreen({
    super.key,
    this.itemName = 'Belanja Pet Shop',
    this.subtotal = 140000,
    this.shippingFee = 15000,
  });

  int get total => subtotal + shippingFee;

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
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const Text('Ringkasan Pesanan',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15)),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: AppColors.card,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Column(
                children: [
                  _SummaryRow(label: itemName, value: formatRupiah(subtotal)),
                  const SizedBox(height: 8),
                  _SummaryRow(label: 'Ongkir', value: formatRupiah(shippingFee)),
                  const Divider(height: 20),
                  _SummaryRow(
                      label: 'Total', value: formatRupiah(total), bold: true),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text('Metode Pembayaran',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15)),
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
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            height: 48,
            child: ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (_) => _PaymentSuccessDialog(
                    total: total,
                    method: 'Transfer Bank',
                  ),
                );
              },
              child: const Text('Bayar Sekarang'),
            ),
          ),
        ),
      ),
    );
  }
}

/// Format angka jadi "Rp95.000" tanpa perlu package intl.
String formatRupiah(int value) {
  final str = value.toString();
  final buffer = StringBuffer();
  for (int i = 0; i < str.length; i++) {
    final posFromRight = str.length - i;
    buffer.write(str[i]);
    if (posFromRight > 1 && posFromRight % 3 == 1) {
      buffer.write('.');
    }
  }
  return 'Rp${buffer.toString()}';
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
      children: [
        Expanded(child: Text(label, style: style, overflow: TextOverflow.ellipsis)),
        const SizedBox(width: 8),
        Text(value, style: style),
      ],
    );
  }
}

class _PaymentMethodCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String sub;
  final bool selected;
  const _PaymentMethodCard(
      {required this.icon, required this.label, required this.sub, this.selected = false});

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
            width: 40,
            height: 40,
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

class _PaymentSuccessDialog extends StatelessWidget {
  final int total;
  final String method;

  const _PaymentSuccessDialog({required this.total, required this.method});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 96,
              height: 96,
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.check_circle_rounded,
                  color: AppColors.primary, size: 64),
            ),
            const SizedBox(height: 20),
            const Text('Pembayaran Berhasil',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
            const SizedBox(height: 8),
            const Text(
              'Pesananmu sedang diproses dan akan segera dikirim.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 13, color: AppColors.textGrey),
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.card,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Column(
                children: [
                  const _DialogRow(label: 'Order ID', value: '#PC-20260915-001'),
                  const SizedBox(height: 8),
                  _DialogRow(label: 'Total', value: formatRupiah(total)),
                  const SizedBox(height: 8),
                  _DialogRow(label: 'Metode', value: method),
                  const SizedBox(height: 8),
                  const _DialogRow(label: 'Status', value: 'Menunggu Konfirmasi'),
                ],
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushNamedAndRemoveUntil(
                      context, AppRoutes.home, (r) => false);
                },
                child: const Text('Kembali ke Home'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DialogRow extends StatelessWidget {
  final String label;
  final String value;
  const _DialogRow({required this.label, required this.value});

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
