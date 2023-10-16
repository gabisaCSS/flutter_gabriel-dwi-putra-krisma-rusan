part of 'post_view_model_bloc.dart';

sealed class PostViewModelState extends Equatable {
  const PostViewModelState();

  @override
  List<Object> get props => [];
}

final class PostViewModelLoadedState extends PostViewModelState {
  final PostModel postModel;

  const PostViewModelLoadedState({required this.postModel});

  @override
  List<Object> get props => [postModel];
}

final class PostViewModelLoadingState extends PostViewModelState {}

final class PostViewModelErrorState extends PostViewModelState {
  final String errorMessage;

  const PostViewModelErrorState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
