import 'package:flutter/material.dart';
import 'package:garfly/features/tasks/screens/tasks_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedPageIndex = 0;
  final List<Widget> _pages = [const TasksScreen()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Scaffold(
      backgroundColor: colors.surface,
      body: IndexedStack(index: _selectedPageIndex, children: _pages),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _selectedPageIndex,
        onTap: _onItemTapped,
        selectedItemColor: colors.scrim,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 16,
        unselectedFontSize: 16,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.bug_report_outlined),
            activeIcon: Icon(Icons.bug_report),
            label: 'Orugas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bug_report_outlined),
            activeIcon: Icon(Icons.bug_report),
            label: 'Orugas',
          ),
        ],
      ),
    );
  }
}
