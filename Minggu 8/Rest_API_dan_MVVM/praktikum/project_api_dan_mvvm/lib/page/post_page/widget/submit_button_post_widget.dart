import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_gabriel/bloc/body_field_bloc/body_field_bloc.dart';
import 'package:project_gabriel/bloc/title_field_bloc/title_field_bloc.dart';
import 'package:project_gabriel/page/post_page/post_view_model/post_view_model_bloc.dart';
import 'package:project_gabriel/page/post_page/widget/alert_dialog_post_widget.dart';
import 'package:project_gabriel/widget/elevated_button_widget.dart';

class SubmitButtonPostWidget extends StatelessWidget {
  const SubmitButtonPostWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final titleState = context.watch<TitleFieldBloc>().state;
      final bodyState = context.watch<BodyFieldBloc>().state;

      bool isEnabledTitle =
          titleState is TitleFieldAmanState && titleState.titleValue.isNotEmpty;
      bool isEnabledBody =
          bodyState is BodyFieldAmanState && bodyState.bodyValue.isNotEmpty;

      return Padding(
        padding: const EdgeInsets.only(top: 50, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButtonWidget(
                text: 'Put',
                onPressed: isEnabledTitle && isEnabledBody
                    ? () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return const AlertDialogPostWidget();
                            });
                        context.read<PostViewModelBloc>().add(
                            PostViewModelPutEvent(
                                title: titleState.titleValue,
                                body: bodyState.bodyValue,
                                id: 2));
                        context
                            .read<TitleFieldBloc>()
                            .add(TitleFieldClearEvent());
                        context
                            .read<BodyFieldBloc>()
                            .add(BodyFieldClearEvent());
                      }
                    : null),
          ],
        ),
      );
    });
  }
}
