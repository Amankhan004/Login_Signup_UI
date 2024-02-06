import 'package:flutter/material.dart';
import 'package:signup_login/views/login_view/login_viewmodel.dart';
import 'package:stacked/stacked.dart';

class ReactiveTextField extends ViewModelWidget<LoginViewModel> {
  final String hintText;
  final Widget? suffixIcon;
  final TextEditingController? password;
  const ReactiveTextField( 
      {super.key, super.reactive, required this.hintText, this.suffixIcon,this.password,});
  @override
  Widget build(BuildContext context, LoginViewModel viewModel) {
    return TextField(
      obscureText: viewModel.obscureText,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: Colors.grey.shade700,
      ),
      controller: password,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.shade300,
            ),
            borderRadius: BorderRadius.circular(10)),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(10)),
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 14,
          color: Colors.grey.shade600,
        ),
        fillColor: Colors.grey.shade300,
        filled: true,
        suffixIcon: InkWell(
            onTap: () {
              viewModel.toggleObscureValue();
            },
            child: Icon(viewModel.obscureText
                ? Icons.visibility_off_outlined
                : Icons.visibility)),
      ),
    );
  }
}
