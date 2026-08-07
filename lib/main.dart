import 'package:daily_helper_app/features/cheque_scan/presentation/screens/bank_record.dart';
import 'package:daily_helper_app/features/cheque_scan/presentation/screens/camera_screen.dart';
import 'package:daily_helper_app/routes/routes.dart';
//import 'package:daily_helper_app/screens/bankrecords_screen.dart';
import 'package:daily_helper_app/screens/menu_screen.dart';
import 'package:daily_helper_app/screens/vatcard_screen.dart';
import 'package:flutter/material.dart';
//import 'screens/home_screen.dart';

void main() {
  runApp(const WMMApp());
}

class WMMApp extends StatelessWidget {
  const WMMApp({super.key});

  static const String appName = 'WMM Helper';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),

      initialRoute: '/',

      routes: {
        AppRoutes.home: (context) => const MenuScreen(),
        AppRoutes.vatcard: (context) => const VatcardScreen(),
        AppRoutes.bankrecords: (context) => const BankRecord(),
        AppRoutes.scancheque: (context) => CameraScreen(),
      },
    );
  }
}
