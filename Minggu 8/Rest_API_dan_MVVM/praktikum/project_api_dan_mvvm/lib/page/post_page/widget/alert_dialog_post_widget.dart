import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_gabriel/model/post/post_model.dart';
import 'package:project_gabriel/page/post_page/post_view_model/post_view_model_bloc.dart';

class AlertDialogPostWidget extends StatelessWidget {
  const AlertDialogPostWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostViewModelBloc, PostViewModelState>(
      builder: (context, state) {
        if (state is PostViewModelLoadingState) {
          return const AlertDialog(
            title: Text('Sedang Mengirim Update Data...'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(),
              ],
            ),
          );
        } else if (state is PostViewModelLoadedState) {
          PostModel postModel = state.postModel;
          return AlertDialog(
            title: const Text(
              'Post Berhasil Diupdate!',
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Id          : ${postModel.id}'),
                Text('User Id : ${postModel.userId}'),
                Text('Title     : ${postModel.title}'),
                Text('Body    : ${postModel.body}'),
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
        } else if (state is PostViewModelErrorState) {
          return AlertDialog(
            title: const Text('Terjadi Error!'),
            content: const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 24,
                ),
                Text('Gagal Update Post!')
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
