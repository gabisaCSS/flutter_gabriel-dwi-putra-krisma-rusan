part of 'username_field_bloc.dart';

sealed class UsernameFieldState extends Equatable {
  const UsernameFieldState();

  @override
  List<Object> get props => [];
}

// START state jika ada error di field username
final class UsernameFieldErrorState extends UsernameFieldState {
  final String? errorText;

  const UsernameFieldErrorState({
    this.errorText,
  });

  @override
  List<Object> get props => [errorText ?? ''];
}
// END state jika ada error di field username

// START state jika tidak ada error di field username
final class UsernameFieldAmanState extends UsernameFieldState {
  final String nameValue;

  const UsernameFieldAmanState({required this.nameValue});

  @override
  List<Object> get props => [nameValue];
}
// END state jika tidak ada error di field username
