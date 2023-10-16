import 'package:flutter/material.dart';
import 'package:project_gabriel/page/image_generator_page/image_generator_view_model/form_image_generator_view_model/form_image_generator_view_model.dart';
import 'package:project_gabriel/page/image_generator_page/image_generator_view_model/image_generator_bloc/image_generator_bloc.dart';
import 'package:project_gabriel/widget/elevated_button_widget.dart';
import 'package:project_gabriel/widget/text_field_widget.dart';
import 'package:provider/provider.dart';

class FormImageGeneratorWidget extends StatelessWidget {
  const FormImageGeneratorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<FormImageGeneratorViewModel>(
        builder: (context, provider, child) {
      return Column(
        children: [
          TextFieldWidget(
              label: 'Seed',
              controller: provider.seedFieldController,
              hintText: 'Insert Seed Here',
              onChanged: (String val) {}),
          const SizedBox(
            height: 16,
          ),
          DropdownButton<String>(
            value: provider.dropDownValue,
            icon: const Icon(Icons.arrow_downward),
            elevation: 16,
            style: const TextStyle(color: Colors.deepPurple),
            underline: Container(
              height: 2,
              color: Colors.deepPurpleAccent,
            ),
            onChanged: (String? value) {
              // This is called when the user selects an item.
              provider.setDropDownValue(value!);
            },
            items: provider.dropDownItems
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20, bottom: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButtonWidget(
                    text: 'Generate',
                    onPressed: () {
                      context.read<ImageGeneratorBloc>().add(
                          ImageGeneratorGetEvent(
                              styleImage: provider.dropDownValue,
                              seed: provider.seedFieldController.text));
                      provider.clearAll();
                    }),
              ],
            ),
          )
        ],
      );
    });
  }
}
