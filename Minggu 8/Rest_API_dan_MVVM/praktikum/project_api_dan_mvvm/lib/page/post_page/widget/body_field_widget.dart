import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_gabriel/bloc/body_field_bloc/body_field_bloc.dart';
import 'package:project_gabriel/widget/text_field_widget.dart';

class BodyFieldWidget extends StatelessWidget {
  const BodyFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BodyFieldBloc, BodyFieldState>(
      builder: (context, state) {
        if (state is BodyFieldAmanState) {
          return TextFieldWidget(
              label: 'Body',
              hintText: 'Insert Body Here',
              onChanged: (value) {
                context
                    .read<BodyFieldBloc>()
                    .add(BodyFieldInputEvent(bodyValue: value));
              });
        } else if (state is BodyFieldErrorState) {
          return TextFieldWidget(
              label: 'Body',
              hintText: 'Insert Body Here',
              errorText: state.errorText,
              onChanged: (value) {
                context
                    .read<BodyFieldBloc>()
                    .add(BodyFieldInputEvent(bodyValue: value));
              });
        } else if (state is BodyFieldClearState) {
          return TextFieldWidget(
              label: 'Body',
              controller: TextEditingController(text: ''),
              hintText: 'Insert Body Here',
              onChanged: (value) {
                context
                    .read<BodyFieldBloc>()
                    .add(BodyFieldInputEvent(bodyValue: value));
              });
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
