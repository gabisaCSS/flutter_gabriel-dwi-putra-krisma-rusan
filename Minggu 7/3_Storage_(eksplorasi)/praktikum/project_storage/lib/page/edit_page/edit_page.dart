import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_gabriel/bloc/db_list_contact_bloc/db_list_contact_bloc.dart';
import 'package:project_gabriel/bloc/phone_field_bloc/phone_field_bloc.dart';
import 'package:project_gabriel/bloc/username_field_bloc/username_field_bloc.dart';
import 'package:project_gabriel/model/contact_model.dart';
import 'package:project_gabriel/page/contact_page/widget/phone_field_bloc_widget.dart';
import 'package:project_gabriel/page/contact_page/widget/submit_button_widget.dart';
import 'package:project_gabriel/page/contact_page/widget/username_field_bloc_widget.dart';
import 'package:project_gabriel/theme/color_theme/ligth_theme.dart';
import 'package:project_gabriel/theme/text_style_theme/text_style_theme.dart';

class EditPage extends StatelessWidget {
  const EditPage({super.key});

  @override
  Widget build(BuildContext context) {
    final contactModelArgument =
        ModalRoute.of(context)!.settings.arguments as ContactModel;
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'EDIT CONTACT',
            style: TextStyleTheme().m3HeadlineMedium(),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () async {
              context.read<UsernameFieldBloc>().add(UsernameFieldClearEvent());
              context.read<PhoneFieldBloc>().add(PhoneFieldClearEvent());

              Future.delayed(const Duration(milliseconds: 200));

              Navigator.pop(context);
            },
          ),
          backgroundColor: LightTheme().m3SysLightPrimary),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [],
            ),
          ),
          const UsernameFieldBlocWidget(),
          const SizedBox(
            height: 16,
          ),
          const PhoneFieldBlocWidget(),
          const SizedBox(
            height: 16,
          ),
          SubmitButtonWidget(
              text: 'Simpan',
              onPressed: () {
                final stateUsername = context.read<UsernameFieldBloc>().state;
                final statePhone = context.read<PhoneFieldBloc>().state;

                bool isAllAmanState = stateUsername is UsernameFieldAmanState &&
                    statePhone is PhoneFieldAmanState;
                bool isAllEditState = stateUsername is UsernameFieldEditState &&
                    statePhone is PhoneFieldEditState;
                bool isUsernameAmanAndPhoneEditState =
                    stateUsername is UsernameFieldAmanState &&
                        statePhone is PhoneFieldEditState;
                bool isUsernameEditAndPhoneAmanState =
                    stateUsername is UsernameFieldEditState &&
                        statePhone is PhoneFieldAmanState;

                if (isAllAmanState) {
                  contactModelArgument.name = stateUsername.nameValue;
                  contactModelArgument.phone = statePhone.phoneValue;

                  context.read<DbListContactBloc>().add(
                      DbListContactUpdateEvent(
                          contactModel: contactModelArgument));

                  // context.read<ListContactBloc>().add(EditContactEvent(
                  //     name: stateUsername.nameValue,
                  //     phone: statePhone.phoneValue,
                  //     index: editIndex));
                } else if (isAllEditState) {
                  contactModelArgument.name = stateUsername.currentNameValue;
                  contactModelArgument.phone = statePhone.currentPhoneValue;

                  context.read<DbListContactBloc>().add(
                      DbListContactUpdateEvent(
                          contactModel: contactModelArgument));
                } else if (isUsernameAmanAndPhoneEditState) {
                  contactModelArgument.name = stateUsername.nameValue;
                  contactModelArgument.phone = statePhone.currentPhoneValue;

                  context.read<DbListContactBloc>().add(
                      DbListContactUpdateEvent(
                          contactModel: contactModelArgument));
                } else if (isUsernameEditAndPhoneAmanState) {
                  contactModelArgument.name = stateUsername.currentNameValue;
                  contactModelArgument.phone = statePhone.phoneValue;

                  context.read<DbListContactBloc>().add(
                      DbListContactUpdateEvent(
                          contactModel: contactModelArgument));
                }

                context
                    .read<UsernameFieldBloc>()
                    .add(UsernameFieldClearEvent());
                context.read<PhoneFieldBloc>().add(PhoneFieldClearEvent());

                Navigator.pop(context);
              })
        ],
      ),
    );
  }
}
