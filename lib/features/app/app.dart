import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:winfox/core/app_state.dart';
import 'package:winfox/features/app/cubit/theme_cubit.dart';
import 'package:winfox/features/home/home_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, AppState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Winfox test',
            debugShowCheckedModeBanner: false,
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('ru'),
              Locale('en'),
            ],
            theme: (state as AppStateSuccess).data,
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}
