part of 'recommendation_bloc.dart';

sealed class RecommendationEvent extends Equatable {
  const RecommendationEvent();

  @override
  List<Object> get props => [];
}

final class GetRecommendationEvent extends RecommendationEvent {
  final String budget;
  final String camera;
  final String internalStorage;

  const GetRecommendationEvent(
      {required this.camera,
      required this.internalStorage,
      required this.budget});

  @override
  List<Object> get props => [budget, camera, internalStorage];
}
