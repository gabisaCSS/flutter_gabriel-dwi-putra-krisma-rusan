part of 'body_field_bloc.dart';

sealed class BodyFieldEvent extends Equatable {
  const BodyFieldEvent();

  @override
  List<Object> get props => [];
}

final class BodyFieldInputEvent extends BodyFieldEvent {
  final String bodyValue;

  const BodyFieldInputEvent({required this.bodyValue});

  @override
  List<Object> get props => [bodyValue];
}

final class BodyFieldClearEvent extends BodyFieldEvent {}
