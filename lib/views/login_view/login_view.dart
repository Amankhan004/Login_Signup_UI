import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:signup_login/views/login_view/login_viewmodel.dart';
import 'package:signup_login/views/login_view/widget/loginprofile_tile.dart';
import 'package:signup_login/views/login_view/widget/reactivetextfield.dart';
import 'package:signup_login/widgets/backgroundimage.dart';
import 'package:signup_login/widgets/globalbutton.dart';
import 'package:stacked/stacked.dart';

// ignore: must_be_immutable
class LoginView extends StatelessWidget {
   TextEditingController? email=TextEditingController();
  final TextEditingController passswordController=TextEditingController();

   LoginView({super.key, this.email});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
        viewModelBuilder: () => LoginViewModel(),
        builder: (context, viewModel, child) {
          return AnnotatedRegion(
            value:
                const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
            child: Stack(
              children: [
                const BackgroundImage(),
                Scaffold(
                    resizeToAvoidBottomInset: false,
                    backgroundColor: Colors.transparent,
                    body: SafeArea(
                        child: SingleChildScrollView(
                      physics:const BouncingScrollPhysics(),
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 43),
                              child: Text(
                                "Log in",
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
                                    borderRadius: BorderRadius.circular(16)),
                                child: Padding(
                                  padding: const EdgeInsets.all(28.0),
                                  child: Column(
                                    children: [
                                      LoginProfile(
                                          image:
                                              AssetImage("assets/images/backgroundimage.jpg"),
                                          title: "Aman Khan",
                                          subtitle: "Amankhan06a@gmail.com"),
                                      ReactiveTextField(
                                        hintText: "Password",
                                        password: passswordController,
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      GlobalButton(
                                        buttonText: 'Continue',
                                         onTap: () {
                                        viewModel.Login(
                                            email!.text.toString(),
                                            passswordController.text.toString());

                                        email!.clear();
                                        passswordController.clear();
                                      },
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(top: 20),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "Forgot Your Password?",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                color: Color.fromARGB(
                                                    159, 65, 241, 139)),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )))
              ],
            ),
          );
        });
  }
}
