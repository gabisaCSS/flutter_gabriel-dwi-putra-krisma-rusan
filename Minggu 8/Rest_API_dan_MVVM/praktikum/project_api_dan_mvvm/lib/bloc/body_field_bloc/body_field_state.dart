part of 'body_field_bloc.dart';

sealed class BodyFieldState extends Equatable {
  const BodyFieldState();

  @override
  List<Object> get props => [];
}

final class BodyFieldAmanState extends BodyFieldState {
  final String bodyValue;

  const BodyFieldAmanState({required this.bodyValue});

  @override
  List<Object> get props => [bodyValue];
}

final class BodyFieldErrorState extends BodyFieldState {
  final String errorText;

  const BodyFieldErrorState({required this.errorText});

  @override
  List<Object> get props => [errorText];
}

final class BodyFieldClearState extends BodyFieldState {
  @override
  List<Object> get props => [];
}
