import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:signup_login/views/login_view/login_view.dart';
import 'package:signup_login/views/welcome_view/welcome_viewmodel.dart';
import 'package:signup_login/widgets/backgroundimage.dart';
import 'package:signup_login/views/welcome_view/widget/forgotpassword.dart';
import 'package:signup_login/widgets/globalbutton.dart';
import 'package:signup_login/widgets/textfieldwidget.dart';
import 'package:stacked/stacked.dart';

// ignore: must_be_immutable
class WelcomeView extends StatelessWidget {
  TextEditingController emailController = TextEditingController();

  // ignore: use_key_in_widget_constructors
  WelcomeView({Key? key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WelcomeViewModel>.nonReactive(
      viewModelBuilder: () => WelcomeViewModel(),
      builder: (context, viewModel, child) {
        return AnnotatedRegion(
          value: const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
          child: Stack(
            children: [
              const BackgroundImage(),
              Scaffold(
                resizeToAvoidBottomInset: false,
                backgroundColor: Colors.transparent,
                body: SafeArea(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.27),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 43),
                            child: Text(
                              "Hi!",
                              style: TextStyle(
                                fontSize: 34,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey[800]!.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(28.0),
                                child: Column(
                                  children: [
                                    TextFieldWidget(
                                      hintText: "Email",
                                      textEditingController: emailController,
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    GlobalButton(
                                      buttonText: 'Continue',
                                      onTap: () async {
                                        viewModel.checkIfEmailAndNavigate(
                                            emailController.toString());
                                        print(viewModel.authStatus.toString());
                                        switch (viewModel.authStatus) {
                                          case AuthStatus.loggedIn:
                                            // User is logged in, navigate to login view
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => LoginView(
                                                    email: emailController),
                                              ),
                                            );
                                            break;
                                          case AuthStatus.needsSignup:
                                            // User needs to sign up, show error message
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                    'Please sign up before continuing.'),
                                              ),
                                            );
                                            break;
                                          default:
                                            // Default case, do nothing or handle as needed
                                            break;
                                        }
                                      },
                                    ),
                                    const Text(
                                      "or",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 17),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const ForgetPassword(),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
