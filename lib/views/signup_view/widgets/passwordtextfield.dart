import 'package:flutter/material.dart';
import 'package:signup_login/views/signup_view/signup_viewmodel.dart';
import 'package:stacked/stacked.dart';

class PasswordTextFieldWidget extends ViewModelWidget<SignUpViewModel> {
  final String hintText;
  final TextEditingController? textEditingController;

  final Widget? suffixIcon;
  const PasswordTextFieldWidget(
      {super.key,
      super.reactive,
      required this.hintText,
      this.suffixIcon,
      this.textEditingController});
  @override
  Widget build(BuildContext context, SignUpViewModel viewModel) {
    return TextField(
      obscureText: viewModel.obscureText,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: Colors.grey.shade700,
      ),
      controller: textEditingController,
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
