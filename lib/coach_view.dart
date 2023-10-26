
import 'package:flutter/material.dart';

import 'coach_home_view.dart';
import 'coach_settings_view.dart';
import 'history_view.dart';



/// Top-level Layout for the app
class CoachView extends StatefulWidget {
  CoachView({
    super.key,
  });

  static const routeName = '/coachView';

  // This data structure will eventually become stateful and thus will
  // need to be moved into the state widget.
  final Map pages = {
    0: {
      'title': const Text('Home'),
      'body': CoachHomeView(),
      'navItem': const BottomNavigationBarItem(
        label: 'Home',
        icon: Icon(Icons.home),
      ),
    },
    1: {
      'title': const Text('History'),
      'body': HistoryView(),
      'navItem': const BottomNavigationBarItem(
        label: 'History',
        icon: Icon(Icons.format_align_justify_outlined),
      ),
    },
    2: {
      'title': const Text('Settings'),
      'body': const CoachSettingsView(),
      'navItem': const BottomNavigationBarItem(
        label: 'Settings',
        icon: Icon(Icons.settings),
      ),
    },
  };

  @override
  State<CoachView> createState() => _CoachViewState();
}

class _CoachViewState extends State<CoachView> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    if (index != _selectedIndex) {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.all(12.0),
        child: widget.pages[_selectedIndex]['body'],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // needed when more than 3 items
        backgroundColor: Colors.black, // <-- This works for fixed
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey,
        items: [
          widget.pages[0]['navItem'],
          widget.pages[1]['navItem'],
          widget.pages[2]['navItem'],
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
