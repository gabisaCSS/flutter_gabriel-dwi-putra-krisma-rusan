import 'package:flutter/material.dart';

class DetailImagePage extends StatelessWidget {
  const DetailImagePage({super.key});

  @override
  Widget build(BuildContext context) {
    final image = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Image Page'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 24,
          ),
          const Text(
            'Your Image',
            style: TextStyle(fontSize: 36),
          ),
          Padding(
              padding: const EdgeInsets.all(16),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(image))),
        ],
      ),
    );
  }
}
