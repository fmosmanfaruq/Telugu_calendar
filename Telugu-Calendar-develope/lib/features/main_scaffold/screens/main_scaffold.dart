import 'package:flutter/material.dart';
import 'package:telugu_calender/core/providers/language_provider.dart';
import 'package:telugu_calender/features/calendar/screens/calendar_screen.dart';
import 'package:telugu_calender/features/events/screens/events_screen.dart';
import 'package:telugu_calender/features/home/screens/home_screen.dart';

class MainScaffold extends StatefulWidget {
  final LanguageProvider? languageProvider;
  const MainScaffold({super.key, this.languageProvider});

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  int _selectedIndex = 0;
  late LanguageProvider _languageProvider;

  @override
  void initState() {
    super.initState();
    _languageProvider = widget.languageProvider ?? LanguageProvider();
  }

  List<Widget> get _widgetOptions => <Widget>[
    HomeScreen(languageProvider: _languageProvider),
    CalendarScreen(),
    const EventsScreen(),
    // Placeholder for Horoscope
    const Scaffold(body: Center(child: Text('రాశి ఫలాలు'))),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'హోమ్',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today_outlined),
            activeIcon: Icon(Icons.calendar_today),
            label: 'క్యాలెండర్',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.celebration_outlined),
            activeIcon: Icon(Icons.celebration),
            label: 'పండుగలు',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.brightness_4_outlined),
            activeIcon: Icon(Icons.brightness_4),
            label: 'రాశి ఫలాలు',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
