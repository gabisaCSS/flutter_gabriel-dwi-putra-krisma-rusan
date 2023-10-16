part of 'title_field_bloc.dart';

sealed class TitleFieldState extends Equatable {
  const TitleFieldState();

  @override
  List<Object> get props => [];
}

final class TitleFieldAmanState extends TitleFieldState {
  final String titleValue;

  const TitleFieldAmanState({required this.titleValue});

  @override
  List<Object> get props => [titleValue];
}

final class TitleFieldErrorState extends TitleFieldState {
  final String errorText;

  const TitleFieldErrorState({required this.errorText});

  @override
  List<Object> get props => [errorText];
}

final class TitleFieldClearState extends TitleFieldState {
  @override
  List<Object> get props => [];
}
