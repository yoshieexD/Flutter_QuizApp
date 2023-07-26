import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {Key? key}) : super(key: key);

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (data['user_answer'] == data['correct_answer'])
                          ? Colors.green
                          : Colors.red,
                    ),
                    child: Icon(
                      (data['user_answer'] == data['correct_answer'])
                          ? Icons.check
                          : Icons.close,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Question ${((data['question_index'] as int) + 1)}:',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          data['question'] as String,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black54,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Your Answer: ${data['user_answer']}',
                          style: TextStyle(
                            fontSize: 14,
                            color:
                                (data['user_answer'] == data['correct_answer'])
                                    ? Colors.green
                                    : Colors.red,
                          ),
                        ),
                        Text(
                          'Correct Answer: ${data['correct_answer']}',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
