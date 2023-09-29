import 'package:aplikasi_gabriel/providers/contact_us_change_notifier.dart';
import 'package:aplikasi_gabriel/widget/elevated_button_widget.dart';
import 'package:aplikasi_gabriel/widget/text_style_widget.dart';
import 'package:aplikasi_gabriel/widget/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactUsComponent extends StatelessWidget {
  const ContactUsComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final contactUsProvider = Provider.of<ContactUsChangeNotifier>(context);

    return Column(
      children: [
        Text(
          'Contact Us',
          style: TextStyleWidget.header2(),
        ),
        const SizedBox(
          height: 24,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "Need to get in touch with us? Either fill out the form with your inquiry or find the department email you'd like to contact below",
            textAlign: TextAlign.justify,
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        TextFieldWidget(
          label: 'Name',
          hintText: 'Your Name',
          controller: contactUsProvider.nameController,
          onChanged: (val) {
            contactUsProvider.setNameValue(val);
          },
        ),
        const SizedBox(
          height: 20,
        ),
        TextFieldWidget(
          label: 'Email',
          hintText: 'example@gmail.com',
          controller: contactUsProvider.emailController,
          keyboardType: TextInputType.emailAddress,
          errorText: contactUsProvider.emailMessageError().isNotEmpty
              ? contactUsProvider.emailMessageError()
              : null,
          onChanged: (val) {
            contactUsProvider.setEmailValue(val);
          },
        ),
        const SizedBox(
          height: 20,
        ),
        TextFieldWidget(
          label: 'What We Can Help You With?',
          hintText: 'Your Message',
          controller: contactUsProvider.messageController,
          maxLines: 5,
          onChanged: (val) {
            contactUsProvider.setMessageValue(val);
          },
        ),
        const SizedBox(
          height: 40,
        ),
        ElevatedButtonWidget(
            text: 'Submit',
            onPressed: contactUsProvider.nameValue.isNotEmpty &&
                    contactUsProvider.messageValue.isNotEmpty &&
                    contactUsProvider.emailMessageError().isEmpty
                ? () {
                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Data Anda'),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Nama  : ${contactUsProvider.nameValue}'),
                                Text('Email : ${contactUsProvider.emailValue}'),
                                Text(
                                    'Pesan : ${contactUsProvider.messageValue}'),
                              ],
                            ),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    contactUsProvider.clear();
                                    Navigator.pop(context);
                                  },
                                  child: const Text('oke'))
                            ],
                          );
                        });
                  }
                : null),
        const SizedBox(
          height: 80,
        )
      ],
    );
  }
}
