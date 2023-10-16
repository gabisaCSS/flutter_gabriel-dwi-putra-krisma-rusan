import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_gabriel/page/image_generator_page/image_generator_view_model/image_generator_bloc/image_generator_bloc.dart';

class ImageScreenWidget extends StatelessWidget {
  const ImageScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImageGeneratorBloc, ImageGeneratorState>(
        builder: (context, state) {
      if (state is ImageGeneratorInitialState) {
        return const Icon(
          Icons.image_outlined,
          size: 150,
        );
      } else if (state is ImageGeneratorLoadingState) {
        return const SizedBox(
            height: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(),
              ],
            ));
      } else if (state is ImageGeneratorLoadedState) {
        return SizedBox(
            height: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.string(
                  state.imageData,
                  height: 150,
                ),
              ],
            ));
      } else if (state is ImageGeneratorErrorState) {
        return SizedBox(
            height: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(state.errorText),
              ],
            ));
      } else {
        return const SizedBox();
      }
    });
  }
}
