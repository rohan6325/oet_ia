import 'package:flutter/material.dart';
import 'homescreen.dart'; // Import HomeScreen
import '../Models/constants.dart';
class LandingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundOne,
      appBar: AppBar(
        backgroundColor: backgroundOne,
        shadowColor: Colors.transparent,
        title: Text('Landing Screen'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            // Navigate to the HomeScreen when the card is tapped
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
          child: Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  title: Text('Enter Quiz'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
