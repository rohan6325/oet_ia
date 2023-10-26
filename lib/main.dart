import 'package:flutter/material.dart';
import './screens/homescreen.dart';
import './screens/landingScreen.dart';

void main() {
 
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => LandingScreen(),
        '/home': (context) => HomeScreen(),
      },
    );
  }
}
