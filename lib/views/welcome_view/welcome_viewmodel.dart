import 'package:firebase_auth/firebase_auth.dart';
import 'package:signup_login/app/app.locator.dart';
import 'package:signup_login/app/app.router.dart';
import 'package:signup_login/services/signup_services.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

enum AuthStatus {
  unknown,
  loggedIn,
  needsSignup,
}
class WelcomeViewModel extends BaseViewModel {
  final FirebaseAuth auth = FirebaseAuth.instance;

  final NavigationService _navigationService = locator<NavigationService>();
  final SignupService signupService=SignupService();
  AuthStatus _aunthStatus =AuthStatus.unknown;
  AuthStatus get authStatus=> _aunthStatus;



Future<void> checkIfEmailAndNavigate(String emailAddress) async {

try {

  await auth.signInWithEmailAndPassword(email: emailAddress, password: "dummy_password");
  _aunthStatus=AuthStatus.loggedIn;
  
  
} catch (e) {
  _aunthStatus=AuthStatus.needsSignup;
  
}    
}

  void navigateToLoginView() {
    _navigationService.navigateToLoginView();
  }
}
