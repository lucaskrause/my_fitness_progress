import 'package:flutter/material.dart';
import 'package:my_fitness_progress/src/models/evaluation.dart';

class CardEvaluation extends StatefulWidget {
  final int index;
  final Evaluation evaluation;

  const CardEvaluation(this.index, this.evaluation, {super.key});

  @override
  State<CardEvaluation> createState() => _CardEvaluationState();
}

class _CardEvaluationState extends State<CardEvaluation> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).cardColor,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${widget.index+1}ª Avaliação',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              'Peso: ${widget.evaluation.pesoAtual} kg',
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 5),
            Text(
              'Percentual de gordura: ${widget.evaluation.percentFat} %',
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}