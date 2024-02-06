import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return const LinearGradient(
          colors: [
            Color.fromARGB(255, 15, 15, 15),
            Color.fromARGB(31, 61, 61, 61)
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.center,
        ).createShader(bounds);
      },
      blendMode: BlendMode.darken,
      child: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/backgroundimage.jpg"),
                fit: BoxFit.cover,
                colorFilter:
                    ColorFilter.mode(Colors.black45, BlendMode.darken))),
      ),
    );
  }
}
