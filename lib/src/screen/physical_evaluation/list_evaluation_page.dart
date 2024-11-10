import 'package:flutter/material.dart';
import 'package:my_fitness_progress/src/components/card_evaluation.dart';
import 'package:my_fitness_progress/src/components/default_bottom_navigation_bar.dart';
import 'package:my_fitness_progress/src/controller/evaluation/evaluation_controller.dart';
import 'package:my_fitness_progress/src/screen/physical_evaluation/new_evaluation_page.dart';

class ListEvaluationPage extends StatefulWidget {
  const ListEvaluationPage({super.key});

  @override
  State<ListEvaluationPage> createState() => _ListEvaluationPageState();
}

class _ListEvaluationPageState extends State<ListEvaluationPage> {
  EvaluationController controller = EvaluationController();
  bool loading = false;

  void loadList() {
    setState(() {
      loading = true;
    });
    controller.getListEvaluations().then((value) {
      setState(() {
        loading = false;
      });
    });
  }

  @override
  void initState() {
    loadList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => const NewEvaluationPage()
          ));
          loadList();
        },
        child: const Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            const Text(
              'Avaliações Físicas',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
            Builder(
              builder: (_) {
                if (loading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (controller.evaluationList.isEmpty) {
                  return const Text("Nenhuma avaliação cadastrada!");
                }

                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.evaluationList.length,
                  itemBuilder: (_, index) {
                    return CardEvaluation(index, controller.evaluationList[index]);
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