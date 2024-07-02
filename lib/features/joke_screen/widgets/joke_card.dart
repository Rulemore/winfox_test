import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:winfox/domain/jokes/models/joke_model.dart';
import 'package:winfox/features/app/cubit/theme_cubit.dart';

class JokeCard extends StatelessWidget {
  final JokeModel jokeModel;

  const JokeCard({super.key, required this.jokeModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(25),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: context.read<ThemeCubit>().isDarkTheme ? Colors.grey : Colors.black,
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          color: context.read<ThemeCubit>().isDarkTheme ? Colors.grey : Colors.black,
                          width: 2,
                          style: BorderStyle.solid,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0),
                        child: Text(
                          jokeModel.rating.toStringAsFixed(2),
                          style: TextStyle(
                              color: !context.read<ThemeCubit>().isDarkTheme ? Colors.white : Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
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
