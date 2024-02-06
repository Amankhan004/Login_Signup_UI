import 'package:signup_login/app/app.locator.dart';
import 'package:signup_login/app/app.router.dart';
import 'package:signup_login/services/signup_services.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends BaseViewModel {
  final navigationService = locator<NavigationService>();
  final SignupService signupService = locator<SignupService>();

  bool _obscureText = true;

  bool get obscureText => _obscureText;

  void toggleObscureValue() {
    _obscureText = !_obscureText;
    rebuildUi();
  }

  navigateToProfileView() {
    navigationService.navigateToProfileView();
  }

  Future<void> Login(String email, String password) async {
    try {
      await signupService.login(email, password);
      navigateToProfileView();
    } catch (e) {}
  }
}
