import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'body_field_event.dart';
part 'body_field_state.dart';

class BodyFieldBloc extends Bloc<BodyFieldEvent, BodyFieldState> {
  BodyFieldBloc() : super(const BodyFieldAmanState(bodyValue: '')) {
    on<BodyFieldInputEvent>(_onBodyChanged);
    on<BodyFieldClearEvent>(_onBodyClear);
  }
  void _onBodyChanged(BodyFieldInputEvent event, Emitter<BodyFieldState> emit) {
    String bodyValue = event.bodyValue;

    if (bodyValue == '') {
      emit(const BodyFieldErrorState(errorText: 'Body Tidak Boleh Kosong'));
    } else {
      emit(BodyFieldAmanState(bodyValue: bodyValue));
    }
  }

  void _onBodyClear(BodyFieldClearEvent event, Emitter<BodyFieldState> emit) {
    emit(BodyFieldClearState());
  }
}
