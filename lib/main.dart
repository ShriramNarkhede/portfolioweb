import 'package:flutter/material.dart';

import 'pages/Home_Page.dart';

void main() {
  runApp(MyPortfolioApp());
}

class MyPortfolioApp extends StatelessWidget {
  const MyPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Shriram's portfolio",
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system, // You can change this to ThemeMode.dark or light
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}


final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.white,
  primaryColor: Color(0xFF1E88E5), // Blue
  appBarTheme: AppBarTheme(
    backgroundColor: Color(0xFF1565C0), // Dark Blue
    foregroundColor: Colors.white,
  ),
  colorScheme: ColorScheme.light(
    primary: Color(0xFF1E88E5),
    secondary: Color(0xFF1565C0),
    tertiary: Color(0xFFFFC107), // Amber
    background: Colors.white,
    surface: Colors.white,
    onSurface: Color(0xFF212121), // Text
  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: Color(0xFF212121)), // Dark Grey
  ),
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Color(0xFF121212),
  primaryColor: Color(0xFFBB86FC), // Light Purple
  appBarTheme: AppBarTheme(
    backgroundColor: Color(0xFF3700B3), // Deep Purple
    foregroundColor: Colors.white,
  ),
  colorScheme: ColorScheme.dark(
    primary: Color(0xFFBB86FC),
    secondary: Color(0xFF3700B3),
    tertiary: Color(0xFF03DAC6), // Teal
    background: Color(0xFF121212),
    surface: Color(0xFF1E1E1E),
    onSurface: Color(0xFFE0E0E0), // Light Grey Text
  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: Color(0xFFE0E0E0)),
  ),
);
