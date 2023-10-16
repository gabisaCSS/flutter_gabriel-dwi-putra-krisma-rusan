import 'package:flutter/material.dart';
import 'package:project_gabriel/page/post_page/widget/body_field_widget.dart';
import 'package:project_gabriel/page/post_page/widget/submit_button_post_widget.dart';
import 'package:project_gabriel/page/post_page/widget/title_field_widget.dart';
import 'package:project_gabriel/theme/color_theme/ligth_theme.dart';
import 'package:project_gabriel/theme/text_style_theme/text_style_theme.dart';
import 'package:project_gabriel/widget/drawer_widget.dart';

class PostPage extends StatelessWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
              'Post Page',
              style: TextStyleTheme()
                  .m3HeadlineSmall(color: LightTheme().m3SysLightOnSurface),
            ),
            centerTitle: true,
            backgroundColor: LightTheme().m3SysLightPrimary),
        endDrawer: const DrawerWidget(),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              Text(
                'Update Post API',
                style: TextStyleTheme().m3DisplaySmall(),
              ),
              const SizedBox(
                height: 24,
              ),
              const TitleFieldWidget(),
              const SizedBox(
                height: 24,
              ),
              const BodyFieldWidget(),
              const SubmitButtonPostWidget()
            ],
          ),
        ));
  }
}
