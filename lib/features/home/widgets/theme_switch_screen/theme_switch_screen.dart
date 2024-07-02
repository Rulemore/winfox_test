import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:winfox/features/app/cubit/theme_cubit.dart';

class ThemeSwitchScreen extends StatefulWidget {
  const ThemeSwitchScreen({super.key});

  @override
  State<ThemeSwitchScreen> createState() => _ThemeSwitchScreenState();
}

class _ThemeSwitchScreenState extends State<ThemeSwitchScreen> {
  late bool _isDarkTheme;

  @override
  void initState() {
    _isDarkTheme = context.read<ThemeCubit>().isDarkTheme;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Тема'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.light_mode),
            Switch(
              value: _isDarkTheme,
              onChanged: (value) {
                context.read<ThemeCubit>().changeTheme(value);
                setState(() {
                  _isDarkTheme = value;
                });
              },
            ),
            const Icon(Icons.dark_mode),
          ],
        ),
      ),
    );
  }
}
