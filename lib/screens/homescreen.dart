import 'package:flutter/material.dart';
import '../Models/constants.dart';
import '../Models/question_model.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  List<Question> _questions =[
  Question(
    id: '1',
    title: 'What is Dart?',
    options: {
      'A programming language': true,
      'A type of dessert': false,
      'A type of bird': false,
      'A fruit': false,
    },
  ),
  Question(
    id: '2',
    title: 'What is Flutter?',
    options: {
      'A mobile app development framework': true,
      'A cooking technique': false,
      'A type of dance': false,
      'A sport': false,
    },
  ),
  Question(
    id: '3',
    title: 'What is a Widget in Flutter?',
    options: {
      'A UI component': true,
      'A type of food': false,
      'A type of vehicle': false,
      'A type of animal': false,
    },
  ),
  // Add more questions in the same format here...
];
int index =0;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: backgroundOne,
      appBar: AppBar(
        title: Text('Quiz App'),
        backgroundColor: backgroundOne,
        shadowColor: Colors.transparent,
      ),
    );
  }
}
