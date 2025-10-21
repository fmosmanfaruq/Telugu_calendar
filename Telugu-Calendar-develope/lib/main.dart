import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:telugu_calender/core/providers/language_provider.dart';
import 'package:telugu_calender/core/l10n/app_localizations.dart';
import 'package:telugu_calender/features/horoscope_new/screens/horoscope_screen.dart';
import 'features/home/screens/home_screen.dart';
import 'features/calendar/screens/calendar_screen.dart';
import 'features/events/screens/events_screen.dart';
import 'features/horoscope/screens/horoscope_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final LanguageProvider _languageProvider = LanguageProvider();

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _languageProvider,
      builder: (context, child) {
        return ScreenUtilInit(
          designSize: const Size(411, 914),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (_, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Telugu Calendar',
              locale: _languageProvider.locale,
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: const [
                Locale('en', ''),
                Locale('te', ''),
              ],
              theme: ThemeData(
                scaffoldBackgroundColor: const Color.fromARGB(255, 193, 207, 227),
                primaryColor: const Color(0xFF4A55A2),
                appBarTheme: const AppBarTheme(
                  backgroundColor: Color.fromARGB(255, 239, 169, 193),
                ),
                textTheme: GoogleFonts.poppinsTextTheme(
                  Theme.of(context).textTheme,
                ),
                colorScheme: ColorScheme.fromSeed(
                  seedColor: const Color(0xFF4A55A2),
                ),
                useMaterial3: true,
              ),
              home: child,
            );
          },
          child: MainScreen(languageProvider: _languageProvider),
        );
      },
    );
  }
}

class MainScreen extends StatefulWidget {
  final LanguageProvider languageProvider;
  const MainScreen({super.key, required this.languageProvider});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  void _onTabSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> get _widgetOptions => <Widget>[
    HomeScreen(
      languageProvider: widget.languageProvider,
      onTabSelected: _onTabSelected,
    ),
    const CalendarScreen(),
    const EventsScreen(),
    const HoroscopeScreenNew(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _selectedIndex, children: _widgetOptions),
    );
  }
}
