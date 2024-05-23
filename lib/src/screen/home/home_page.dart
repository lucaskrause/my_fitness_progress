import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:my_fitness_progress/src/components/card_person.dart';
import 'package:my_fitness_progress/src/components/default_bottom_navigation_bar.dart';
import 'package:my_fitness_progress/src/components/resume_fitness.dart';
import 'package:my_fitness_progress/src/controller/auth/auth_controller.dart';
import 'package:my_fitness_progress/src/controller/evaluation/evaluation_controller.dart';
import 'package:my_fitness_progress/src/screen/home/drawer_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AuthController authController = GetIt.I.get<AuthController>();
  EvaluationController controller = EvaluationController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: const Text('Início', style: TextStyle(color: Colors.white, fontSize: 24)),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      drawer: const DrawerPage(),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            CardPerson(),
            SizedBox(height: 20),
            ResumeFitness(),
          ],
        ),
      ),
      bottomNavigationBar: const DefaultBottomNavigationBar(index: 0),
    );
  }
}