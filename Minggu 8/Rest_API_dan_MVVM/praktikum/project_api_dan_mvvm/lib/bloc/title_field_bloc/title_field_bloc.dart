import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'title_field_event.dart';
part 'title_field_state.dart';

class TitleFieldBloc extends Bloc<TitleFieldEvent, TitleFieldState> {
  TitleFieldBloc() : super(const TitleFieldAmanState(titleValue: '')) {
    on<TitleFieldInputEvent>(_onTitleChanged);
    on<TitleFieldClearEvent>(_onTitleClear);
  }
  void _onTitleChanged(
      TitleFieldInputEvent event, Emitter<TitleFieldState> emit) {
    String titleValue = event.titleValue;

    if (titleValue == '') {
      emit(const TitleFieldErrorState(errorText: 'Title Tidak Boleh Kosong'));
    } else {
      emit(TitleFieldAmanState(titleValue: titleValue));
    }
  }

  void _onTitleClear(
      TitleFieldClearEvent event, Emitter<TitleFieldState> emit) {
    emit(TitleFieldClearState());
  }
}
