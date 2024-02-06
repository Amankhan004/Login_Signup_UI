import 'package:flutter/material.dart';
import 'package:signup_login/views/signup_view/signup_view.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:const EdgeInsets.only(top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
            const  Text(
                "Don't have an an account? ",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignupView()));
                },
                child:const Text(
                  "Sign up",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(159, 65, 241, 139)),
                ),
              )
            ],
          ),
         const Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text(
              "Forgot Your Password?",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(159, 65, 241, 139)),
            ),
          )
        ],
      ),
    );
  }
}
