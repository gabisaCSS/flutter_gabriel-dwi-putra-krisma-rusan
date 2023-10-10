import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_gabriel/bloc/username_field_bloc/username_field_bloc.dart';
import 'package:project_gabriel/widget/text_field_widget.dart';

class UsernameFieldBlocWidget extends StatelessWidget {
  const UsernameFieldBlocWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsernameFieldBloc, UsernameFieldState>(
        builder: (context, state) {
      if (state is UsernameFieldAmanState) {
        return TextFieldWidget(
          label: 'Nama',
          hintText: 'Your Name',
          onChanged: (String val) {
            context
                .read<UsernameFieldBloc>()
                .add(UsernameFieldInputEvent(value: val));
          },
        );
      } else if (state is UsernameFieldErrorState) {
        return TextFieldWidget(
          label: 'Nama',
          hintText: 'Your Name',
          errorText: state.errorText,
          onChanged: (String val) {
            context
                .read<UsernameFieldBloc>()
                .add(UsernameFieldInputEvent(value: val));
          },
        );
      } else if (state is UsernameFieldClearState) {
        TextEditingController controller = TextEditingController(text: '');
        return TextFieldWidget(
          label: 'Nama',
          hintText: 'Your Name',
          controller: controller,
          onChanged: (String val) {
            context
                .read<UsernameFieldBloc>()
                .add(UsernameFieldInputEvent(value: val));
          },
        );
      } else if (state is UsernameFieldEditState) {
        TextEditingController controller =
            TextEditingController(text: state.currentNameValue);
        return TextFieldWidget(
          label: 'Nama',
          hintText: 'Your Name',
          controller: controller,
          onChanged: (String val) {
            context
                .read<UsernameFieldBloc>()
                .add(UsernameFieldInputEvent(value: val));
          },
        );
      } else {
        return const SizedBox();
      }
    });
  }
}
