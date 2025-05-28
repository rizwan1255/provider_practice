import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_practice/provider/count_provider.dart';
import 'package:provider_practice/provider/example_one_provider.dart';
import 'package:provider_practice/provider/favourite_provider.dart';
import 'package:provider_practice/screens/count_example.dart';
import 'package:provider_practice/screens/example_one.dart';
import 'package:provider_practice/screens/favourite/favourite_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CountProvider(),),
        ChangeNotifierProvider(create: (_) => ExampleOneProvider(),),
        ChangeNotifierProvider(create: (_) => FavouriteItemProvider(),),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const FavouriteScreen(),
      ),
    );
  }
}
