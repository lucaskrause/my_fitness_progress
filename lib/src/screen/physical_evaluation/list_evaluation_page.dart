import 'package:flutter/material.dart';
import 'package:my_fitness_progress/src/components/default_bottom_navigation_bar.dart';
import 'package:my_fitness_progress/src/controller/evaluation/evaluation_controller.dart';

class ListEvaluationPage extends StatefulWidget {
  const ListEvaluationPage({super.key});

  @override
  State<ListEvaluationPage> createState() => _ListEvaluationPageState();
}

class _ListEvaluationPageState extends State<ListEvaluationPage> {
  EvaluationController controller = EvaluationController();

  @override
  void initState() {
    // TODO: Recuperar lista de avaliações do banco
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Theme.of(context).colorScheme.surface,
      //   elevation: 0,
      //   title: const Text('Avaliações Físicas', style: TextStyle(color: Colors.white),),
      //   centerTitle: true,
      //   iconTheme: const IconThemeData(color: Colors.white),
      // ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(height: 40),
            const Text('Avaliações Físicas', style: TextStyle(color: Colors.white, fontSize: 24)),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: Card(
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
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Card(
                color: Theme.of(context).cardColor,
                child: const Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('2ª Avaliação', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                      Text(
                        'Peso: 71kg',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Percentual de gordura: 15.1%',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Card(
                color: Theme.of(context).cardColor,
                child: const Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('3ª Avaliação', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                      Text(
                        'Peso: 74.5kg',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Percentual de gordura: 15.1%',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const DefaultBottomNavigationBar(index: 1),
    );
  }
}