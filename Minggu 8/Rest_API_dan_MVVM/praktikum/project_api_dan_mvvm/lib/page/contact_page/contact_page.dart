import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_gabriel/bloc/phone_field_bloc/phone_field_bloc.dart';
import 'package:project_gabriel/bloc/username_field_bloc/username_field_bloc.dart';
import 'package:project_gabriel/model/contact/contact_model.dart';
import 'package:project_gabriel/page/contact_page/contact_view_model/contact_view_model_bloc.dart';
import 'package:project_gabriel/page/contact_page/widget/alert_dialog_widget.dart';
import 'package:project_gabriel/page/contact_page/widget/header_contact_page.dart';
import 'package:project_gabriel/page/contact_page/widget/phone_field_bloc_widget.dart';
import 'package:project_gabriel/page/contact_page/widget/submit_button_widget.dart';
import 'package:project_gabriel/page/contact_page/widget/username_field_bloc_widget.dart';
import 'package:project_gabriel/theme/color_theme/ligth_theme.dart';
import 'package:project_gabriel/theme/text_style_theme/text_style_theme.dart';
import 'package:project_gabriel/widget/drawer_widget.dart';

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
      endDrawer: const DrawerWidget(),
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
                showDialog(
                    context: context,
                    builder: (context) {
                      return const AlertDialogWidget();
                    });
                ContactModel contactModel = ContactModel(
                    id: null,
                    name: stateUsername.nameValue,
                    phone: statePhone.phoneValue);

                context
                    .read<ContactViewModelBloc>()
                    .add(ContactViewModelPostEvent(contactModel: contactModel));
                // context.read<ListContactBloc>().add(AddNewContactEvent(
                //     name: stateUsername.nameValue,
                //     phone: statePhone.phoneValue));

                context
                    .read<UsernameFieldBloc>()
                    .add(UsernameFieldClearEvent());

                context.read<PhoneFieldBloc>().add(PhoneFieldClearEvent());
              }
            },
          ),
        ],
      ),
    );
  }
}
