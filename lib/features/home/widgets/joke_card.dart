import 'package:flutter/material.dart';
import 'package:winfox/domain/jokes/models/joke_model.dart';

class SimpleJokeCard extends StatelessWidget {
  final JokeModel jokeModel;

  const SimpleJokeCard({super.key, required this.jokeModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          width: 2,
          style: BorderStyle.solid,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Text(
                  jokeModel.text,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
