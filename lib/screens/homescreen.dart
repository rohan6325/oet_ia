import 'package:flutter/material.dart';
import '../Models/constants.dart';
import '../Models/question_model.dart';
import '../widgets/question_widget.dart';
import '../widgets/next_buttor.dart';
import '../widgets/options_card.dart';
import '../widgets/result_box.dart';
import '../widgets/questions.dart'; // Import the quiz data

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  int score = 0;

  List<Map<String, dynamic>> questions = QuizData.questions;

  bool isPressed = false;
  bool isAlreadySelected = false;

  void nextQuestion(int questionLength) {
    if (index == questionLength - 1) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (ctx) => ResultBox(
          result: score,
          questionLength: questionLength,
          onPressed: startOver,
        ),
      );
    } else {
      if (isPressed) {
        setState(() {
          index++;
          isPressed = false;
          isAlreadySelected = false;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Please select any option'),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.symmetric(vertical: 20.0),
        ));
      }
    }
  }

  void checkAnswerAndUpdate(String selectedOption) {
    if (isAlreadySelected) {
      return;
    } else {
      if (selectedOption == questions[index]['correctOption']) {
        score++;
      }
      setState(() {
        isPressed = true;
        isAlreadySelected = true;
      });
    }
  }

  void startOver() {
    setState(() {
      index = 0;
      score = 0;
      isPressed = false;
      isAlreadySelected = false;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundOne,
      appBar: AppBar(
        title: const Text('Quiz App'),
        backgroundColor: backgroundOne,
        shadowColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(
              'Score: $score',
              style: const TextStyle(fontSize: 18.0),
            ),
          ),
        ],
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            QuestionWidget(
              indexAction: index,
              question: questions[index]['title'],
              totalQuestions: questions.length,
            ),
            const Divider(color: neutral),
            const SizedBox(height: 25.0),
            for (var option in questions[index]['options'].keys)
              GestureDetector(
                onTap: () => checkAnswerAndUpdate(option),
                child: OptionCard(
                  option: option,
                  color: isPressed
                      ? option == questions[index]['correctOption']
                          ? correct
                          : incorrect
                      : neutral,
                ),
              ),
          ],
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: () => nextQuestion(questions.length),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: NextButton(),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text('Landing Screen'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.pushReplacementNamed(context, '/');
              },
            ),
          ],
        ),
      ),
    );
  }
}
