import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_gabriel/bloc/phone_field_bloc/phone_field_bloc.dart';
import 'package:project_gabriel/widget/text_field_widget.dart';

class PhoneFieldBlocWidget extends StatelessWidget {
  const PhoneFieldBlocWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhoneFieldBloc, PhoneFieldState>(
        builder: (context, state) {
      if (state is PhoneFieldErrorState) {
        // // perlu set text ke dalam controller nya, nanti posisi kursor nya error
        // TextEditingController controller =
        //     TextEditingController(text: state.phoneValue);
        // // perlu set posisi kursor controller nya, kalo ga nanti tiap build ulang kursor nya dari awal terus
        // controller.selection = TextSelection.fromPosition(
        //     TextPosition(offset: state.phoneValue.length));
        return TextFieldWidget(
            label: 'Phone',
            hintText: '08...',
            keyboardType: TextInputType.number,
            errorText: state.errorText,
            onChanged: (String val) {
              context
                  .read<PhoneFieldBloc>()
                  .add(PhoneFieldInputEvent(value: val));
            });
      } else if (state is PhoneFieldAmanState) {
        // perlu set text ke dalam controller nya, nanti posisi kursor nya error
        TextEditingController controller =
            TextEditingController(text: state.phoneValue);
        // perlu set posisi kursor controller nya, kalo ga nanti tiap build ulang kursor nya dari awal terus
        controller.selection = TextSelection.fromPosition(
            TextPosition(offset: state.phoneValue.length));
        return TextFieldWidget(
            label: 'Phone',
            hintText: '08...',
            keyboardType: TextInputType.number,
            controller: controller,
            onChanged: (String val) {
              context
                  .read<PhoneFieldBloc>()
                  .add(PhoneFieldInputEvent(value: val));
            });
      } else {
        return const SizedBox();
      }
    });
  }
}
