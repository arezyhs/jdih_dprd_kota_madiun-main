import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'screens/main_menu.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'JDIH DPRD Kota Madiun',
      home: AnimatedSplashScreen(
        splash: 'assets/img/splash.gif',
        nextScreen: MainMenu(),
        duration: 3000,
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.fade,
        splashIconSize: double.infinity,
        backgroundColor: const Color(0xffe5e5e5),
      ),
    );
  }
}
