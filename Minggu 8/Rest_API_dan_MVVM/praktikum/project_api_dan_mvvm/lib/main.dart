import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_gabriel/bloc/body_field_bloc/body_field_bloc.dart';
import 'package:project_gabriel/bloc/phone_field_bloc/phone_field_bloc.dart';
import 'package:project_gabriel/bloc/title_field_bloc/title_field_bloc.dart';
import 'package:project_gabriel/bloc/username_field_bloc/username_field_bloc.dart';
import 'package:project_gabriel/page/contact_page/contact_page.dart';
import 'package:project_gabriel/page/contact_page/contact_view_model/contact_view_model_bloc.dart';
import 'package:project_gabriel/page/image_generator_page/image_generator_page.dart';
import 'package:project_gabriel/page/image_generator_page/image_generator_view_model/form_image_generator_view_model/form_image_generator_view_model.dart';
import 'package:project_gabriel/page/image_generator_page/image_generator_view_model/image_generator_bloc/image_generator_bloc.dart';
import 'package:project_gabriel/page/post_page/post_page.dart';
import 'package:project_gabriel/page/post_page/post_view_model/post_view_model_bloc.dart';
import 'package:project_gabriel/routes/routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UsernameFieldBloc>(
          create: (context) => UsernameFieldBloc(),
        ),
        BlocProvider<PhoneFieldBloc>(
          create: (context) => PhoneFieldBloc(),
        ),
        BlocProvider<ContactViewModelBloc>(
          create: (context) => ContactViewModelBloc(),
        ),
        BlocProvider<TitleFieldBloc>(
          create: (context) => TitleFieldBloc(),
        ),
        BlocProvider<BodyFieldBloc>(
          create: (context) => BodyFieldBloc(),
        ),
        BlocProvider<PostViewModelBloc>(
          create: (context) => PostViewModelBloc(),
        ),
        BlocProvider<ImageGeneratorBloc>(
          create: (context) => ImageGeneratorBloc(),
        ),
      ],
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider<FormImageGeneratorViewModel>(
            create: (_) => FormImageGeneratorViewModel(),
          )
        ],
        child: MaterialApp(
            title: 'Project Gabriel',
            theme: ThemeData(useMaterial3: true),
            debugShowCheckedModeBanner: false,
            initialRoute: Routes.halamanContact,
            routes: {
              Routes.halamanContact: (context) => const ContactPage(),
              Routes.halamanPost: (context) => const PostPage(),
              Routes.halamanImageGenerator: (context) =>
                  const ImageGeneratorPage(),
            }),
      ),
    );
  }
}
