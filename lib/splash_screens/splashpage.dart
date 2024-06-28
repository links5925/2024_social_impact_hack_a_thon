import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:social_impact2024/main_screens/main_screen.dart';
import 'package:social_impact2024/splash_screens/login.dart';
import 'package:social_impact2024/stable/colors.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.green,
      body: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MainScreen(),
              ));
        },
        child: Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/splash.png'),
                  fit: BoxFit.fitWidth)),
        ),
      ),
    );
  }
}
