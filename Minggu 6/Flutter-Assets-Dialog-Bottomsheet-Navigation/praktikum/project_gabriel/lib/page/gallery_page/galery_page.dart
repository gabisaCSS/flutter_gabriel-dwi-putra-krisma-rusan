import 'package:flutter/material.dart';
import 'package:project_gabriel/constants/assets.dart';
import 'package:project_gabriel/navigation/navigation.dart';
import 'package:project_gabriel/widget/drawer_widget.dart';

class GaleryPage extends StatefulWidget {
  const GaleryPage({super.key});

  @override
  State<GaleryPage> createState() => _GaleryPageState();
}

class _GaleryPageState extends State<GaleryPage> {
  List<String> images = [
    Assets.assetsImagesImage1,
    Assets.assetsImagesImage2,
    Assets.assetsImagesImage3,
    Assets.assetsImagesImage4,
    Assets.assetsImagesImage5,
    Assets.assetsImagesImage6,
    Assets.assetsImagesImage7,
    Assets.assetsImagesImage8,
    Assets.assetsImagesImage9,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gallery Page'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
      ),
      drawer: const DrawerWidget(),
      body: GridView.builder(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 3,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          itemCount: images.length,
          itemBuilder: (BuildContext ctx, index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          padding: const EdgeInsets.all(16),
                          width: double.infinity,
                          child: GestureDetector(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: const Text(
                                          'Pindah ke Halaman Detail Image?'),
                                      content: SingleChildScrollView(
                                        child: Padding(
                                          padding: const EdgeInsets.all(16),
                                          child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                              child:
                                                  Image.asset(images[index])),
                                        ),
                                      ),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                              Navigator.of(context)
                                                  .pushReplacementNamed(
                                                      Navigation
                                                          .detailImagePage,
                                                      arguments: images[index]);
                                            },
                                            child: const Text('Ya')),
                                        TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text('Tidak'))
                                      ],
                                    );
                                  });
                            },
                            child: SizedBox(
                              width: 300,
                              height: 300,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.asset(
                                  images[index],
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        );
                      });
                },
                child: Image.asset(
                  images[index],
                  fit: BoxFit.fill,
                ),
              ),
            );
          }),
    );
  }
}
