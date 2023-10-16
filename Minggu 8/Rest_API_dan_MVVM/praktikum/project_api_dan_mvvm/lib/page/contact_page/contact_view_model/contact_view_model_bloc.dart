import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_gabriel/model/contact/contact_api/contact_api.dart';
import 'package:project_gabriel/model/contact/contact_model.dart';

part 'contact_view_model_event.dart';
part 'contact_view_model_state.dart';

class ContactViewModelBloc
    extends Bloc<ContactViewModelEvent, ContactViewModelState> {
  ContactViewModelBloc() : super(ContactViewModelLoadingState()) {
    on<ContactViewModelPostEvent>(_onPostEvent);
  }

  void _onPostEvent(ContactViewModelPostEvent event,
      Emitter<ContactViewModelState> emit) async {
    try {
      emit(ContactViewModelLoadingState());
      ContactModel newContactModel =
          await ContactApi.postContact(contactModel: event.contactModel);
      emit(ContactViewModelLoadedState(contactModel: newContactModel));
    } catch (e) {
      emit(const ContactViewModelErrorState(
          errorMessage: 'Gagal Membuat Contact Baru'));
    }
  }
}
