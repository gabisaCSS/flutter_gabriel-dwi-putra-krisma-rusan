part of 'image_generator_bloc.dart';

sealed class ImageGeneratorEvent extends Equatable {
  const ImageGeneratorEvent();

  @override
  List<Object> get props => [];
}

final class ImageGeneratorGetEvent extends ImageGeneratorEvent {
  final String styleImage;
  final String seed;

  const ImageGeneratorGetEvent({required this.styleImage, required this.seed});

  @override
  List<Object> get props => [styleImage, seed];
}
