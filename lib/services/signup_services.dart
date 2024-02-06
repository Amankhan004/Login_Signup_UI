import 'package:firebase_auth/firebase_auth.dart';



class SignupService {
  final FirebaseAuth auth = FirebaseAuth.instance;


  Future<void> login(String emailController, String passwordController) async {
    await auth.signInWithEmailAndPassword(
        email: emailController, password: passwordController);
  }

  Future<void> signup(String emailController, String passwordController) async {
    await auth.createUserWithEmailAndPassword(
        email: emailController, password: passwordController);
  }


  
}



