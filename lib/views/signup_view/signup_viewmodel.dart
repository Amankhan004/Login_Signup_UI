import 'package:signup_login/app/app.locator.dart';
import 'package:signup_login/app/app.router.dart';
import 'package:signup_login/services/signup_services.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SignUpViewModel extends BaseViewModel {
  final NavigationService navigationService = locator<NavigationService>();
  final SignupService signupService = locator<SignupService>();

  bool _obscureText = true;
  bool _isLoading = false;
  String _error = '';

  bool get obscureText => _obscureText;
  bool get isLoading => _isLoading;
  String get errorText => _error;

  void toggleObscureValue() {
    _obscureText = !_obscureText;
    rebuildUi();
  }

  void navigateToWelcomeView() {
    navigationService.navigateToWelcomeView();
  }

  Future<void> signUp(String email, String password) async {
    try {
      await signupService.signup(email, password);
    } catch (e) {}
  }
}
