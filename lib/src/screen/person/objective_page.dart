import 'package:flutter/material.dart';

class ObjectivePage extends StatefulWidget {
  const ObjectivePage({super.key});

  @override
  State<ObjectivePage> createState() => _ObjectivePageState();
}

class _ObjectivePageState extends State<ObjectivePage> {
  double weight = 0;
  double percentFat = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 0,
        title: const Text('Objetivo', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Peso', style: TextStyle(color: Colors.white)),
                  const SizedBox(height: 5),
                  Container(
                    color: Theme.of(context).cardColor,
                    child: TextField(
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      cursorColor: Colors.white,
                      style: const TextStyle(color: Colors.white),
                      onChanged: (value) {
                        setState(() {
                          weight = double.parse(value);
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text('Percentual de gordura', style: TextStyle(color: Colors.white)),
                  const SizedBox(height: 5),
                  Container(
                    color: Theme.of(context).cardColor,
                    child: TextField(
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      cursorColor: Colors.white,
                      style: const TextStyle(color: Colors.white),
                      onChanged: (value) {
                        setState(() {
                          percentFat = double.parse(value);
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop({'weight': weight, 'percentFat': percentFat});
              },
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