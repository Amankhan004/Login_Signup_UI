import 'package:flutter/material.dart';

class LoginProfile extends StatelessWidget {
  final ImageProvider<Object> image;
  final String title;
  final String subtitle;

  LoginProfile({
    required this.image,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: image,
      ),
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
