import 'package:flutter/material.dart';
import 'package:my_fitness_progress/src/components/card_evaluation.dart';
import 'package:my_fitness_progress/src/components/default_bottom_navigation_bar.dart';
import 'package:my_fitness_progress/src/controller/evaluation/evaluation_controller.dart';

class ListEvaluationPage extends StatefulWidget {
  const ListEvaluationPage({super.key});

  @override
  State<ListEvaluationPage> createState() => _ListEvaluationPageState();
}

class _ListEvaluationPageState extends State<ListEvaluationPage> {
  EvaluationController controller = EvaluationController();
  bool loading = false;

  @override
  void initState() {
    loading = true;
    while (loading) {
      if (controller.evaluationList.isNotEmpty) {
        setState(() {
          loading = false;
        });
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            const Text('Avaliações Físicas', style: TextStyle(color: Colors.white, fontSize: 24)),
            const SizedBox(height: 30),
            Builder(
              builder: (_) {
                if (loading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return ListView.builder(
                  itemCount: controller.evaluationList.length,
                  itemBuilder: (_, index) {
                    return CardEvaluation(controller.evaluationList[index]);
                  },
                ); 
              }
            ),
          ],
        ),
      ),
      bottomNavigationBar: const DefaultBottomNavigationBar(index: 1),
    );
  }
}