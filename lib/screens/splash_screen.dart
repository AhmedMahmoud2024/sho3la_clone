import 'package:flutter/material.dart';
import 'package:sho3la_clone/screens/main_screen/main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
 
 @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 3000),(){
      Navigator.pushReplacement(
        context,
         MaterialPageRoute(builder: (context)=>const MainScreen())
         );
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: Image.asset(
          'assets/brain.png',
          width: 200,
          height: 200,
          color: Colors.white,
             fit: BoxFit.contain,
        ),
      ),
    );
  }
}