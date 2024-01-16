import 'package:flutter/material.dart';

class QuestionWithAnswer {
  final String question;
  final List<Answer> answers;
  final String correctAnswer;

  QuestionWithAnswer({
    required this.question,
    required this.answers,
    required this.correctAnswer,
  });
}

class Answer {
  final String text;
  final IconData icon;

  Answer({required this.text, required this.icon});
}

List<QuestionWithAnswer> questionsWithAnswers = [
  QuestionWithAnswer(
    question: 'What\'s your favorite color?',
    answers: [
      Answer(
        text: 'Red',
        icon: Icons.circle,
      ),
      Answer(
        text: 'Green',
        icon: Icons.square,
      ),
      Answer(
        text: 'Yellow',
        icon: Icons.star,
      ),
      Answer(
        text: 'Blue',
        icon: Icons.train,
      ),
    ],
    correctAnswer: 'Red',
  ),
  QuestionWithAnswer(
    question: 'What\'s your favorite animal?',
    answers: [
      Answer(
        text: 'Rabbit',
        icon: Icons.add,
      ),
      Answer(
        text: 'Snake',
        icon: Icons.remove,
      ),
      Answer(
        text: 'Elephant',
        icon: Icons.face,
      ),
      Answer(
        text: 'Lion',
        icon: Icons.access_alarm,
      ),
    ],
    correctAnswer: 'Elephant',
  ),
  QuestionWithAnswer(
    question: 'Who\'s your favorite instructor?',
    answers: [
      Answer(
        text: 'Tarek',
        icon: Icons.add,
      ),
      Answer(
        text: 'Tarekk',
        icon: Icons.reorder_sharp,
      ),
      Answer(
        text: 'Tarekkk',
        icon: Icons.face,
      ),
      Answer(
        text: 'Tarekkkk',
        icon: Icons.access_alarm,
      ),
    ],
    correctAnswer: 'Tarek',
  ),
  QuestionWithAnswer(
    question: 'What\'s your favorite food?',
    answers: [
      Answer(
        text: 'Koshary',
        icon: Icons.food_bank,
      ),
      Answer(
        text: 'Pizza',
        icon: Icons.local_pizza,
      ),
      Answer(
        text: 'Pasta',
        icon: Icons.local_activity,
      ),
      Answer(
        text: 'Burger',
        icon: Icons.fastfood,
      ),
    ],
    correctAnswer: 'Koshary',
  ),
];
