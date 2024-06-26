import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:my_fitness_progress/src/controller/auth/auth_controller.dart';

class CardPerson extends StatefulWidget {
  const CardPerson({super.key});

  @override
  State<CardPerson> createState() => _CardPersonState();
}

class _CardPersonState extends State<CardPerson> {
  AuthController authController = GetIt.I.get<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).cardColor,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Nome: ', style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold)),
                Text(authController.user.name, style: const TextStyle(fontSize: 16, color: Colors.white)),
              ],
            ),
            const SizedBox(height: 5),
            const Divider(color: Colors.white, thickness: 0.1),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    const Text('Altura: ', style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold)),
                    Text((authController.user.height/100).toString(), style: const TextStyle(fontSize: 16, color: Colors.white)),
                  ],
                ),
                Column(
                  children: [
                    const Text('Peso inicial: ', style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold)),
                    Text(authController.user.weight.toString(), style: const TextStyle(fontSize: 16, color: Colors.white)),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}