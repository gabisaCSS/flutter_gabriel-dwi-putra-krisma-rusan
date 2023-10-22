part of 'recommendation_bloc.dart';

sealed class RecommendationEvent extends Equatable {
  const RecommendationEvent();

  @override
  List<Object> get props => [];
}

final class GetRecommendationEvent extends RecommendationEvent {
  final String budget;

  const GetRecommendationEvent({required this.budget});

  @override
  List<Object> get props => [budget];
}
