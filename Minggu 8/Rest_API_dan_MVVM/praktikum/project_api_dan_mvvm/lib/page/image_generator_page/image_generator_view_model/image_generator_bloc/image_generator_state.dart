part of 'image_generator_bloc.dart';

sealed class ImageGeneratorState extends Equatable {
  const ImageGeneratorState();

  @override
  List<Object> get props => [];
}

final class ImageGeneratorInitialState extends ImageGeneratorState {}

final class ImageGeneratorLoadingState extends ImageGeneratorState {}

final class ImageGeneratorLoadedState extends ImageGeneratorState {
  final String imageData;

  const ImageGeneratorLoadedState({required this.imageData});

  @override
  List<Object> get props => [imageData];
}

final class ImageGeneratorErrorState extends ImageGeneratorState {
  final String errorText;

  const ImageGeneratorErrorState({this.errorText = 'Gagal Generate Image!'});

  @override
  List<Object> get props => [errorText];
}
