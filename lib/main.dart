import 'package:MovieNight/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:MovieNight/utils/app_state.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppState(),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Montserrat',
        useMaterial3: true,
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 92,
            fontWeight: FontWeight.w300,
            letterSpacing: -1.5,
            color: Colors.white,
          ),
          displayMedium: TextStyle(
            fontSize: 57,
            fontWeight: FontWeight.w300,
            letterSpacing: -0.5,
          ),
          displaySmall: TextStyle(
            fontSize: 46,
            fontWeight: FontWeight.w400,
          ),
          headlineMedium: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.25,
          ),
          headlineSmall: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w500,
          ),
          titleLarge: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.15,
          ),
          titleMedium: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.15,
          ),
          titleSmall: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.1,
          ),
          bodyLarge: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.5,
          ),
          bodyMedium: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.25,
          ),
          labelLarge: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.25,
          ),
          bodySmall: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.4,
          ),
          labelSmall: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w500,
            letterSpacing: 1.5,
          ),
        ),
        colorScheme: ColorScheme.light(
          primary: Colors.indigo.shade900,
          onPrimary: Colors.white,
          primaryContainer: Colors.indigo.shade100,
          onPrimaryContainer: Colors.indigo.shade900,
          secondary: Colors.purple.shade900,
          onSecondary: Colors.white,
          secondaryContainer: Colors.purple.shade100,
          onSecondaryContainer: Colors.purple.shade900,
          tertiary: Colors.amber.shade300,
          onTertiary: Colors.black,
          surface: Colors.grey.shade50,
          onSurface: Colors.grey.shade900,
          error: Colors.red.shade700,
          onError: Colors.white,
          errorContainer: Colors.red.shade100,
          onErrorContainer: Colors.red.shade900,
          outline: Colors.grey.shade400,
        ),
      ),
      darkTheme: ThemeData(
        fontFamily: 'Montserrat',
        useMaterial3: true,
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 92,
            fontWeight: FontWeight.w300,
            letterSpacing: -1.5,
            color: Colors.white,
          ),
          displayMedium: TextStyle(
            fontSize: 57,
            fontWeight: FontWeight.w300,
            letterSpacing: -0.5,
            color: Colors.white,
          ),
          displaySmall: TextStyle(
            fontSize: 46,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
          headlineMedium: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.25,
            color: Colors.white,
          ),
          headlineSmall: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
          titleLarge: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.15,
            color: Colors.white,
          ),
          titleMedium: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.15,
            color: Colors.white,
          ),
          titleSmall: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.1,
            color: Colors.white,
          ),
          bodyLarge: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.5,
            color: Colors.white,
          ),
          bodyMedium: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.25,
            color: Colors.white,
          ),
          labelLarge: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.25,
            color: Colors.white,
          ),
          bodySmall: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.4,
            color: Colors.white,
          ),
          labelSmall: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w500,
            letterSpacing: 1.5,
            color: Colors.white,
          ),
        ),
        colorScheme: ColorScheme.dark(
          primary: Colors.amber.shade300,
          onPrimary: Colors.black,
          primaryContainer: Colors.amber.shade100,
          onPrimaryContainer: Colors.amber.shade900,
          secondary: Colors.deepPurple.shade200,
          onSecondary: Colors.black,
          secondaryContainer: Colors.deepPurple.shade100,
          onSecondaryContainer: Colors.deepPurple.shade900,
          tertiary: Colors.teal.shade200,
          onTertiary: Colors.black,
          surface: Colors.grey.shade900,
          onSurface: Colors.white,
          error: Colors.red.shade300,
          onError: Colors.black,
          errorContainer: Colors.red.shade900,
          onErrorContainer: Colors.red.shade100,
          outline: Colors.grey.shade700,
        ),
      ),
      themeMode: ThemeMode.system,
      home: const WelcomeScreen(),
    );
  }
}
