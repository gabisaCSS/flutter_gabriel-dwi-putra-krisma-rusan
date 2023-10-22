part of 'recommendation_bloc.dart';

sealed class RecommendationState extends Equatable {
  const RecommendationState();

  @override
  List<Object> get props => [];
}

final class RecommendationInitial extends RecommendationState {}

final class RecommendationLoadingState extends RecommendationState {}

final class RecommendationLoadedState extends RecommendationState {
  final OpenAiModel openAiModel;

  const RecommendationLoadedState({required this.openAiModel});

  @override
  List<Object> get props => [openAiModel];
}

final class RecommendationErrorState extends RecommendationState {
  final String errorMessage;

  const RecommendationErrorState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
