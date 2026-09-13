import 'package:flutter/material.dart';

import '../screens/splash/splash_screen.dart';
import '../screens/login/login_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/my_pet/my_pet_screen.dart';
import '../screens/my_pet/health_record_screen.dart';
import '../screens/consultation/consultation_screen.dart';
import '../screens/consultation/doctor_list_screen.dart';
import '../screens/booking_klinik/booking_klinik_screen.dart';
import '../screens/grooming/grooming_screen.dart';
import '../screens/pet_shop/pet_shop_screen.dart';
import '../screens/pet_shop/product_detail_screen.dart';
import '../screens/cart/cart_screen.dart';
import '../screens/cart/payment_screen.dart';
import '../screens/cart/payment_success_screen.dart';
import '../screens/profile/profile_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String login = '/login';
  static const String home = '/home';
  static const String myPet = '/my-pet';
  static const String healthRecord = '/health-record';
  static const String consultation = '/consultation';
  static const String doctorList = '/doctor-list';
  static const String bookingKlinik = '/booking-klinik';
  static const String grooming = '/grooming';
  static const String petShop = '/pet-shop';
  static const String productDetail = '/product-detail';
  static const String cart = '/cart';
  static const String payment = '/payment';
  static const String paymentSuccess = '/payment-success';
  static const String profile = '/profile';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case myPet:
        return MaterialPageRoute(builder: (_) => const MyPetScreen());
      case healthRecord:
        return MaterialPageRoute(builder: (_) => const HealthRecordScreen());
      case consultation:
        return MaterialPageRoute(builder: (_) => const ConsultationScreen());
      case doctorList:
        return MaterialPageRoute(builder: (_) => const DoctorListScreen());
      case bookingKlinik:
        return MaterialPageRoute(builder: (_) => const BookingKlinikScreen());
      case grooming:
        return MaterialPageRoute(builder: (_) => const GroomingScreen());
      case petShop:
        return MaterialPageRoute(builder: (_) => const PetShopScreen());
      case productDetail:
        return MaterialPageRoute(builder: (_) => const ProductDetailScreen());
      case cart:
        return MaterialPageRoute(builder: (_) => const CartScreen());
      case payment:
        return MaterialPageRoute(builder: (_) => const PaymentScreen());
      case paymentSuccess:
        return MaterialPageRoute(builder: (_) => const PaymentSuccessScreen());
      case profile:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Halaman tidak ditemukan')),
          ),
        );
    }
  }
}