part of 'title_field_bloc.dart';

sealed class TitleFieldEvent extends Equatable {
  const TitleFieldEvent();

  @override
  List<Object> get props => [];
}

final class TitleFieldInputEvent extends TitleFieldEvent {
  final String titleValue;

  const TitleFieldInputEvent({required this.titleValue});

  @override
  List<Object> get props => [titleValue];
}

final class TitleFieldClearEvent extends TitleFieldEvent {}
