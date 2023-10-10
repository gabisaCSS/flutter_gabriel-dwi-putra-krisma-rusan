import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_gabriel/bloc/list_contact_bloc/list_contact_bloc.dart';
import 'package:project_gabriel/bloc/phone_field_bloc/phone_field_bloc.dart';
import 'package:project_gabriel/bloc/username_field_bloc/username_field_bloc.dart';
import 'package:project_gabriel/page/contact_page/widget/header_contact_page.dart';
import 'package:project_gabriel/page/contact_page/widget/list_contact_widget.dart';
import 'package:project_gabriel/page/contact_page/widget/phone_field_bloc_widget.dart';
import 'package:project_gabriel/page/contact_page/widget/submit_button_widget.dart';
import 'package:project_gabriel/page/contact_page/widget/username_field_bloc_widget.dart';
import 'package:project_gabriel/theme/color_theme/ligth_theme.dart';
import 'package:project_gabriel/theme/text_style_theme/text_style_theme.dart';
// import 'package:project_gabriel/widget/elevated_button_widget.dart';
// import 'package:project_gabriel/widget/elevated_button_widget.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'CONTACT',
            style: TextStyleTheme().m3HeadlineMedium(),
          ),
          centerTitle: true,
          backgroundColor: LightTheme().m3SysLightPrimary),
      body: ListView(
        children: [
          const HeaderContactPage(),
          const UsernameFieldBlocWidget(),
          const SizedBox(
            height: 16,
          ),
          const PhoneFieldBlocWidget(),
          const SizedBox(
            height: 16,
          ),
          SubmitButtonWidget(
            onPressed: () {
              final stateUsername = context.read<UsernameFieldBloc>().state;
              final statePhone = context.read<PhoneFieldBloc>().state;

              if (stateUsername is UsernameFieldAmanState &&
                  statePhone is PhoneFieldAmanState) {
                context.read<ListContactBloc>().add(AddNewContactEvent(
                    name: stateUsername.nameValue,
                    phone: statePhone.phoneValue));

                context
                    .read<UsernameFieldBloc>()
                    .add(UsernameFieldClearEvent());

                context.read<PhoneFieldBloc>().add(PhoneFieldClearEvent());
              }
            },
          ),
          const ListContactWidget()
        ],
      ),
    );
  }
}
