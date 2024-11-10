import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:my_fitness_progress/src/controller/auth/auth_controller.dart';
import 'package:my_fitness_progress/src/screen/login/register_page.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({super.key});

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  AuthController authController = GetIt.I.get<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
      child: Column(
        children: [
          DrawerHeader(
            child: Image.asset("assets/images/logo.png"),
          ),
          ListTile(
            leading: Icon(Icons.power_settings_new, color: Colors.red[700], weight: 700),
            title: const Text('Sair', style: TextStyle(color: Colors.white)),
            onTap: () async {
              await authController.removeUser();
              if (!mounted) return;
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (_) => const RegisterPage()),
                (route) => false
              );
            },
          ),
        ],
      ),

    );
  }
}