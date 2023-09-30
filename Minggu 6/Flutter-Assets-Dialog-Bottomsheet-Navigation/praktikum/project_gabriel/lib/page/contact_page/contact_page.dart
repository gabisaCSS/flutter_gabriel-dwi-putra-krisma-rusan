import 'package:flutter/material.dart';
import 'package:project_gabriel/model/contact_model.dart';
import 'package:project_gabriel/page/contact_page/widget/header_contact_page.dart';
import 'package:project_gabriel/theme/color_theme/ligth_theme.dart';
import 'package:project_gabriel/theme/text_style_theme/text_style_theme.dart';
import 'package:project_gabriel/widget/drawer_widget.dart';
import 'package:project_gabriel/widget/elevated_button_widget.dart';
import 'package:project_gabriel/widget/jarak_widget.dart';
import 'package:project_gabriel/widget/text_field_widget.dart';
import 'package:intl/intl.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:file_picker/file_picker.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  String _nameValue = "";
  String _phoneValue = "";

  List<ContactModel> contacts = [];

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  bool _isEnabledName = false;
  bool _isEnabledPhone = false;

  String _editNameValue = '';
  String _editPhoneValue = '';

  bool _isEnabledEditName = true;
  bool _isEnabledEditPhone = true;

  final TextEditingController _editNameController = TextEditingController();
  final TextEditingController _editPhoneController = TextEditingController();

  DateTime _dueDate = DateTime.now();
  final currentDate = DateTime.now();

  Color _currentColor = LightTheme().m3SysLightPrimary;

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
      drawer: const DrawerWidget(),
      body: ListView(
        children: [
          const HeaderContactPage(),
          TextFieldWidget(
            label: 'Name',
            hintText: 'Insert Your Name',
            errorText: _isEnabledName ? null : nameErrorText(_nameValue),
            controller: _nameController,
            onChanged: (val) {
              _nameValue = val;
              _isEnabledName = nameErrorText(_nameValue).isEmpty;
              setState(() {});
            },
          ),
          const JarakVertikal(16),
          TextFieldWidget(
            label: 'Nomor',
            hintText: '08...',
            errorText: _isEnabledPhone ? null : phoneErrorText(_phoneValue),
            keyboardType: TextInputType.number,
            controller: _phoneController,
            onChanged: (val) {
              _phoneValue = val;
              _isEnabledPhone = phoneErrorText(_phoneValue).isEmpty;
              setState(() {});
            },
          ),
          buildDatePicker(context, dueDate: _dueDate),
          const JarakVertikal(16),
          buildColorPicker(context, color: _currentColor),
          const JarakVertikal(16),
          buildFilePicker(context),
          Padding(
            padding: const EdgeInsets.only(top: 16, right: 20, bottom: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButtonWidget(
                    text: 'Submit',
                    onPressed: _isEnabledName && _isEnabledPhone
                        ? onPressedButtonSubmit
                        : null)
              ],
            ),
          ),
          buildListContacts()
        ],
      ),
    );
  }

  // widget
  Widget buildListContacts() {
    return Column(
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
            itemCount: contacts.length,
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemBuilder: (context, index) {
              var data = contacts[index];
              String formatedDate = DateFormat('dd-MM-yyyy').format(data.date);
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: LightTheme().m3SysLightPrimaryContainer,
                  child: Text(data.name[0]),
                ),
                title: Text(
                  data.name,
                  style: TextStyleTheme().m3BodyLarge(),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.phone,
                      style: TextStyleTheme().m3BodyMedium(),
                    ),
                    Text(
                      'Date = $formatedDate',
                      style: TextStyleTheme().m3BodyMedium(),
                    ),
                    Row(
                      children: [
                        Text(
                          'Color = ',
                          style: TextStyleTheme().m3BodyMedium(),
                        ),
                        Container(
                          height: 10,
                          width: 10,
                          color: data.pickedColor,
                        )
                      ],
                    ),
                    Text(
                      'File Name = ${data.fileName}',
                      style: TextStyleTheme().m3BodyMedium(),
                    ),
                  ],
                ),
                trailing: Wrap(
                  // spacing: 4,
                  children: [
                    IconButton(
                        onPressed: () => onPressedIconEdit(index),
                        icon: const Icon(Icons.edit)),
                    IconButton(
                        onPressed: () => onPressedIconDelete(index),
                        icon: const Icon(Icons.delete))
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }

  DateTime? _editDueDate;

  // widget untuk milih tanggal
  Widget buildDatePicker(BuildContext context,
      {bool isEdit = false,
      required DateTime dueDate,
      StateSetter? modalSetState}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Date'),
              TextButton(
                  onPressed: () async {
                    final selectDate = await showDatePicker(
                        context: context,
                        initialDate: dueDate,
                        firstDate: DateTime(1990),
                        lastDate: DateTime(currentDate.year + 5));

                    if (selectDate != null) {
                      if (isEdit) {
                        modalSetState!(() {
                          _editDueDate = selectDate;
                        });
                      } else {
                        setState(() {
                          _dueDate = selectDate;
                        });
                      }
                    }
                  },
                  child: const Text('Select'))
            ],
          ),
          Text(DateFormat('dd-MM-yyyy').format(dueDate))
        ],
      ),
    );
  }

  Color _editColor = LightTheme().m3SysLightPrimary;

  // function untuk milih warna
  Widget buildColorPicker(BuildContext context,
      {bool isEdit = false, required Color color, StateSetter? modalSetState}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Color'),
          Container(
            height: 100,
            width: double.infinity,
            color: color,
          ),
          const JarakVertikal(10),
          Center(
              child: ElevatedButtonWidget(
                  text: 'Pick Color',
                  color: color,
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Pick Your Color'),
                            content: SingleChildScrollView(
                              child: ColorPicker(
                                pickerColor: color,
                                onColorChanged: (newColor) {
                                  if (isEdit) {
                                    // ini untuk mengubah state di modal (karena saya menggunakan bottom sheet)
                                    modalSetState!(() {
                                      _editColor = newColor;
                                    });
                                  } else {
                                    // ini untuk mengubah state di parent
                                    setState(() {
                                      _currentColor = newColor;
                                    });
                                  }
                                },
                              ),
                            ),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Save'))
                            ],
                          );
                        });
                  }))
        ],
      ),
    );
  }

  // ui file picker
  Widget buildFilePicker(
    BuildContext context, {
    bool isEdit = false,
    StateSetter? modalSetState,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Pick Files'),
          const JarakVertikal(8),
          Center(
            child: ElevatedButtonWidget(
              onPressed: () async {
                final result = await FilePicker.platform.pickFiles();
                if (result == null) return;

                final file = result.files.first;

                if (isEdit) {
                  modalSetState!(() {
                    _editFileName = file.name;
                  });
                } else {
                  setState(() {
                    _fileName = file.name;
                  });
                }
              },
              text: 'Pick File',
              color: LightTheme().m3SysLightOnSurfaceVariant,
            ),
          ),
          const JarakVertikal(16),
          Text(isEdit ? 'Nama file = $_editFileName' : 'Nama file = $_fileName')
        ],
      ),
    );
  }

  String _fileName = '';
  String _editFileName = '';
  // function untuk ngambil file
  // void _pickFile({bool isEdit = false, State}) async {
  //   final result = await FilePicker.platform.pickFiles();
  //   if (result == null) return;

  //   final file = result.files.first;

  //   if (isEdit) {
  //     _editFileName = file.name;
  //   } else {
  //     _fileName = file.name;
  //   }
  //   // _openFile(file);
  // }

  // function untuk buka file
  // void _openFile(PlatformFile file) {
  //   OpenFile.open(file.path);
  // }

  // function untuk mendapatkan pesan eror text field nama
  String nameErrorText(String value) {
    List<String> nameValueWords = value.split(' ');
    RegExp regex = RegExp(r'[0-9!@#$%^&*()_+{}\[\]:;<>,.?~\\|]');

    if (value.isEmpty) return 'Nama Harus Di Isi';
    if (nameValueWords.length < 2) return 'Nama Minimal 2 Kata';

    for (var word in nameValueWords) {
      // print(word);
      if (!isUpperCase(word[0])) {
        return 'Tiap Kata Harus Di Awali Kapital';
      }
    }

    if (regex.hasMatch(value)) {
      return 'Nama Tidak Boleh Memiliki Angka atau Simbol Khusus';
    }

    return '';
  }

  // function untuk mendapatkan pesan eror pada text field nomor
  String phoneErrorText(String value) {
    RegExp regex = RegExp(r'^[0-9]+$');

    if (value.isEmpty) return 'Nomor Harus Di Isi';
    if (!regex.hasMatch(value)) return 'Nomor Hanya Boleh Angka';
    if (value[0] != '0') return 'Nomor Harus Di Awali Angka 0';
    if (value.length < 8) return 'Nomor Telepon Minimal 8 Digit';
    if (value.length > 15) return 'Nomor Telepon Maksimal 15 Digit';

    return '';
  }

  // function yang mereturn true jika stringnya huruf kapital
  bool isUpperCase(String firstLetter) {
    if (firstLetter == '') return false;
    if (firstLetter == firstLetter.toUpperCase()) return true;
    return false;
  }

  // function untuk menambahkan data contact baru pada list
  void addContact() {
    ContactModel data = ContactModel(
        name: _nameValue,
        phone: _phoneValue,
        date: _dueDate,
        fileName: _fileName,
        pickedColor: _currentColor);
    contacts.add(data);
  }

  // function untuk menghapus contact
  void deleteContact(int index) {
    contacts.removeAt(index);
  }

  // function untuk clear text field dan value
  void clearTextField() {
    _nameController.clear();
    _phoneController.clear();
    _nameValue = '';
    _phoneValue = '';
    _dueDate = DateTime.now();
    _fileName = '';
    _currentColor = LightTheme().m3SysLightPrimary;
    _isEnabledName = false;
    _isEnabledPhone = false;
  }

  // fungsi ini bisa untuk tombol submit untuk nambah contact
  void onPressedButtonSubmit() {
    setState(() {
      addContact();
      clearTextField();
    });
  }

  void onPressedIconDelete(int index) {
    setState(() {
      deleteContact(index);
    });
  }

  void onPressedIconEdit(int index) {
    ContactModel data = contacts[index];

    _editNameController.text = data.name;
    _editPhoneController.text = data.phone;

    _editNameValue = data.name;
    _editPhoneValue = data.phone;

    _editColor = data.pickedColor;

    _editFileName = data.fileName;

    _editDueDate = data.date;

    showModalBottomSheet(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, modalSetState) {
            return Container(
                height: double.infinity,
                width: double.infinity,
                color: LightTheme().m3SysLightBackground,
                child: ListView(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const JarakVertikal(24),
                    Center(
                      child: Text(
                        'Edit Contact',
                        style: TextStyleTheme().m3HeadlineSmall(),
                      ),
                    ),
                    const JarakVertikal(24),
                    TextFieldWidget(
                      label: 'Name',
                      hintText: 'Insert Your Name',
                      errorText: _isEnabledEditName
                          ? null
                          : nameErrorText(_editNameValue),
                      controller: _editNameController,
                      onChanged: (val) {
                        _editNameValue = val;
                        _isEnabledEditName =
                            nameErrorText(_editNameValue).isEmpty;
                        setState(() {});
                      },
                    ),
                    const JarakVertikal(16),
                    TextFieldWidget(
                      label: 'Phone',
                      hintText: '08...',
                      errorText: _isEnabledEditPhone
                          ? null
                          : phoneErrorText(_editPhoneValue),
                      controller: _editPhoneController,
                      onChanged: (val) {
                        _editPhoneValue = val;
                        _isEnabledEditPhone =
                            phoneErrorText(_editPhoneValue).isEmpty;
                        setState(() {});
                      },
                    ),
                    buildDatePicker(context,
                        dueDate: _editDueDate ?? DateTime.now(),
                        isEdit: true,
                        modalSetState: modalSetState),
                    const JarakVertikal(16),
                    buildColorPicker(context,
                        color: _editColor,
                        isEdit: true,
                        modalSetState: modalSetState),
                    const JarakVertikal(16),
                    buildFilePicker(context,
                        isEdit: true, modalSetState: modalSetState),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 16, right: 20, bottom: 50),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButtonWidget(
                              text: 'Simpan',
                              onPressed: _isEnabledEditName &&
                                      _isEnabledEditPhone
                                  ? () {
                                      setState(() {
                                        contacts[index].name = _editNameValue;
                                        contacts[index].phone = _editPhoneValue;
                                        contacts[index].date =
                                            _editDueDate ?? DateTime.now();
                                        contacts[index].fileName =
                                            _editFileName;
                                        contacts[index].pickedColor =
                                            _editColor;
                                        Navigator.pop(context);
                                      });
                                    }
                                  : null)
                        ],
                      ),
                    ),
                  ],
                ));
          });
        });
  }

  @override
  void dispose() {
    _editPhoneController.dispose();
    _editNameController.dispose();
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }
}
