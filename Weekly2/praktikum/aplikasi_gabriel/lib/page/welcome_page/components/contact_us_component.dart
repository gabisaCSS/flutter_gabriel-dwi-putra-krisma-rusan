import 'package:aplikasi_gabriel/providers/email_field_change_notifier/email_field_change_notifier.dart';
import 'package:aplikasi_gabriel/providers/message_field_change_notifier/message_field_change_notifier.dart';
import 'package:aplikasi_gabriel/providers/name_field_change_notifier/name_field_change_notifier.dart';
import 'package:aplikasi_gabriel/widget/elevated_button_widget.dart';
import 'package:aplikasi_gabriel/widget/text_style_widget.dart';
import 'package:aplikasi_gabriel/widget/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactUsComponent extends StatelessWidget {
  const ContactUsComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Contact Us',
          style: TextStyleWidget.header2(),
        ),
        const SizedBox(
          height: 24,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "Need to get in touch with us? Either fill out the form with your inquiry or find the department email you'd like to contact below",
            textAlign: TextAlign.justify,
            style: TextStyleWidget.body(),
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        Consumer<NameFieldChangeNotifier>(
            builder: (context, nameFieldProvider, child) {
          return TextFieldWidget(
            label: 'Name',
            hintText: 'Your Name',
            controller: nameFieldProvider.controller,
            onChanged: (String value) {
              nameFieldProvider.setNameValue(value);
            },
          );
        }),
        const SizedBox(
          height: 20,
        ),
        Consumer<EmailFieldChangeNotifier>(
            builder: (context, emailFieldProvider, child) {
          return TextFieldWidget(
            label: 'Email',
            hintText: 'example@gmail.com',
            controller: emailFieldProvider.controller,
            keyboardType: TextInputType.emailAddress,
            errorText: emailFieldProvider.emailErrorText.isNotEmpty
                ? emailFieldProvider.emailErrorText
                : null,
            onChanged: (val) {
              emailFieldProvider.setEmailValue(val);
            },
          );
        }),
        const SizedBox(
          height: 20,
        ),
        Consumer<MessageFieldChangeNotifier>(
            builder: (context, messageFieldProvider, child) {
          return TextFieldWidget(
            label: 'Message',
            hintText: 'Your Message',
            maxLines: 5,
            controller: messageFieldProvider.controller,
            onChanged: (String val) {
              messageFieldProvider.setMessageValue(val);
            },
          );
        }),
        const SizedBox(
          height: 40,
        ),
        Consumer3<NameFieldChangeNotifier, EmailFieldChangeNotifier,
                MessageFieldChangeNotifier>(
            builder: (context, nameFieldProvider, emailFieldProvider,
                messageFieldProvider, child) {
          String nameValue = nameFieldProvider.controller.text;
          String emailValue = emailFieldProvider.controller.text;
          String messageValue = messageFieldProvider.controller.text;

          return ElevatedButtonWidget(
              text: 'Submit',
              onPressed: nameValue.isNotEmpty &&
                      messageValue.isNotEmpty &&
                      emailFieldProvider.emailErrorText.isEmpty
                  ? () {
                      showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) {
                            return AlertDialog(
                              backgroundColor: Colors.white,
                              surfaceTintColor: Colors.white,
                              title: Text(
                                'Data Anda',
                                style: TextStyleWidget.appBarTitle(),
                              ),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Nama  : $nameValue',
                                    style: TextStyleWidget.body(),
                                  ),
                                  Text('Email : $emailValue',
                                      style: TextStyleWidget.body()),
                                  Text('Pesan : $messageValue',
                                      style: TextStyleWidget.body()),
                                ],
                              ),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      nameFieldProvider.clear();
                                      emailFieldProvider.clear();
                                      messageFieldProvider.clear();
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      'oke',
                                      style: TextStyleWidget.label(
                                          color: const Color.fromARGB(
                                              255, 255, 157, 0)),
                                    ))
                              ],
                            );
                          });
                    }
                  : null);
        }),
        const SizedBox(
          height: 120,
        )
      ],
    );
  }
}
