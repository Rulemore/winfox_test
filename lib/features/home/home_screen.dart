import 'package:flutter/material.dart';
import 'package:winfox/features/home/widgets/grid_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedScreen = 0;
  final List<Widget> _screens = const [GridScreen(), Placeholder()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Анекдоты',
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person))
        ],
        onTap: (value) {
          setState(() {
            _selectedScreen = value;
          });
        },
      ),
      body: _screens[_selectedScreen],
    );
  }
}
