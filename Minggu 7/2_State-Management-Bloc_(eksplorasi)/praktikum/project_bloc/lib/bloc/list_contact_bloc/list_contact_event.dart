part of 'list_contact_bloc.dart';

sealed class ListContactEvent extends Equatable {
  const ListContactEvent();

  @override
  List<Object> get props => [];
}

final class AddNewContactEvent extends ListContactEvent {
  final String name;
  final String phone;

  const AddNewContactEvent({required this.name, required this.phone});

  @override
  List<Object> get props => [name, phone];
}

final class DeleteContactEvent extends ListContactEvent {
  final int index;

  const DeleteContactEvent({required this.index});

  @override
  List<Object> get props => [index];
}

final class EditContactEvent extends ListContactEvent {
  final String name;
  final String phone;
  final int index;

  const EditContactEvent(
      {required this.name, required this.phone, required this.index});

  @override
  List<Object> get props => [index, name, phone];
}
