import 'package:flutter/material.dart';
import 'package:flutter_task/features/home/presentation/views/home_screen.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    super.key,
  });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
 
 
}

class _SplashScreenState extends State<SplashScreen> {
   @override
   void initState() {
    super.initState();
   Future.delayed( const Duration(seconds: 5),(){
       Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    });
   
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AspectRatio(
              aspectRatio: 1.5,
              child: Lottie.asset(
                'assets/animation/welcomeAnimation.json',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
