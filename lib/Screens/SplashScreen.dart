import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gamerz_zone/Screens/HomeScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _imageLoaded = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await precacheImage(
        const AssetImage('assets/splash_screen_img.jpg'),
        context,
      );

      setState(() => _imageLoaded = true);

      await Future.delayed(const Duration(seconds: 2));

      if (!mounted) return;

      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.black12,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarDividerColor: Colors.transparent,
      ));

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_imageLoaded) {
      return const Scaffold(
        backgroundColor: Colors.black,
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/splash_screen_img.jpg',
              fit: BoxFit.cover,
            ),
          ),

          // Top Right Orange Glow
          Positioned(
            top: -120,
            right: -120,
            child: Container(
              width: 620,
              height: 620,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    Color(0xFFFF4B35),
                    Color(0x00FF6B35),
                  ],
                ),
              ),
            ),
          ),

          // Bottom Left Purple Glow
          Positioned(
            bottom: -120,
            left: -120,
            child: Container(
              width: 620,
              height: 620,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    Color(0xFF8B5CF6),
                    Color(0x007B0AF6),
                  ],
                ),
              ),
            ),
          ),

          // Blur overlay
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2.5, sigmaY: 2.5),
              child: Container(color: Colors.transparent),
            ),
          ),

          // Center Text
          const Align(
            alignment: Alignment(0, 0.25),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "A Little ",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: "Treat",
                      style: TextStyle(
                          color: Colors.purple, fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: " Won't",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: " HARM\n",
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: "Your ",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: "Pocket",
                      style: TextStyle(
                          color: Colors.orange, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 35,
                  height: 1.5,
                  shadows: [Shadow(color: Colors.black45, blurRadius: 10)],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
