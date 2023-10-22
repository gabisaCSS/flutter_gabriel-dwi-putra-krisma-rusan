import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openai_app/screen/recommendationi_screen/recommendation_bloc/recommendation_bloc.dart';

class RecommendationScreen extends StatefulWidget {
  const RecommendationScreen({super.key});

  @override
  State<RecommendationScreen> createState() => _RecommendationScreenState();
}

class _RecommendationScreenState extends State<RecommendationScreen> {
  final TextEditingController _budgetController = TextEditingController();
  final TextEditingController _cameraController = TextEditingController();
  final TextEditingController _storageController = TextEditingController();

  @override
  void dispose() {
    _budgetController.dispose();
    _cameraController.dispose();
    _storageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Smartphone Recommendation'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text('GET SMARTPHONE RECOMMENDATION')],
              ),
            ),
            TextField(
              decoration: const InputDecoration(
                  label: Text('Budget'), hintText: 'insert your budget in IDR'),
              controller: _budgetController,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              height: 24,
            ),
            TextField(
              decoration: const InputDecoration(
                  label: Text('Camera(mp)'),
                  hintText: 'insert your camera spec in mega pixel'),
              controller: _cameraController,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              height: 24,
            ),
            TextField(
              decoration: const InputDecoration(
                  label: Text('Storage'), hintText: 'ex: 128GB'),
              controller: _storageController,
            ),
            const SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: ElevatedButton(
                  onPressed: () {
                    context.read<RecommendationBloc>().add(
                        GetRecommendationEvent(
                            budget: _budgetController.text,
                            camera: _cameraController.text,
                            internalStorage: _storageController.text));
                  },
                  child: const Text('Get Recommendation')),
            ),
            const Text('Recommendation : '),
            BlocBuilder<RecommendationBloc, RecommendationState>(
              builder: (context, state) {
                if (state is RecommendationLoadingState) {
                  return const Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [CircularProgressIndicator()],
                    ),
                  );
                } else if (state is RecommendationLoadedState) {
                  return Text(state.openAiModel.choices.first.text);
                } else if (state is RecommendationErrorState) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 24),
                    child: Text(state.errorMessage),
                  );
                } else {
                  return const SizedBox();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
