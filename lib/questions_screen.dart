import 'package:flutter/material.dart';

import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/quiz.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  @override
  Widget build(context) {
    final currentQuestion = questions[0];

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
              style: const TextStyle(
                color: Colors.white,
                fontSize: 17,
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
            ...currentQuestion.answer.map(
              (answer) {
                return AnswerButton(answerText: answer, onTap: () {});
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
