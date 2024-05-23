import 'package:flutter/material.dart';
import 'package:my_fitness_progress/src/controller/evaluation/evaluation_controller.dart';

class NewEvaluationPage extends StatefulWidget {
  const NewEvaluationPage({super.key});

  @override
  State<NewEvaluationPage> createState() => _NewEvaluationPageState();
}

class _NewEvaluationPageState extends State<NewEvaluationPage> {
  EvaluationController controller = EvaluationController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
        title: const Text('Nova Avaliação', style: TextStyle(color: Colors.white),),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Análises básicas',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const Divider(),
            const SizedBox(height: 10),
            const Text('Altura (cm)', style: TextStyle(color: Colors.white)),
            const SizedBox(height: 5),
            Container(
              color: Theme.of(context).cardColor,
              child: TextField(
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                ),
                cursorColor: Colors.white,
                style: const TextStyle(color: Colors.white),
                onChanged: (value) {
                  controller.evaluation.altura = value;
                },
              ),
            ),
            const SizedBox(height: 20),
            const Text('Peso atual (kg)', style: TextStyle(color: Colors.white)),
            const SizedBox(height: 5),
            Container(
              color: Theme.of(context).cardColor,
              child: TextField(
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                ),
                cursorColor: Colors.white,
                style: const TextStyle(color: Colors.white),
                onChanged: (value) {
                  controller.evaluation.pesoAtual = value;
                },
              ),
            ),
            const SizedBox(height: 20),
            const Text('IMC (Kg/m²)', style: TextStyle(color: Colors.white)),
            const SizedBox(height: 5),
            Container(
              color: Theme.of(context).cardColor,
              child: const TextField(
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                ),
                cursorColor: Colors.white,
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            const Text('Classif. do IMC', style: TextStyle(color: Colors.white)),
            const SizedBox(height: 5),
            Container(
              color: Theme.of(context).cardColor,
              child: TextField(
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                ),
                cursorColor: Colors.white,
                style: const TextStyle(color: Colors.white),
                onChanged: (value) {
                  controller.evaluation.classImc = value;
                },
              ),
            ),
            const SizedBox(height: 20),
            const Text('Percentual de Gordura (%)', style: TextStyle(color: Colors.white)),
            const SizedBox(height: 5),
            Container(
              color: Theme.of(context).cardColor,
              child: TextField(
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                ),
                cursorColor: Colors.white,
                style: const TextStyle(color: Colors.white),
                onChanged: (value) {
                  controller.evaluation.percentFat = value;
                },
              ),
            ),
            const SizedBox(height: 20),
            const Text('Classif. % de Gordura', style: TextStyle(color: Colors.white)),
            const SizedBox(height: 5),
            Container(
              color: Theme.of(context).cardColor,
              child: TextField(
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                ),
                cursorColor: Colors.white,
                style: const TextStyle(color: Colors.white),
                onChanged: (value) {
                  controller.evaluation.classFat = value;
                },
              ),
            ),
            const SizedBox(height: 20),
            const Text('Massa de Gordura (Kg)', style: TextStyle(color: Colors.white)),
            const SizedBox(height: 5),
            Container(
              color: Theme.of(context).cardColor,
              child: TextField(
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                ),
                cursorColor: Colors.white,
                style: const TextStyle(color: Colors.white),
                onChanged: (value) {
                  controller.evaluation.fatKg = value;
                },
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Medidas antropométricas',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const Divider(),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await controller.saveEvaluation();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.onSecondaryContainer,
                minimumSize: const Size.fromHeight(50),
              ),
              child: const Text(
                'Salvar objetivo',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),
              )
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}