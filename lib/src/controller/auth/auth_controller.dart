// import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_fitness_progress/src/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  AuthController();
  
  User? user;
  // String? email;
  // String? password;

  Future saveUser() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('name', user!.name);
    prefs.setInt('age', user!.age);
    prefs.setInt('height', user!.height);
  }

  // Future<void> login() async {
  //   try {
  //     var res = await FirebaseAuth.instance.signInWithEmailAndPassword(
  //       email: email!,
  //       password: password!
  //     );

  //     auth = res.user;
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // Future<void> logout() async {
  //   try {
  //     await FirebaseAuth.instance.signOut();
  //     auth = null;
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
}