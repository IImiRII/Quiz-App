import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 19,
                  backgroundColor: const Color.fromARGB(255, 185, 20, 236),
                  child: Text(
                    ((data['quesiton_index'] as int) + 1).toString(),
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
                // typecasting, as 'data_type' kullandik cunku Flutter hangi tur olacagini bilemiyor cunku mapi Object olarak tanittik
                Expanded(
                  child: Column(
                    children: [
                      SizedBox(
                        child: Text(
                          data['question'] as String,
                          style: const TextStyle(
                            color: Color.fromARGB(255, 242, 238, 242),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        data['user_answer'] as String,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 214, 71, 219),
                        ),
                      ),
                      Text(
                        data['correct_answer'] as String,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 126, 173, 234),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
