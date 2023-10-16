import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_gabriel/bloc/title_field_bloc/title_field_bloc.dart';
import 'package:project_gabriel/widget/text_field_widget.dart';

class TitleFieldWidget extends StatelessWidget {
  const TitleFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TitleFieldBloc, TitleFieldState>(
      builder: (context, state) {
        if (state is TitleFieldAmanState) {
          return TextFieldWidget(
              label: 'Title',
              hintText: 'Insert Title Here',
              onChanged: (value) {
                context
                    .read<TitleFieldBloc>()
                    .add(TitleFieldInputEvent(titleValue: value));
              });
        } else if (state is TitleFieldErrorState) {
          return TextFieldWidget(
              label: 'Title',
              hintText: 'Insert Title Here',
              errorText: state.errorText,
              onChanged: (value) {
                context
                    .read<TitleFieldBloc>()
                    .add(TitleFieldInputEvent(titleValue: value));
              });
        } else if (state is TitleFieldClearState) {
          return TextFieldWidget(
              label: 'Title',
              controller: TextEditingController(text: ''),
              hintText: 'Insert Title Here',
              onChanged: (value) {
                context
                    .read<TitleFieldBloc>()
                    .add(TitleFieldInputEvent(titleValue: value));
              });
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
