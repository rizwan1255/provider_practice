import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_practice/provider/count_provider.dart';
import 'package:provider_practice/provider/example_one_provider.dart';
import 'package:provider_practice/provider/favourite_provider.dart';
import 'package:provider_practice/provider/theme_changer_provider.dart';
import 'package:provider_practice/screens/count_example.dart';
import 'package:provider_practice/screens/example_one.dart';
import 'package:provider_practice/screens/favourite/dark_theme.dart';
import 'package:provider_practice/screens/favourite/favourite_screen.dart';
import 'package:provider_practice/screens/favourite/value_notifier_listner.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CountProvider()),
        ChangeNotifierProvider(create: (_) => ExampleOneProvider()),
        ChangeNotifierProvider(create: (_) => FavouriteItemProvider()),
        ChangeNotifierProvider(create: (_) => ThemeChangerProvider()),
      ],
      child: Builder(
        builder: (BuildContext context) {
          final themeChangerProvider = Provider.of<ThemeChangerProvider>(
            context,
          );
          return MaterialApp(
            themeMode: themeChangerProvider.themeMode,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
              brightness: Brightness.light,
              appBarTheme: AppBarTheme(backgroundColor: Colors.blue),
              textTheme: TextTheme(
                bodyMedium: TextStyle(color: Colors.black),
              )
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              primarySwatch: Colors.purple,
              appBarTheme: AppBarTheme(backgroundColor: Colors.red),
              iconTheme: IconThemeData(color: Colors.red),
              iconButtonTheme: IconButtonThemeData(
                style: IconButton.styleFrom(foregroundColor: Colors.red),
              ),
            ),
            home:  NotifyListenerScreen(),
          );
        },
      ),
    );
  }
}
