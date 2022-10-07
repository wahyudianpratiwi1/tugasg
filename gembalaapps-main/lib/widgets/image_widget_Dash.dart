import 'dart:io';
import 'package:flutter/material.dart';

class DisplayImageDash extends StatelessWidget {
  final String imagePath;

// Constructor
  const DisplayImageDash({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Stack(children: [
      buildImage(),
    ]));
  }

  // Builds Profile Image
  Widget buildImage() {
    final image = imagePath.contains('https://')
        ? NetworkImage(imagePath)
        : FileImage(File(imagePath));

    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: CircleAvatar(
        backgroundImage: image as ImageProvider,
        radius: 80,
      ),
    );
  }
}
