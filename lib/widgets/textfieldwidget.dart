import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  final String hintText;
  final TextEditingController? textEditingController;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onTap; // Added parameter

  const TextFieldWidget({
    Key? key,
    required this.hintText,
    this.textEditingController,
    this.onSubmitted,
    this.onTap, // Added parameter
  }) : super(key: key);

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  String errorTextVal = "";

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        setState(() {
          if (value.contains(' ')) {
            errorTextVal = "Don't use blank spaces";
          } else {
            errorTextVal = '';
          }
        });
      },
      onTap: widget.onTap, // Use onTap callback
      onSubmitted: widget.onSubmitted,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: Colors.grey.shade700,
      ),
      controller: widget.textEditingController,
      decoration: InputDecoration(
        errorText: errorTextVal.isEmpty ? null : errorTextVal,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade300,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        hintText: widget.hintText,
        hintStyle: TextStyle(
          fontSize: 14,
          color: Colors.grey.shade600,
        ),
        fillColor: Colors.grey.shade300,
        filled: true,
      ),
    );
  }
}
