import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'core/providers/scroll_provider.dart';
import 'core/providers/section_provider.dart';
import 'core/providers/theme_provider.dart';
import 'core/theme/app_theme.dart';
import 'features/HomeScreen/home_screen.dart';


class MyApp extends StatelessWidget {
  final bool isDarkMode;

  const MyApp({super.key, required this.isDarkMode});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(

      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider(),),
        ChangeNotifierProvider(create: (_) => ScrollProvider()),
        ChangeNotifierProvider(create: (_) => SectionProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            title: 'Ankit Sharma | Portfolio',
            theme: themeProvider.isDarkMode ? AppTheme.darkTheme :  AppTheme.lightTheme,
            home: HomeScreen(),
            debugShowCheckedModeBanner: false,
            builder: (context, child) => ResponsiveWrapper.builder(
              child!,
              maxWidth: 1800,
              minWidth: 450,
              defaultScale: true,
              breakpoints: [
                const ResponsiveBreakpoint.resize(450, name: MOBILE),
                const ResponsiveBreakpoint.resize(800, name: TABLET),
                const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
                const ResponsiveBreakpoint.resize(1800, name: 'XL'),
              ],
              background: Container(color: Theme.of(context).scaffoldBackgroundColor),
            ),
          );
        },
      ),
    );
  }
}