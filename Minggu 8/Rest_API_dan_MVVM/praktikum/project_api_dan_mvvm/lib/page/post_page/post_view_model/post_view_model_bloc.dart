import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_gabriel/model/post/post_api/post_api.dart';
import 'package:project_gabriel/model/post/post_model.dart';

part 'post_view_model_event.dart';
part 'post_view_model_state.dart';

class PostViewModelBloc extends Bloc<PostViewModelEvent, PostViewModelState> {
  PostViewModelBloc() : super(PostViewModelLoadingState()) {
    on<PostViewModelPutEvent>(_onPutEvent);
  }

  void _onPutEvent(
      PostViewModelPutEvent event, Emitter<PostViewModelState> emit) async {
    try {
      emit(PostViewModelLoadingState());
      PostModel newPostModel = await PostApi.putPost(
          id: event.id,
          title: event.title,
          body: event.body,
          userId: event.userId);
      emit(PostViewModelLoadedState(postModel: newPostModel));
    } catch (e) {
      emit(const PostViewModelErrorState(
          errorMessage: 'Gagal Membuat Post Baru'));
    }
  }
}
