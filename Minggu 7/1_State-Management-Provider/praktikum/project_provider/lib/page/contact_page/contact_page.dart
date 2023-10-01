import 'package:flutter/material.dart';
import 'package:project_gabriel/page/contact_page/widget/header_contact_page.dart';
import 'package:project_gabriel/providers/contact_notifier.dart';
import 'package:project_gabriel/theme/color_theme/ligth_theme.dart';
import 'package:project_gabriel/theme/text_style_theme/text_style_theme.dart';
import 'package:project_gabriel/widget/elevated_button_widget.dart';
// import 'package:project_gabriel/widget/elevated_button_widget.dart';
import 'package:project_gabriel/widget/jarak_widget.dart';
import 'package:project_gabriel/widget/text_field_widget.dart';
import 'package:provider/provider.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'CONTACT',
            style: TextStyleTheme().m3HeadlineMedium(),
          ),
          centerTitle: true,
          backgroundColor: LightTheme().m3SysLightPrimary),
      body: ListView(
        children: [
          const HeaderContactPage(),
          Consumer<ContactNotifier>(
            builder: (context, provider, child) {
              return Column(
                children: [
                  Padding(
                    padding: provider.selectedEditIndex != -1
                        ? const EdgeInsets.only(bottom: 16)
                        : const EdgeInsets.all(0),
                    child: provider.selectedEditIndex != -1
                        ? Column(
                            children: [
                              Text(
                                  'Sedang Edit Data ke ${provider.selectedEditIndex + 1}'),
                              TextButton(
                                  onPressed: () {
                                    provider.clear();
                                  },
                                  child: const Text('Batal'))
                            ],
                          )
                        : null,
                  ),
                  TextFieldWidget(
                    label: 'Name',
                    hintText: 'Insert Your Name',
                    errorText: provider.nameErrorText().isNotEmpty
                        ? provider.nameErrorText()
                        : null,
                    controller: provider.nameControler,
                    onChanged: (val) {
                      provider.setNameValue(val);
                    },
                  ),
                  const JarakVertikal(16),
                  TextFieldWidget(
                    label: 'Nomor',
                    hintText: '08...',
                    errorText: provider.phoneErrorText().isNotEmpty
                        ? provider.phoneErrorText()
                        : null,
                    keyboardType: TextInputType.number,
                    controller: provider.phoneController,
                    onChanged: (val) {
                      provider.setPhoneValue(val);
                    },
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 16, right: 20, bottom: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButtonWidget(
                            text: 'Submit',
                            onPressed: provider.phoneErrorText().isEmpty &&
                                    provider.nameErrorText().isEmpty
                                ? () {
                                    if (provider.selectedEditIndex == -1) {
                                      provider.onPressedButtonSubmit();
                                    } else {
                                      provider.onPressedButtonSubmit(
                                          isEdit: true);
                                    }
                                  }
                                : null)
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        'List Contacts',
                        style: TextStyleTheme().m3HeadlineSmall(),
                      ),
                      const JarakVertikal(16),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                            color: LightTheme().m3SysLightSurface,
                            borderRadius: BorderRadius.circular(28)),
                        child: ListView.builder(
                          itemCount: provider.contacts.length,
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics(),
                          itemBuilder: (context, index) {
                            var data = provider.contacts[index];
                            return ListTile(
                              leading: CircleAvatar(
                                backgroundColor:
                                    LightTheme().m3SysLightPrimaryContainer,
                                child: Text(data.name[0]),
                              ),
                              title: Text(
                                data.name,
                                style: TextStyleTheme().m3BodyLarge(),
                              ),
                              subtitle: Text(
                                data.phone,
                                style: TextStyleTheme().m3BodyMedium(),
                              ),
                              trailing: Wrap(
                                // spacing: 4,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        String nameValue =
                                            provider.contacts[index].name;
                                        String phoneValue =
                                            provider.contacts[index].phone;
                                        provider.setSelectedEditIndex(index);
                                        provider.setAllValue(
                                            nameValue: nameValue,
                                            phoneValue: phoneValue);
                                      },
                                      icon: const Icon(Icons.edit)),
                                  IconButton(
                                      onPressed: () {
                                        provider.deleteContact(index);
                                      },
                                      icon: const Icon(Icons.delete))
                                ],
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  )
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}


  // void onPressedIconEdit(int index) {
  //   ContactModel data = contacts[index];

  //   _editNameController.text = data.name;
  //   _editPhoneController.text = data.phone;

  //   _editNameValue = data.name;
  //   _editPhoneValue = data.phone;

  //   showModalBottomSheet(
  //       context: context,
  //       builder: (context) {
  //         return Container(
  //             height: 900,
  //             width: double.infinity,
  //             color: LightTheme().m3SysLightBackground,
  //             child: Column(
  //               mainAxisAlignment: MainAxisAlignment.start,
  //               children: [
  //                 const JarakVertikal(24),
  //                 Text(
  //                   'Edit Contact',
  //                   style: TextStyleTheme().m3HeadlineSmall(),
  //                 ),
  //                 const JarakVertikal(24),
  //                 TextFieldWidget(
  //                   label: 'Name',
  //                   hintText: 'Insert Your Name',
  //                   errorText: _isEnabledEditName
  //                       ? null
  //                       : nameErrorText(_editNameValue),
  //                   controller: _editNameController,
  //                   onChanged: (val) {
  //                     _editNameValue = val;
  //                     _isEnabledEditName =
  //                         nameErrorText(_editNameValue).isEmpty;
  //                     setState(() {});
  //                   },
  //                 ),
  //                 const JarakVertikal(16),
  //                 TextFieldWidget(
  //                   label: 'Phone',
  //                   hintText: '08...',
  //                   errorText: _isEnabledEditPhone
  //                       ? null
  //                       : phoneErrorText(_editPhoneValue),
  //                   controller: _editPhoneController,
  //                   onChanged: (val) {
  //                     _editPhoneValue = val;
  //                     _isEnabledEditPhone =
  //                         phoneErrorText(_editPhoneValue).isEmpty;
  //                     setState(() {});
  //                   },
  //                 ),
  //                 Padding(
  //                   padding:
  //                       const EdgeInsets.only(top: 16, right: 20, bottom: 50),
  //                   child: Row(
  //                     mainAxisAlignment: MainAxisAlignment.end,
  //                     children: [
  //                       ElevatedButtonWidget(
  //                           text: 'Submit',
  //                           onPressed: _isEnabledEditName && _isEnabledEditPhone
  //                               ? () {
  //                                   setState(() {
  //                                     contacts[index].name = _editNameValue;
  //                                     contacts[index].phone = _editPhoneValue;
  //                                     Navigator.pop(context);
  //                                   });
  //                                 }
  //                               : null)
  //                     ],
  //                   ),
  //                 ),
  //               ],
  //             ));
  //       });
  // }

  

