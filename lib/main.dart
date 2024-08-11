import 'package:flutter/material.dart';
import 'package:junkie/app.dart';
import 'package:junkie/models/restaurant.dart';
import 'package:junkie/themes/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ChangeNotifierProvider(create: (_) => Restaurant()),
    ],
    child: const MyApp(),
  ));
}
