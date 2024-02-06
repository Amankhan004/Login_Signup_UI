import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:signup_login/views/signup_view/signup_viewmodel.dart';
import 'package:signup_login/views/signup_view/widgets/passwordtextfield.dart';
import 'package:signup_login/widgets/backgroundimage.dart';
import 'package:signup_login/widgets/globalbutton.dart';
import 'package:signup_login/widgets/textfieldwidget.dart';
import 'package:stacked/stacked.dart';

class SignupView extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  SignupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpViewModel>.nonReactive(
      viewModelBuilder: () => SignUpViewModel(),
      builder: (context, viewModel, child) {
        return AnnotatedRegion(
          value: const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
          child: Stack(
            children: [
              const BackgroundImage(),
              Scaffold(
                backgroundColor: Colors.transparent,
                body: SafeArea(
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.24),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 43),
                            child: Text(
                              "Sign up",
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Looks like you don't have an account. \nlet's create a new account for",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    const Text(
                                      "amankhan06a@gmail.com",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    TextFieldWidget(
                                      hintText: "Email",
                                      textEditingController: emailController,
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    PasswordTextFieldWidget(
                                      hintText: "Password",
                                      textEditingController: passwordController,
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    const Text(
                                      "By selecting Agree and continue below,",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    const Row(
                                      children: [
                                        Text(
                                          "I agree to ",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            "Terms of Serices and Privacy Policy",
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400,
                                              color: Color.fromARGB(
                                                  255, 38, 211, 110),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    GlobalButton(
                                      buttonText: "Aree and Continue",
                                      onTap: () {
                                        viewModel.signUp(
                                            emailController.text.toString(),
                                            passwordController.text.toString());

                                        emailController.clear();
                                        passwordController.clear();
                                        viewModel.navigateToWelcomeView();
                                      },
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
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
