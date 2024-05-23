import 'package:flutter/material.dart';
import 'package:my_fitness_progress/src/components/default_bottom_navigation_bar.dart';
import 'package:my_fitness_progress/src/screen/person/objective_page.dart';

class MyPersonPage extends StatefulWidget {
  const MyPersonPage({super.key});

  @override
  State<MyPersonPage> createState() => _MyPersonPageState();
}

class _MyPersonPageState extends State<MyPersonPage> {
  Map<String, dynamic>? objective;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: Theme.of(context).colorScheme.background,
      //   title: const Text('Perfil', style: TextStyle(color: Colors.white)),
      //   centerTitle: true,
      //   iconTheme: const IconThemeData(color: Colors.white),
      // ),
      backgroundColor: Theme.of(context).colorScheme.background,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var res = await Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const ObjectivePage())
          );

          setState(() {
            objective = res;
          });
        },
        backgroundColor: Theme.of(context).colorScheme.primary,
        tooltip: 'Adicionar objetivo',
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            const Center(
              child: Text('Perfil', style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            const SizedBox(height: 30),
            Card(
              color: Theme.of(context).cardColor,
              child: const Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          CircleAvatar(
                            maxRadius: 65,
                            backgroundColor: Colors.white,
                            child: Icon(Icons.person, size: 130, color: Colors.grey,),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Nome: \nLucas Guilherme Krause",
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Altura: \n1.74m",
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Peso inicial: \n73.3",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Objetivo(s)',
              style: TextStyle(color: Colors.white, fontSize: 24),
              textAlign: TextAlign.left,
            ),
            const Divider(),
            const SizedBox(height: 30),
            objective != null 
              ? SizedBox(
                  width: double.infinity,
                  child: Card(
                    color: Theme.of(context).cardColor,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Peso: ${objective!['weight']}kg',
                            style: const TextStyle(color: Colors.white),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Percentual de gordura: ${objective!['percentFat']}%',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
              )
              : const Center(
                child: Text(
                    'Nenhum objetivo definido.',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
              ),
          ],
        ),
      ),
      bottomNavigationBar: const DefaultBottomNavigationBar(index: 2),
    );
  }
}