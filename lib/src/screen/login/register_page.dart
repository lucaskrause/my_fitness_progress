import 'package:flutter/material.dart';
import 'package:my_fitness_progress/src/controller/register/register_controller.dart';
import 'package:my_fitness_progress/src/screen/home/home_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  RegisterController controller = RegisterController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(height: 50),
            const Center(
              child: Text(
                'Seja bem-vindo',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Center(
              child: Text(
                'Adicione suas informações para futuras comparações',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 50),
            Card(
              color: Theme.of(context).cardColor,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Nome Completo',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      color: Theme.of(context).cardColor,
                      child: TextField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        ),
                        cursorColor: Colors.white,
                        style: const TextStyle(color: Colors.white),
                        onChanged: (String value) {
                          setState(() {
                            controller.setNome(value);
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Altura (cm)',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      color: Theme.of(context).cardColor,
                      child: TextField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        ),
                        cursorColor: Colors.white,
                        style: const TextStyle(color: Colors.white),
                        onChanged: (String value) {
                          setState(() {
                            controller.setAltura(value);
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Peso atual (Kg)',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      color: Theme.of(context).cardColor,
                      child: TextField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        ),
                        cursorColor: Colors.white,
                        style: const TextStyle(color: Colors.white),
                        onChanged: (String value) {
                          setState(() {
                            controller.setPeso(value);
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: controller.nome.isNotEmpty && controller.altura.isNotEmpty && controller.peso.isNotEmpty
                        ? () async {
                            FocusScope.of(context).unfocus();
                            await controller.saveData();

                            if (!context.mounted) return;
                            
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (_) => const HomePage()),
                            );
                          }
                        : null,
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(50),
                        backgroundColor: Theme.of(context).colorScheme.onSecondaryContainer,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        )
                      ),
                      child: const Text(
                        "Acessar APP",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}