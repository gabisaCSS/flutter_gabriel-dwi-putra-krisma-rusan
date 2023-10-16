part of 'post_view_model_bloc.dart';

sealed class PostViewModelEvent extends Equatable {
  const PostViewModelEvent();

  @override
  List<Object> get props => [];
}

final class PostViewModelPutEvent extends PostViewModelEvent {
  final String title;
  final String body;
  final int id;
  final int? userId;

  const PostViewModelPutEvent(
      {required this.title, required this.body, required this.id, this.userId});

  @override
  List<Object> get props => [title, body, id, userId ?? 0];
}
