import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:my_fitness_progress/src/controller/auth/auth_controller.dart';
import 'package:my_fitness_progress/src/screen/home/home_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  AuthController controller = GetIt.I.get<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
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
                          cursorColor: Colors.white,
                          style: const TextStyle(color: Colors.white),
                          textCapitalization: TextCapitalization.words,
                          onChanged: (String value) {
                            setState(() {
                              controller.setName(value);
                            });
                          },
                        ),
                      ),
                      const SizedBox(height: 10),const Text(
                        'Idade',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        color: Theme.of(context).cardColor,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          cursorColor: Colors.white,
                          style: const TextStyle(color: Colors.white),
                          onChanged: (String value) {
                            setState(() {
                              controller.setAge(int.parse(value));
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
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          cursorColor: Colors.white,
                          style: const TextStyle(color: Colors.white),
                          onChanged: (String value) {
                            setState(() {
                              controller.setHeight(int.parse(value));
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
                          keyboardType: TextInputType.number,
                          cursorColor: Colors.white,
                          style: const TextStyle(color: Colors.white),
                          onChanged: (String value) {
                            setState(() {
                              controller.setWeight(double.parse(value));
                            });
                          },
                        ),
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: () async {
                          FocusScope.of(context).unfocus();
                          await controller.saveUser();
          
                          if (!context.mounted) return;
                          
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => const HomePage()),
                          );
                        },
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
      ),
    );
  }
}