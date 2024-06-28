import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:social_impact2024/notification.dart';
import 'package:social_impact2024/stable/colors.dart';

class AlarmScreen extends StatefulWidget {
  const AlarmScreen({super.key});

  @override
  State<AlarmScreen> createState() => _AlarmScreenState();
}

class _AlarmScreenState extends State<AlarmScreen> {
  bool t = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          '알람',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF333333),
            fontSize: 22,
            fontFamily: 'Source Han Sans KR',
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          GestureDetector(
              onTap: () {
                FlutterLocalNotificationsPlugin().cancelAll();
                if (!t) {
                  FlutterLocalNotification.showNotification();
                }

                t = true;
                setState(() {});
              },
              child: Container(
                padding:
                    t ? EdgeInsets.only(left: 2) : EdgeInsets.only(right: 2),
                alignment: t ? Alignment.centerLeft : Alignment.centerRight,
                margin: const EdgeInsets.only(top: 20, right: 30),
                width: 36,
                height: 20,
                decoration: ShapeDecoration(
                  color: t
                      ? AppColor.green.withOpacity(0.3)
                      : AppColor.red.withOpacity(0.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(90),
                  ),
                ),
                child: Container(
                  width: 16,
                  height: 16,
                  child: DecoratedBox(
                    decoration: ShapeDecoration(
                        shape: OvalBorder(),
                        color: Colors.white,
                        shadows: [
                          BoxShadow(
                            color: Color(0x29000000),
                            blurRadius: 3,
                            offset: Offset(0, 2),
                            spreadRadius: 0,
                          ),
                          BoxShadow(
                            color: Color(0x15000000),
                            blurRadius: 3,
                            offset: Offset(0, 0),
                            spreadRadius: 0,
                          )
                        ]),
                    child: Icon(
                      Icons.notifications,
                      size: 12,
                      color: t ? AppColor.green : AppColor.red,
                    ),
                  ),
                ),
              ))
        ],
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 30),
        alignment: Alignment.topCenter,
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                image:
                    AssetImage(t ? 'assets/alarm2.png' : 'assets/alarm1.png'),
                alignment: Alignment.topCenter)),
      ),
    );
  }
}
