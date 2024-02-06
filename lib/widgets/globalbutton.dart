import 'package:flutter/material.dart';

class GlobalButton extends StatelessWidget {
  final String buttonText;
  final Image? buttonImage;
  final Color buttonColor;
  final Color textColor;
  final VoidCallback? onTap;

  const GlobalButton({
    Key? key,
    required this.buttonText,
    this.buttonImage,
    this.buttonColor = const Color.fromARGB(255, 38, 211, 110),
    this.textColor = const Color(0xffF5F5F5),
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Container(
          width: double.infinity,
          height: 55,
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(10),
          ),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if (buttonImage != null) ...[
                Padding(
                  padding: const EdgeInsets.only(
                    left: 30.0,
                  ),
                  child: SizedBox(height: 30, width: 30, child: buttonImage!),
                ),
              ],
              Expanded(
                child: Center(
                  child: Text(
                    buttonText,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: textColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
