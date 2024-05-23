// import 'package:firebase_auth/firebase_auth.dart';

class AuthController {
  AuthController();
  
  User? user;
  String? email;
  String? password;

  Future saveUser() async {
    await SharedPreferences.setString,
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