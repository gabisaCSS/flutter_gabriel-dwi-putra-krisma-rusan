part of 'list_contact_bloc.dart';

sealed class ListContactState extends Equatable {
  const ListContactState();

  @override
  List<Object> get props => [];
}

final class ListContactValueState extends ListContactState {
  final List<ContactModel> listContact;

  const ListContactValueState({this.listContact = const <ContactModel>[]});

  @override
  List<Object> get props => [listContact];
}
