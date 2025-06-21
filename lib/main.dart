import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'common/on_boarding_screen.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

   Future<bool> _isFirstTime() async {
    final prefs = await SharedPreferences.getInstance();
    return !(prefs.containsKey('skills') && prefs.containsKey('type') && prefs.containsKey('age'));
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        backgroundColor: Colors.purple
      ),
      home: FutureBuilder(future: _isFirstTime(),
       builder: (context,snapshot){
        if(!snapshot.hasData){
          return const SizedBox();// loading indicator can be added here
        }
                return snapshot.data! ? const OnboardingScreen() : const SplashScreen();
       }
       )
      // const SplashScreen()
    );
  }

}



