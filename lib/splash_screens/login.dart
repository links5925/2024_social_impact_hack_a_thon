import 'package:flutter/material.dart';
import 'package:social_impact2024/main_screens/farm_screens/farm_screen.dart';
import 'package:social_impact2024/main_screens/main_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('로그인'),
      ),
      body: Column(
        children: [
          Text('아이디'),
          Container(
            child: TextField(),
          ),
          Text('비밀번호'),
          Container(
            child: TextField(),
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FarmPage(),
                  ));
            },
            child: Container(
              alignment: Alignment.center,
              height: 30,
              width: 300,
              color: Colors.purple,
              child: Text('로그인'),
            ),
          ),
          SizedBox(height: 30)
        ],
      ),
    );
  }
}
