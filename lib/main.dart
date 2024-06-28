import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:social_impact2024/main_screens/farm_screens/farm_screen.dart';
import 'package:social_impact2024/main_screens/main_screen.dart';
import 'package:social_impact2024/splash_screens/splashpage.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext conTtext) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: SplashPage());
  }
}
