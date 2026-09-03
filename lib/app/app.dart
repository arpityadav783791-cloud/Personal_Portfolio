import 'package:flutter/material.dart';
import 'package:portfolio/app/theme/app_theme.dart';
import 'package:portfolio/app/theme/theme_mode_notifier.dart';
import 'package:portfolio/features/home/home_page.dart';

class PortfolioApp extends StatefulWidget {
  const PortfolioApp({super.key});

  @override
  State<PortfolioApp> createState() => _PortfolioAppState();
}

class _PortfolioAppState extends State<PortfolioApp> {
  final ThemeModeNotifier _themeNotifier = ThemeModeNotifier();

  @override
  void dispose() {
    _themeNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ThemeScope(
      notifier: _themeNotifier,
      child: ListenableBuilder(
        listenable: _themeNotifier,
        builder: (context, _) {
          return MaterialApp(
            title: 'Arpit Yadav | Flutter Developer',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: _themeNotifier.themeMode,
            home: const HomePage(),
          );
        },
      ),
    );
  }
}
