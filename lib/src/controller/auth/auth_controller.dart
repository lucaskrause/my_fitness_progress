import 'package:firebase_auth/firebase_auth.dart';

class AuthController {
  AuthController();

  String? email;
  String? password;
  User? auth;

  Future<void> login() async {
    try {
      var res = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email!,
        password: password!
      );

      auth = res.user;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      auth = null;
    } catch (e) {
      rethrow;
    }
  }
}