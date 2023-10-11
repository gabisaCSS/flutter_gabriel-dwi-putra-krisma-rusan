import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_gabriel/helper/database_helper.dart';
import 'package:project_gabriel/model/contact_model.dart';

part 'db_list_contact_event.dart';
part 'db_list_contact_state.dart';

class DbListContactBloc extends Bloc<DbListContactEvent, DbListContactState> {
  final DatabaseHelper _dbHelper = DatabaseHelper();
  DbListContactBloc() : super(DbListContactLoadingState()) {
    on<DbListContactFetchingDataEvent>(_onFetchingDataEvent);
    on<DbListContactAddEvent>(_onAddEvent);
    on<DbListContactDeleteEvent>(_onDeleteEvent);
    on<DbListContactUpdateEvent>(_onUpdateEvent);
  }

  void _onFetchingDataEvent(DbListContactFetchingDataEvent event,
      Emitter<DbListContactState> emit) async {
    emit(DbListContactLoadingState());
    List<ContactModel> listContact = await _dbHelper.getContacts();

    emit(DbListContactValueState(listContact: listContact));
  }

  void _onAddEvent(
      DbListContactAddEvent event, Emitter<DbListContactState> emit) async {
    ContactModel contactModel = event.contactModel;

    await _dbHelper.insertContact(contactModel);

    List<ContactModel> listContact = await _dbHelper.getContacts();

    emit(DbListContactValueState(listContact: listContact));
  }

  void _onUpdateEvent(
      DbListContactUpdateEvent event, Emitter<DbListContactState> emit) async {
    ContactModel contactModel = event.contactModel;

    await _dbHelper.updateContact(contactModel);

    List<ContactModel> listContact = await _dbHelper.getContacts();

    emit(DbListContactValueState(listContact: listContact));
  }

  void _onDeleteEvent(
      DbListContactDeleteEvent event, Emitter<DbListContactState> emit) async {
    int id = event.id;

    await _dbHelper.deleteContact(id);

    List<ContactModel> listContact = await _dbHelper.getContacts();

    emit(DbListContactValueState(listContact: listContact));
  }
}
