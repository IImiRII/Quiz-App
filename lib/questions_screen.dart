import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectedAnswer});

  final void Function(String answer) onSelectedAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectedAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity, // mumkun oldugunca genis yer kapla
      child: Container(
        margin: const EdgeInsets.all(40), // tum yonlere ayi margin ekler
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment:
              CrossAxisAlignment.stretch, // tum sutunlari kaplar
          // butonlarin genisligi padding, butonlar arasi bosluk margin
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 201, 153, 251),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            // map orijinal listeyi kopyalar ve girdigin parametre ve islevlerle islem yapar (copy).

            // ... => const numbers = [1, 2, 3]; const moreNum = [numbers, 4]; output = [[1,2,3], 4]
            // const moreNum = [...numbers, 4]; output = [1, 2, 3, 4]
            // bu islemi listenin icinde lsite oldugu icin yaptik cunku children listenin icinde liste kabul etmiyor.
            ...currentQuestion.getShuffledAnswers().map(
              (answer) {
                return AnswerButton(
                  answerText: answer,
                  onTap: () {
                    answerQuestion(answer);
                  },
                );
              },
            ),
            /*
            AnswerButton(
              answerText: currentQuestion.answer[0],
              onTap: () {},
            ),
            AnswerButton(
              answerText: currentQuestion.answer[1],
              onTap: () {},
            ),
            AnswerButton(
              answerText: currentQuestion.answer[2],
              onTap: () {},
            ),
            AnswerButton(
              answerText: currentQuestion.answer[3],
              onTap: () {},
            ),
             */
          ],
        ),
      ),
    );
  }
}
