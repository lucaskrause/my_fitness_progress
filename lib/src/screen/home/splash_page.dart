import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:my_fitness_progress/src/controller/auth/auth_controller.dart';
import 'package:my_fitness_progress/src/models/user.dart';
import 'package:my_fitness_progress/src/screen/home/home_page.dart';
import 'package:my_fitness_progress/src/screen/login/register_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  AuthController authController = GetIt.I.get<AuthController>();
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(seconds: 2), () {
      // Verifica dados existentes
      authController.checkRegister().then((User? user) {
        if (user == null) {
          // Se nulo, registra as informações básicas
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const RegisterPage()),
            (route) => false
          );
        } else {
          // Se tiver user, vai para a HomePage
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const HomePage()),
            (route) => false,
          );
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Image.asset("assets/images/logo.png"),
          const SizedBox(height: 10),
          const Text(
            "My Fitness Progress",
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),
          ),
          const SizedBox(height: 20),
          const CircularProgressIndicator(
            color: Colors.white,
            
          )
        ],
      ),
    );
  }
}