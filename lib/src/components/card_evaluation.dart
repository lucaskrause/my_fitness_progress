import 'package:flutter/material.dart';
import 'package:my_fitness_progress/src/models/evaluation.dart';

class CardEvaluation extends StatefulWidget {
  final Evaluation evaluation;

  const CardEvaluation(this.evaluation, {super.key});

  @override
  State<CardEvaluation> createState() => _CardEvaluationState();
}

class _CardEvaluationState extends State<CardEvaluation> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).cardColor,
      child: const Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('1ª Avaliação', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            Text(
              'Peso: 73.3kg',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 10),
            Text(
              'Percentual de gordura: 23%',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}