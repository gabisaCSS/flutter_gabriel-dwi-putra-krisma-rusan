part of 'db_list_contact_bloc.dart';

sealed class DbListContactState extends Equatable {
  const DbListContactState();

  @override
  List<Object> get props => [];
}

final class DbListContactValueState extends DbListContactState {
  final List<ContactModel> listContact;

  const DbListContactValueState({this.listContact = const <ContactModel>[]});

  @override
  List<Object> get props => [listContact];
}

final class DbListContactLoadingState extends DbListContactState {}
