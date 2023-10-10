part of 'username_field_bloc.dart';

sealed class UsernameFieldEvent extends Equatable {
  const UsernameFieldEvent();
}

final class UsernameFieldInputEvent extends UsernameFieldEvent {
  final String? value;

  const UsernameFieldInputEvent({required this.value});

  @override
  List<Object> get props => [value ?? ""];
}

final class UsernameFieldClearEvent extends UsernameFieldEvent {
  @override
  List<Object?> get props => [];
}

final class UsernameFieldEditEvent extends UsernameFieldEvent {
  final String currentNameValue;

  const UsernameFieldEditEvent({
    required this.currentNameValue,
  });

  @override
  List<Object?> get props => [currentNameValue];
}
