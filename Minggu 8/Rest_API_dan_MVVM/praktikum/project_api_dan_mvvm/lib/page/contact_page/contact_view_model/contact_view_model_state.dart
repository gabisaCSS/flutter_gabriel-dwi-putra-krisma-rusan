part of 'contact_view_model_bloc.dart';

sealed class ContactViewModelState extends Equatable {
  const ContactViewModelState();

  @override
  List<Object> get props => [];
}

final class ContactViewModelLoadedState extends ContactViewModelState {
  final ContactModel contactModel;

  const ContactViewModelLoadedState({required this.contactModel});

  @override
  List<Object> get props => [contactModel];
}

final class ContactViewModelLoadingState extends ContactViewModelState {}

final class ContactViewModelErrorState extends ContactViewModelState {
  final String errorMessage;

  const ContactViewModelErrorState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
