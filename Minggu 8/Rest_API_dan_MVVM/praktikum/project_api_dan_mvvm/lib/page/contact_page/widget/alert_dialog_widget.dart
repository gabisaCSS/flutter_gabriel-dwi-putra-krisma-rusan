import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_gabriel/model/contact/contact_model.dart';
import 'package:project_gabriel/page/contact_page/contact_view_model/contact_view_model_bloc.dart';

class AlertDialogWidget extends StatelessWidget {
  const AlertDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactViewModelBloc, ContactViewModelState>(
      builder: (context, state) {
        if (state is ContactViewModelLoadingState) {
          return const AlertDialog(
            title: Text('Sedang Mengirim Data...'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(),
              ],
            ),
          );
        } else if (state is ContactViewModelLoadedState) {
          ContactModel contactModel = state.contactModel;
          return AlertDialog(
            title: const Text(
              'Kontak Baru Berhasil Dibuat!',
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Id    : ${contactModel.id}'),
                Text('Nama  : ${contactModel.name}'),
                Text('Phone : ${contactModel.phone}'),
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'oke',
                  ))
            ],
          );
        } else if (state is ContactViewModelErrorState) {
          return AlertDialog(
            title: const Text('Terjadi Error!'),
            content: const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 24,
                ),
                Text('Gagal Membuat Kontak Baru!')
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'oke',
                  ))
            ],
          );
        } else {
          return const AlertDialog();
        }
      },
    );
  }
}
