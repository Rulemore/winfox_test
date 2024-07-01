import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:winfox/core/app_state.dart';
import 'package:winfox/domain/jokes/models/joke_model.dart';
import 'package:winfox/features/home/cubit/home_screen_cubit.dart';
import 'package:winfox/features/home/widgets/joke_card.dart';

class GridScreen extends StatefulWidget {
  const GridScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<GridScreen> createState() => _GridScreenState();
}

class _GridScreenState extends State<GridScreen> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: context.read<HomeScreenCubit>().loadJokes,
      child: BlocConsumer<HomeScreenCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is AppStateLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is AppStateError) {
            return Center(child: Text(state.message));
          } else if (state is AppStateSuccess<List<JokeModel>>) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Flexible(flex: 1, child: SizedBox.shrink()),
                Flexible(
                  flex: 6,
                  child: CustomScrollView(
                    slivers: [
                      SliverPadding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        sliver: SliverMasonryGrid.count(
                          crossAxisCount: MediaQuery.of(context).size.width < 800 ? 1 : 2,
                          crossAxisSpacing: 36,
                          mainAxisSpacing: 36,
                          childCount: state.data != null ? state.data!.length : 0,
                          itemBuilder: (context, index) {
                            return SimpleJokeCard(
                              jokeModel: state.data![index],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          } else {
            return const Center(child: Text('Ошибка'));
          }
        },
      ),
    );
  }
}
