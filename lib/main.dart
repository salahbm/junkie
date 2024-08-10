import 'package:flutter/material.dart';
import 'package:junkie/app.dart';
import 'package:junkie/themes/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (_) => ThemeProvider(), child: const MyApp()));
}
