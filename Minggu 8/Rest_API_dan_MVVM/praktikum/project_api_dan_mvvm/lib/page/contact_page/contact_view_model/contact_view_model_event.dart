part of 'contact_view_model_bloc.dart';

sealed class ContactViewModelEvent extends Equatable {
  const ContactViewModelEvent();

  @override
  List<Object> get props => [];
}

final class ContactViewModelPostEvent extends ContactViewModelEvent {
  final ContactModel contactModel;

  const ContactViewModelPostEvent({required this.contactModel});

  @override
  List<Object> get props => [contactModel];
}
