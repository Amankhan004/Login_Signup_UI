import 'package:flutter/material.dart';

class ProfileMenuWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback? onPressed;
  final bool endIcon;
  final Color? textColor;
  const ProfileMenuWidget({
    super.key,
    required this.title,
    required this.icon,
    this.onPressed,
    this.endIcon = true,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPressed,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: const Color.fromARGB(255, 123, 238, 127).withOpacity(0.8),
        ),
        child: Icon(icon),
      ),
      title: Text(
        title,
        style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: textColor ?? Colors.white),
      ),
      trailing: endIcon
          ? Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.white),
              child: const Icon(Icons.arrow_forward),
            )
          : null,
    );
  }
}
