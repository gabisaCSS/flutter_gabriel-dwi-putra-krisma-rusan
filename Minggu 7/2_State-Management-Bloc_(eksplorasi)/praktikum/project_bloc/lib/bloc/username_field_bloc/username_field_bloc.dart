import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'username_field_event.dart';
part 'username_field_state.dart';

class UsernameFieldBloc extends Bloc<UsernameFieldEvent, UsernameFieldState> {
  UsernameFieldBloc() : super(const UsernameFieldAmanState(nameValue: '')) {
    on<UsernameFieldInputEvent>(_onUsernameChanged);
    on<UsernameFieldClearEvent>(_onClearUsernameField);
    on<UsernameFieldEditEvent>(_onEditUsernameField);
  }

  void _onClearUsernameField(
      UsernameFieldClearEvent event, Emitter<UsernameFieldState> emit) {
    emit(const UsernameFieldAmanState(nameValue: ''));
  }

  void _onEditUsernameField(
      UsernameFieldEditEvent event, Emitter<UsernameFieldState> emit) {
    emit(UsernameFieldAmanState(nameValue: event.currentNameValue));
  }

  void _onUsernameChanged(
      UsernameFieldInputEvent event, Emitter<UsernameFieldState> emit) {
    String? nameValue = event.value;
    List<String> nameValueWords = nameValue!.split(' ');
    RegExp regex = RegExp(r'[0-9!@#$%^&*()_+{}\[\]:;<>,.?~\\|]');

    String errorText = '';

    if (nameValue.isEmpty) {
      errorText = 'Nama Tidak Boleh Kosong';
    } else if (nameValueWords.length < 2) {
      errorText = 'Nama Minimal 2 Kata';
    } else if (regex.hasMatch(nameValue)) {
      errorText = 'Nama Tidak Boleh Memilki Angka atau Simbol Khusus';
    } else if (nameValueWords.isNotEmpty) {
      for (var word in nameValueWords) {
        // print('kata = $word');
        if (word.isEmpty || word[0] != word[0].toUpperCase()) {
          errorText = 'Tiap Kata Harus Di Awali Kapital';
          break;
        }
      }
    }

    if (errorText.isNotEmpty) {
      emit(UsernameFieldErrorState(
        errorText: errorText,
      ));
    } else {
      emit(UsernameFieldAmanState(nameValue: nameValue));
    }
  }
}
