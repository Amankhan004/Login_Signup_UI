
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:signup_login/app/app.locator.dart';
import 'package:signup_login/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
 WidgetsFlutterBinding.ensureInitialized();

await Firebase.initializeApp(
  options:DefaultFirebaseOptions.currentPlatform,
);
  await setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute,
    );
  }
}
