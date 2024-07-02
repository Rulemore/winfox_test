import 'package:flutter/material.dart';
import 'package:winfox/domain/jokes/models/joke_model.dart';

class JokeCard extends StatelessWidget {
  final JokeModel jokeModel;

  const JokeCard({super.key, required this.jokeModel});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Flexible(flex: 1, child: SizedBox.shrink()),
        Flexible(
          flex: 6,
          child: Container(
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
          ),
        )
      ],
    );
  }
}
