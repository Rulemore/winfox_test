import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:winfox/features/home/cubit/home_screen_cubit.dart';
import 'package:winfox/features/home/widgets/grid_screen/grid_screen.dart';
import 'package:winfox/features/home/widgets/theme_switch_screen/theme_switch_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedScreen = 0;
  final List<Widget> _screens = const [GridScreen(), ThemeSwitchScreen()];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeScreenCubit()..loadJokes(),
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedScreen,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'Список',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.dark_mode),
              label: 'Тема',
            ),
          ],
          onTap: (value) {
            setState(() {
              _selectedScreen = value;
            });
          },
        ),
        body: _screens[_selectedScreen],
      ),
    );
  }
}
