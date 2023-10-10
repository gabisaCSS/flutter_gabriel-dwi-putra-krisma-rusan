import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'phone_field_event.dart';
part 'phone_field_state.dart';

class PhoneFieldBloc extends Bloc<PhoneFieldEvent, PhoneFieldState> {
  PhoneFieldBloc() : super(const PhoneFieldAmanState(phoneValue: '')) {
    on<PhoneFieldInputEvent>(_onPhoneChanged);
    on<PhoneFieldClearEvent>(_onClearPhoneField);
    on<PhoneFieldEditEvent>(_onEditPhoneField);
  }

  void _onClearPhoneField(
      PhoneFieldClearEvent event, Emitter<PhoneFieldState> emit) {
    emit(PhoneFieldClearState());
  }

  void _onEditPhoneField(
      PhoneFieldEditEvent event, Emitter<PhoneFieldState> emit) {
    emit(PhoneFieldEditState(currentPhoneValue: event.currentPhoneValue));
  }

  void _onPhoneChanged(
      PhoneFieldInputEvent event, Emitter<PhoneFieldState> emit) {
    String? phoneValue = event.value;
    RegExp regex = RegExp(r'^[0-9]+$');
    String errorText = '';

    if (phoneValue!.isEmpty) {
      errorText = 'Nomor Harus Di Isi';
    } else if (!regex.hasMatch(phoneValue)) {
      errorText = 'Nomor Hanya Boleh Angka';
    } else if (phoneValue[0] != '0') {
      errorText = 'Nomor Harus Di Awali Angka 0';
    } else if (phoneValue.length < 8) {
      errorText = 'Nomor Telepon Minimal 8 Digit';
    } else if (phoneValue.length > 15) {
      errorText = 'Nomor Telepon Maksimal 15 Digit';
    }

    if (errorText.isNotEmpty) {
      emit(PhoneFieldErrorState(errorText: errorText));
    } else {
      emit(PhoneFieldAmanState(phoneValue: phoneValue));
    }
  }
}
