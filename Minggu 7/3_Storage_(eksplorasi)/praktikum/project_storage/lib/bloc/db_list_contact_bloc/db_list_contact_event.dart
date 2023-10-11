part of 'db_list_contact_bloc.dart';

sealed class DbListContactEvent extends Equatable {
  const DbListContactEvent();

  @override
  List<Object> get props => [];
}

final class DbListContactFetchingDataEvent extends DbListContactEvent {}

final class DbListContactAddEvent extends DbListContactEvent {
  final ContactModel contactModel;

  const DbListContactAddEvent({required this.contactModel});

  @override
  List<Object> get props => [contactModel];
}

final class DbListContactUpdateEvent extends DbListContactEvent {
  final ContactModel contactModel;

  const DbListContactUpdateEvent({required this.contactModel});

  @override
  List<Object> get props => [contactModel];
}

final class DbListContactDeleteEvent extends DbListContactEvent {
  final int id;

  const DbListContactDeleteEvent({required this.id});

  @override
  List<Object> get props => [id];
}
