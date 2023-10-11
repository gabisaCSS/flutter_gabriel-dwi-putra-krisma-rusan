import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_gabriel/bloc/db_list_contact_bloc/db_list_contact_bloc.dart';
import 'package:project_gabriel/bloc/phone_field_bloc/phone_field_bloc.dart';
import 'package:project_gabriel/bloc/username_field_bloc/username_field_bloc.dart';
import 'package:project_gabriel/page/contact_page/contact_page.dart';
import 'package:project_gabriel/page/edit_page/edit_page.dart';
import 'package:project_gabriel/page/login_page/login_page.dart';
import 'package:project_gabriel/page/splash_page/splash_page.dart';
import 'package:project_gabriel/routes/routes.dart';

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
        BlocProvider<DbListContactBloc>(
          create: (context) => DbListContactBloc(),
        ),
      ],
      child: MaterialApp(
          title: 'Project Gabriel',
          theme: ThemeData(useMaterial3: true),
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.splashScreen,
          routes: {
            Routes.splashScreen: (context) => const SplashPage(),
            Routes.halamanUtama: (context) => const ContactPage(),
            Routes.halamanEdit: (context) => const EditPage(),
            Routes.halamanLogin: (context) => const LoginPage(),
          }),
    );
  }
}
