import 'package:flutter/material.dart';
import 'package:stripe_app/screens/complete_payment_screen.dart';
import 'package:stripe_app/screens/home_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'home',
      routes: {
        'home': (context) => const HomeScreen(),
        'complete_payment': (context) => const CompletePaymentScreen()
      },
      theme: ThemeData.light().copyWith(
        primaryColor: const Color(0XFF284879),
        scaffoldBackgroundColor: const Color(0XFF21232A)
      ),
    );
  }
}