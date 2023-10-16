import 'package:aplikasi_gabriel/constants/assets.dart';
import 'package:aplikasi_gabriel/models/menu_model/menu_model.dart';
import 'package:aplikasi_gabriel/widget/text_style_widget.dart';
import 'package:flutter/material.dart';

class AboutUsComponent extends StatelessWidget {
  const AboutUsComponent({super.key});

  @override
  Widget build(BuildContext context) {
    List<MenuModel> listMenu = [
      const MenuModel(
          imageMenu: Assets.assetsBakso,
          namaMenu: 'Bakso',
          hargaMenu: 'Rp 15.000'),
      const MenuModel(
          imageMenu: Assets.assetsBurger,
          namaMenu: 'Burger',
          hargaMenu: 'Rp 17.000'),
      const MenuModel(
          imageMenu: Assets.assetsEsKopi,
          namaMenu: 'Ice Coffe',
          hargaMenu: 'Rp 12.000'),
      const MenuModel(
          imageMenu: Assets.assetsEsKrim,
          namaMenu: 'Ice Cream',
          hargaMenu: 'Rp 10.000'),
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'About Us',
              style: TextStyleWidget.header2(),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              "Gabriel Food provides a variety of delicious and pocket-friendly food and drink menus.",
              textAlign: TextAlign.center,
              style: TextStyleWidget.body(),
            ),
            const SizedBox(
              height: 32,
            ),
            GridView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: listMenu.length,
              itemBuilder: (ctx, index) {
                return Card(
                  surfaceTintColor: const Color(0xFFEEA734),
                  elevation: 5,
                  child: Container(
                    height: 290,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    margin: const EdgeInsets.all(5),
                    // padding: const EdgeInsets.all(5),
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  listMenu[index].imageMenu,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              listMenu[index].namaMenu,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  listMenu[index].hargaMenu,
                                  style: const TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 4 / 5,
                crossAxisSpacing: 10,
                mainAxisSpacing: 15,
              ),
            ),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
