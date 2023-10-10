import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_gabriel/bloc/phone_field_bloc/phone_field_bloc.dart';
import 'package:project_gabriel/bloc/username_field_bloc/username_field_bloc.dart';
import 'package:project_gabriel/widget/elevated_button_widget.dart';

class SubmitButtonWidget extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const SubmitButtonWidget(
      {super.key, required this.onPressed, this.text = 'Submit'});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final stateUsernameField = context.watch<UsernameFieldBloc>().state;
      final statePhoneField = context.watch<PhoneFieldBloc>().state;

      bool isEnabledUsername = stateUsernameField is UsernameFieldAmanState &&
          stateUsernameField.nameValue.isNotEmpty;

      bool isEnabledPhone = statePhoneField is PhoneFieldAmanState &&
          statePhoneField.phoneValue.isNotEmpty;

      return Padding(
        padding: const EdgeInsets.only(right: 20, bottom: 50),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButtonWidget(
                text: text,
                onPressed:
                    isEnabledUsername && isEnabledPhone ? onPressed : null),
          ],
        ),
      );
    });
  }
}
