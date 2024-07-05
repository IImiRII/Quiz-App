import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  /*
  Widget? activeScreen;

  @override
  void initState() {
    super.initState();
    activeScreen = StartScreen(switchScreen);
  }


  void switchScreen() {
    setState(() {
      activeScreen = const QuestionsScreen();
    });
  }
   */

  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(context) {
    /*
    final screenWidget = activeScreen == 'start-screen'
        ? StartScreen(switchScreen) 
        : const QuestionsScreen();
     */

    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      screenWidget = const QuestionsScreen();
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 58, 2, 154),
                Color.fromARGB(184, 55, 4, 143),
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomRight,
            ),
          ),
          //child: activeScreen,
          child: screenWidget,
        ),
      ),
    );
  }
}
