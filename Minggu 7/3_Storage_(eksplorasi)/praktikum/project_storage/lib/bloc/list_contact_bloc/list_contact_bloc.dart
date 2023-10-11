import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_gabriel/model/contact_model.dart';

part 'list_contact_event.dart';
part 'list_contact_state.dart';

class ListContactBloc extends Bloc<ListContactEvent, ListContactValueState> {
  ListContactBloc() : super(const ListContactValueState()) {
    on<AddNewContactEvent>(_onAddNewContact);
    on<DeleteContactEvent>(_onDeleteContact);
    on<EditContactEvent>(_onEditContact);
  }

  void _onAddNewContact(
      AddNewContactEvent event, Emitter<ListContactState> emit) {
    ContactModel newContact =
        ContactModel(name: event.name, phone: event.phone);

    var listContact = state.listContact.toList();

    listContact.add(newContact);

    emit(ListContactValueState(listContact: listContact));
  }

  void _onEditContact(EditContactEvent event, Emitter<ListContactState> emit) {
    ContactModel contact = ContactModel(name: event.name, phone: event.phone);

    var listContact = state.listContact.toList();

    listContact[event.index] = contact;

    emit(ListContactValueState(listContact: listContact));
  }

  void _onDeleteContact(
      DeleteContactEvent event, Emitter<ListContactState> emit) {
    var listContact = state.listContact.toList();

    listContact.removeAt(event.index);

    emit(ListContactValueState(listContact: listContact));
  }
}
