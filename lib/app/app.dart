import 'package:signup_login/services/signup_services.dart';
import 'package:signup_login/views/login_view/login_view.dart';
import 'package:signup_login/views/profile_view/profile_view.dart';
import 'package:signup_login/views/signup_view/signup_view.dart';
import 'package:signup_login/views/welcome_view/welcome_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(routes: [
  MaterialRoute( page: WelcomeView , initial: true),
  MaterialRoute( page: LoginView),
  MaterialRoute( page: SignupView),
  MaterialRoute( page: ProfileView),
],
dependencies: [
  Singleton(classType: NavigationService),
  Singleton(classType: SignupService),

  
]
)


class App{}