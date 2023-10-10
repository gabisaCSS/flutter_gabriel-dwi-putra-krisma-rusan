part of 'phone_field_bloc.dart';

sealed class PhoneFieldEvent extends Equatable {
  const PhoneFieldEvent();
}

class PhoneFieldInputEvent extends PhoneFieldEvent {
  final String? value;

  const PhoneFieldInputEvent({required this.value});

  @override
  List<Object> get props => [value ?? ""];
}

final class PhoneFieldClearEvent extends PhoneFieldEvent {
  @override
  List<Object> get props => [];
}

final class PhoneFieldEditEvent extends PhoneFieldEvent {
  final String currentPhoneValue;

  const PhoneFieldEditEvent({required this.currentPhoneValue});

  @override
  List<Object> get props => [currentPhoneValue];
}
