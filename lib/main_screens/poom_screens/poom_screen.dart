import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:social_impact2024/notification.dart';
import 'package:social_impact2024/stable/colors.dart';

class PoomScreen extends StatefulWidget {
  const PoomScreen({super.key});

  @override
  State<PoomScreen> createState() => _PoomScreenState();
}

class _PoomScreenState extends State<PoomScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              FlutterLocalNotification.showNotification();
            },
            child: Container(
              width: MediaQuery.sizeOf(context).width,
              alignment: Alignment.center,
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  Container(
                    width: 174,
                    height: 27,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/poom.png'))),
                  ),
                  SizedBox(height: 50),
                  Container(
                    width: 337,
                    height: 651,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/poom2.png'))),
                  )
                ],
              ),
            ),
          ),
          Positioned(
              right: 45,
              top: 37,
              child: Icon(Icons.bookmark, size: 25, color: AppColor.green)),
        ],
      ),
    );
  }
}
