import 'package:flutter/material.dart';
import 'package:project_gabriel/page/image_generator_page/widget/form_image_generator_widget.dart';
import 'package:project_gabriel/page/image_generator_page/widget/image_screen_widget.dart';
import 'package:project_gabriel/widget/drawer_widget.dart';

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

class ImageGeneratorPage extends StatefulWidget {
  const ImageGeneratorPage({super.key});

  @override
  State<ImageGeneratorPage> createState() => _ImageGeneratorPageState();
}

class _ImageGeneratorPageState extends State<ImageGeneratorPage> {
  String dropdownValue = list.first;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        endDrawer: const DrawerWidget(),
        appBar: AppBar(
          title: const Text("Image Generator"),
          centerTitle: true,
        ),
        body: const Column(
          children: [
            SizedBox(
              height: 30,
            ),
            ImageScreenWidget(),
            SizedBox(
              height: 24,
            ),
            FormImageGeneratorWidget(),
          ],
        ));
  }
}
