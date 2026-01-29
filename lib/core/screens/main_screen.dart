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
    final texts = theme.textTheme;

    return Scaffold(
      backgroundColor: colors.surface,
      body: IndexedStack(index: _selectedPageIndex, children: _pages),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF1A1A1A),
          border: const Border(
            top: BorderSide(color: Colors.white10, width: 0.5),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedPageIndex,
          onTap: _onItemTapped,
          // backgroundColor: const Color(0xFF1A1A1A),
          selectedItemColor: const Color(0xFF00E676), // Verde Neón para Orugas
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
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
      ),
    );
  }
}
