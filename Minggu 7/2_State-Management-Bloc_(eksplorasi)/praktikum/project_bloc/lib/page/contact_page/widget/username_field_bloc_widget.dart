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
      if (state is UsernameFieldErrorState) {
        // // perlu set text ke dalam controller nya, nanti posisi kursor nya error
        // TextEditingController controller =
        //     TextEditingController(text: state.usernameValue);
        // // perlu set posisi kursor controller nya, kalo ga nanti tiap build ulang kursor nya dari awal terus
        // controller.selection = TextSelection.fromPosition(
        //     TextPosition(offset: state.usernameValue.length));

        return TextFieldWidget(
          label: 'Nama',
          hintText: 'Your Name',
          errorText: state.errorText,
          // controller: controller,
          onChanged: (String val) {
            context
                .read<UsernameFieldBloc>()
                .add(UsernameFieldInputEvent(value: val));
          },
        );
      } else if (state is UsernameFieldAmanState) {
        // perlu set text ke dalam controller nya, nanti posisi kursor nya error
        TextEditingController controller =
            TextEditingController(text: state.nameValue);
        // perlu set posisi kursor controller nya, kalo ga nanti tiap build ulang kursor nya dari awal terus
        controller.selection = TextSelection.fromPosition(
            TextPosition(offset: state.nameValue.length));
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
