import 'package:flutter/material.dart';
import 'package:my_fitness_progress/src/controller/evaluation/evaluation_controller.dart';
import 'package:my_fitness_progress/src/models/evaluation.dart';
import 'package:my_fitness_progress/src/utils/helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NewEvaluationPage extends StatefulWidget {
  final bool isFirst;

  const NewEvaluationPage({this.isFirst = false, super.key});

  @override
  State<NewEvaluationPage> createState() => _NewEvaluationPageState();
}

class _NewEvaluationPageState extends State<NewEvaluationPage> {
  EvaluationController controller = EvaluationController();
  TextEditingController alturaController = TextEditingController();
  TextEditingController pesoController = TextEditingController();
  TextEditingController imcController = TextEditingController();
  TextEditingController classImcController = TextEditingController();
  TextEditingController classFatController = TextEditingController();
  TextEditingController fatMassController = TextEditingController();

  Future<void> init() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? altura = prefs.getInt("height");
    controller.evaluation!.altura = altura.toString();
    alturaController.text = altura!.toString();

    if (widget.isFirst) {
      double? peso = prefs.getDouble("weight");
      controller.evaluation!.pesoAtual = peso.toString();
      pesoController.text = peso!.toString();

      Map imc = Helper.calculaIMC(altura, peso);
      controller.evaluation!.imc = double.parse(imc["imc"]);
      imcController.text = imc["imc"];
      controller.evaluation!.classImc = imc["classification"];
      classImcController.text = imc["classification"];
    }
  }

  @override
  void initState() {
    controller.evaluation = Evaluation();
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 0,
        title: const Text(
          'Nova Avaliação',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
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
                controller: alturaController,
                readOnly: true,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                ),
                cursorColor: Colors.white,
                style: const TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            const Text('Peso atual (kg)', style: TextStyle(color: Colors.white)),
            const SizedBox(height: 5),
            Container(
              color: Theme.of(context).cardColor,
              child: TextField(
                controller: pesoController,
                readOnly: widget.isFirst,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                ),
                cursorColor: Colors.white,
                style: const TextStyle(color: Colors.white),
                onChanged: (value) {
                  controller.evaluation!.pesoAtual = value;

                  int alt = int.parse(controller.evaluation!.altura!);
                  Map imc = Helper.calculaIMC(alt, double.parse(value));
                  controller.evaluation!.imc = double.parse(imc["imc"]);
                  imcController.text = imc["imc"];
                  controller.evaluation!.classImc = imc["classification"];
                  classImcController.text = imc["classification"];
                },
              ),
            ),
            const SizedBox(height: 20),
            const Text('IMC (Kg/m²)', style: TextStyle(color: Colors.white)),
            const SizedBox(height: 5),
            Container(
              color: Theme.of(context).cardColor,
              child: TextField(
                controller: imcController,
                readOnly: true,
                cursorColor: Colors.white,
                style: const TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            const Text('Classif. do IMC', style: TextStyle(color: Colors.white)),
            const SizedBox(height: 5),
            Container(
              color: Theme.of(context).cardColor,
              child: TextField(
                controller: classImcController,
                readOnly: true,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                ),
                cursorColor: Colors.white,
                style: const TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            const Text('Percentual de Gordura (%)', style: TextStyle(color: Colors.white)),
            const SizedBox(height: 5),
            Container(
              color: Theme.of(context).cardColor,
              child: TextField(
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                ),
                cursorColor: Colors.white,
                style: const TextStyle(color: Colors.white),
                onChanged: (value) {
                  controller.evaluation!.percentFat = value;

                  String classFat = Helper.classificacaoGordura(double.parse(value));
                  controller.evaluation!.classFat = classFat;
                  classFatController.text = classFat;
                  
                  double fatMass = double.parse(value) * double.parse(pesoController.text) / 100;
                  controller.evaluation!.fatKg = fatMass.toStringAsFixed(2).toString();
                  fatMassController.text = fatMass.toStringAsFixed(2).toString();
                },
              ),
            ),
            const SizedBox(height: 20),
            const Text('Classif. % de Gordura', style: TextStyle(color: Colors.white)),
            const SizedBox(height: 5),
            Container(
              color: Theme.of(context).cardColor,
              child: TextField(
                controller: classFatController,
                readOnly: true,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                ),
                cursorColor: Colors.white,
                style: const TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            const Text('Massa de Gordura (Kg)', style: TextStyle(color: Colors.white)),
            const SizedBox(height: 5),
            Container(
              color: Theme.of(context).cardColor,
              child: TextField(
                controller: fatMassController,
                readOnly: true,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                ),
                cursorColor: Colors.white,
                style: const TextStyle(color: Colors.white),
                onChanged: (value) {
                  controller.evaluation!.fatKg = value;
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
              onPressed: () {
                controller.saveEvaluation();
                Navigator.of(context).pop();
              },
              child: const Text(
                'Salvar avaliação',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
