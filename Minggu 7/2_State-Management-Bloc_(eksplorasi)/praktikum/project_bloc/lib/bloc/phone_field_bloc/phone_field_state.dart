part of 'phone_field_bloc.dart';

sealed class PhoneFieldState extends Equatable {
  const PhoneFieldState();

  @override
  List<Object> get props => [];
}

final class PhoneFieldErrorState extends PhoneFieldState {
  final String? errorText;

  const PhoneFieldErrorState({this.errorText});

  @override
  List<Object> get props => [errorText ?? ''];
}

final class PhoneFieldAmanState extends PhoneFieldState {
  final String phoneValue;

  const PhoneFieldAmanState({required this.phoneValue});

  @override
  List<Object> get props => [phoneValue];
}

final class PhoneFieldClearState extends PhoneFieldState {
  @override
  List<Object> get props => [];
}

final class PhoneFieldEditState extends PhoneFieldState {
  final String currentPhoneValue;

  const PhoneFieldEditState({required this.currentPhoneValue});

  @override
  List<Object> get props => [currentPhoneValue];
}
