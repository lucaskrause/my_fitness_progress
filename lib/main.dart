import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:my_fitness_progress/src/controller/auth/auth_controller.dart';
import 'package:my_fitness_progress/src/screen/home/splash_page.dart';

// Amarelo     - Color.fromRGBO(255, 218, 10, 1)
// Verde       - Color.fromRGBO(11, 82, 38, 1)
// Vermelho    - Color.fromRGBO(91, 11, 13, 1)
// Roxo        - Color.fromRGBO(86, 82, 163, 1)
// Roxo Escuro - 47, 45, 88

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GetIt.I.registerSingleton<AuthController>(AuthController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Fitness Project',
      theme: ThemeData(
        brightness: Brightness.dark,
        cardColor: Colors.black,
        inputDecorationTheme: InputDecorationTheme(
          contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white
            ),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color.fromRGBO(11, 82, 38, 1),
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromRGBO(91, 11, 13, 1),
            ),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromRGBO(91, 11, 13, 1),
            ),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          errorStyle: const TextStyle(fontSize: 16, color: Color.fromRGBO(91, 11, 13, 1))
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromRGBO(11, 82, 38, 1),
            minimumSize: const Size.fromHeight(50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color.fromRGBO(11, 82, 38, 1),
        ),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashPage(),
    );
  }
}
