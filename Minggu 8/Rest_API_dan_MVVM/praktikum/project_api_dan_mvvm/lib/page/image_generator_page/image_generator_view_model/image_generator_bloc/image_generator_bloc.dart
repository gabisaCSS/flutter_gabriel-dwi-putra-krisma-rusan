import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_gabriel/model/dicebear/dicebar_api/dicebear_api.dart';

part 'image_generator_event.dart';
part 'image_generator_state.dart';

class ImageGeneratorBloc
    extends Bloc<ImageGeneratorEvent, ImageGeneratorState> {
  ImageGeneratorBloc() : super(ImageGeneratorInitialState()) {
    on<ImageGeneratorGetEvent>(_onGetImage);
  }
  void _onGetImage(
      ImageGeneratorGetEvent event, Emitter<ImageGeneratorState> emit) async {
    try {
      emit(ImageGeneratorLoadingState());
      final String imageData = await DicebearApi.getDicebear(
          imageStyle: event.styleImage, seed: event.seed);
      emit(ImageGeneratorLoadedState(imageData: imageData));
    } catch (e) {
      emit(const ImageGeneratorErrorState());
    }
  }
}
