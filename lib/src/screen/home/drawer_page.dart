import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({super.key});

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
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
            onTap: () {
              FirebaseAuth.instance.signOut();
            },
          ),
        ],
      ),

    );
  }
}