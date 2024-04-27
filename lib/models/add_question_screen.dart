import 'package:flutter/material.dart';
import 'package:quiz_app_tutorial/models/question.dart';

class AddQuestionScreen extends StatefulWidget {
  final Function(Question) addQuestion;

  const AddQuestionScreen({
    super.key,
    required this.addQuestion,
  });

  @override
  _AddQuestionScreenState createState() => _AddQuestionScreenState();
}

class _AddQuestionScreenState extends State<AddQuestionScreen> {
  final _questionController = TextEditingController();
  final _option1Controller = TextEditingController();
  final _option2Controller = TextEditingController();
  final _option3Controller = TextEditingController();
  final _option4Controller = TextEditingController();
  int? _correctAnswerIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Question'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _questionController,
              decoration: const InputDecoration(
                labelText: 'Question',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _option1Controller,
              decoration: const InputDecoration(
                labelText: 'Option 1',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _option2Controller,
              decoration: const InputDecoration(
                labelText: 'Option 2',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _option3Controller,
              decoration: const InputDecoration(
                labelText: 'Option 3',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _option4Controller,
              decoration: const InputDecoration(
                labelText: 'Option 4',
              ),
            ),
            const SizedBox(height: 16),
            DropdownButton<int>(
              value: _correctAnswerIndex,
              onChanged: (value) {
                setState(() {
                  _correctAnswerIndex = value;
                });
              },
              items: const [
                DropdownMenuItem(
                  value: 0,
                  child: Text('Option 1'),
                ),
                DropdownMenuItem(
                  value: 1,
                  child: Text('Option 2'),
                ),
                DropdownMenuItem(
                  value: 2,
                  child: Text('Option 3'),
                ),
                DropdownMenuItem(
                  value: 3,
                  child: Text('Option 4'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (_questionController.text.isNotEmpty &&
                    _option1Controller.text.isNotEmpty &&
                    _option2Controller.text.isNotEmpty &&
                    _option3Controller.text.isNotEmpty &&
                    _option4Controller.text.isNotEmpty &&
                    _correctAnswerIndex != null) {
                  final newQuestion = Question(
                    question: _questionController.text,
                    correctAnswerIndex: _correctAnswerIndex!,
                    options: [
                      _option1Controller.text,
                      _option2Controller.text,
                      _option3Controller.text,
                      _option4Controller.text,
                    ],
                  );

                  // Add the new question to the questions list
                  widget.addQuestion(newQuestion);

                  Navigator.pop(context);
                }
              },
              child: const Text('Add Question'),
            ),
          ],
        ),
      ),
    );
  }
}
