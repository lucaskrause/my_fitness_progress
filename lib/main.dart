import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:my_fitness_progress/firebase_options.dart';
import 'package:my_fitness_progress/src/controller/auth/auth_controller.dart';
import 'package:my_fitness_progress/src/screen/home/splash_page.dart';

// Amarelo - 255, 218, 10
// Verde - 11, 82, 38
// Vermelho - 91, 11, 13
// Roxo - 86, 82, 163
// Roxo Escuro - 47, 45, 88
// Cinza - 100, 100, 100
// Preto - 0, 0, 0

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  GetIt.I.registerSingleton<AuthController>(AuthController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Fitness Project',
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color.fromRGBO(255, 218, 10, 1),
            ),
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        cardColor: const Color.fromRGBO(15, 15, 15, 1),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.black,
          primary: const Color.fromRGBO(15, 15, 15, 1),
          onPrimaryContainer: const Color.fromRGBO(86, 82, 163, 1),
          onSecondaryContainer: const Color.fromRGBO(11, 82, 38, 1),
          onTertiaryContainer: const Color.fromRGBO(255, 218, 10, 1),
          onErrorContainer: const Color.fromRGBO(91, 11, 13, 1),
          surface: const Color.fromRGBO(30, 30, 30, 1),
        ),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashPage(),
    );
  }
}
