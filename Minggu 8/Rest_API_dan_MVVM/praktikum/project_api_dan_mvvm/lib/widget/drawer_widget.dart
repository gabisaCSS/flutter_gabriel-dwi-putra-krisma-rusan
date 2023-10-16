import 'package:flutter/material.dart';
import 'package:project_gabriel/routes/routes.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 24,
        ),
        TextButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, Routes.halamanContact, (route) => false);
            },
            child: const Text('Contact')),
        TextButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, Routes.halamanPost, (route) => false);
            },
            child: const Text('Post')),
        TextButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, Routes.halamanImageGenerator, (route) => false);
            },
            child: const Text('Image Generator'))
      ],
    ));
  }
}
