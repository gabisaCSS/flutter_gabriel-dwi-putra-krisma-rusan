import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openai_app/screen/recommendationi_screen/recommendation_bloc/recommendation_bloc.dart';

class RecommendationScreen extends StatefulWidget {
  const RecommendationScreen({super.key});

  @override
  State<RecommendationScreen> createState() => _RecommendationScreenState();
}

class _RecommendationScreenState extends State<RecommendationScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
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
                  label: Text('Budget'), hintText: 'ex : 15000000'),
              controller: _controller,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: ElevatedButton(
                  onPressed: () {
                    context
                        .read<RecommendationBloc>()
                        .add(GetRecommendationEvent(budget: _controller.text));
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
