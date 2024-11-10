// import 'package:firebase_auth/firebase_auth.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_fitness_progress/src/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  AuthController();
  
  User user = User();

  void setName(String value) {
    user.name = value;
  }

  void setAge(int value) {
    user.age = value;
  }

  void setHeight(int value) {
    user.height = value;
  }

  void setWeight(double value) {
    user.weight = value;
  }

  void setObjective(Map<String, double> value) {
    user.objective = value;
  }

  Future saveUser() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('name', user.name);
      prefs.setInt('age', user.age);
      prefs.setInt('height', user.height);
      prefs.setDouble('weight', user.weight);
      prefs.setString('objective', jsonEncode(user.objective));
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<User?> checkRegister() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final name = prefs.getString('name');
      final age = prefs.getInt('age');
      final height = prefs.getInt('height');
      final weight = prefs.getDouble('weight');
      final objective = prefs.getString('objective') != null ? Map<String, double>.from(jsonDecode(prefs.getString('objective')!)) : null;

      if (name != null && age != null && height != null && weight != null) {
        user = User(name: name, age: age, height: height, weight: weight, objective: objective);
        return user;
      }

      return null;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  Future removeUser() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      prefs.remove('name');
      prefs.remove('age');
      prefs.remove('height');
      prefs.remove('weight');
      prefs.remove('objective');

      //TODO: remover dados do banco
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}