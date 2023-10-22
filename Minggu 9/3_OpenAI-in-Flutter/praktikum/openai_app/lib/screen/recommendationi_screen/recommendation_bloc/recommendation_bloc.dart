import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openai_app/models/openAi_model/openai_model.dart';
import 'package:openai_app/services/recommendation.dart';

part 'recommendation_event.dart';
part 'recommendation_state.dart';

class RecommendationBloc
    extends Bloc<RecommendationEvent, RecommendationState> {
  RecommendationBloc() : super(RecommendationInitial()) {
    on<GetRecommendationEvent>(_onGetRecommendation);
  }

  void _onGetRecommendation(
      GetRecommendationEvent event, Emitter<RecommendationState> emit) async {
    final String budget = event.budget;
    final String camera = event.camera;
    final String internalStorage = event.internalStorage;

    try {
      emit(RecommendationLoadingState());
      OpenAiModel openAiModel = await RecommendationService.getRecommendation(
          budget: budget, camera: camera, internalStorage: internalStorage);
      emit(RecommendationLoadedState(openAiModel: openAiModel));
    } catch (e) {
      emit(const RecommendationErrorState(
          errorMessage: 'Gagal Mendapatkan Rekomendasi!'));
    }
  }
}
