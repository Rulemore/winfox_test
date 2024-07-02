import 'package:flutter/material.dart';
import 'package:winfox/domain/jokes/models/joke_model.dart';
import 'package:winfox/features/joke_screen/widgets/joke_card.dart';

class JokeScreen extends StatelessWidget {
  final JokeModel jokeModel;
  const JokeScreen({super.key, required this.jokeModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Анекдот №${jokeModel.id}'),
      ),
      body: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Flexible(flex: 1, child: SizedBox.shrink()),
        Flexible(
            flex: 6,
            child: JokeCard(
              jokeModel: jokeModel,
            ))
      ]),
    );
  }
}
