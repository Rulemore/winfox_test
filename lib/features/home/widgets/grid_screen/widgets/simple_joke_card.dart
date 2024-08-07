import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:winfox/domain/jokes/models/joke_model.dart';
import 'package:winfox/features/app/cubit/theme_cubit.dart';
import 'package:winfox/features/joke_screen/joke_screen.dart';

class SimpleJokeCard extends StatelessWidget {
  final JokeModel jokeModel;

  const SimpleJokeCard({super.key, required this.jokeModel});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(25),
      child: InkWell(
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => JokeScreen(
                jokeModel: jokeModel,
              ),
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            border: Border.all(
              color: context.read<ThemeCubit>().isDarkTheme ? Colors.grey : Colors.black,
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
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Text(
                    jokeModel.text,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
