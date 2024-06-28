import 'package:flutter/material.dart';
import 'package:social_impact2024/main_screens/farm_screens/farm_screen.dart';
import 'package:social_impact2024/main_screens/my_page_screens/my_page.dart';
import 'package:social_impact2024/main_screens/poom_screens/poom_screen.dart';
import 'package:social_impact2024/main_screens/store_screens/store_screen.dart';
import 'package:social_impact2024/notification.dart';
import 'package:social_impact2024/riverpod/main_screen_riverpod.dart';
import 'package:social_impact2024/stable/colors.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _State();
}

class _State extends ConsumerState<MainScreen> {
  List<Widget> l = [FarmPage(), PoomScreen(), StoreScreen(), MyPage()];
  @override
  void initState() {
    FlutterLocalNotification.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int value = ref.watch(pageChangeStateNotifierProvider);
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: l[value],
        ),
        bottomNavigationBar: _customBottom(value),
      ),
    );
  }

  Widget _customBottom(int value) {
    final a = ref.read(pageChangeStateNotifierProvider.notifier);
    return Container(
      alignment: Alignment.bottomCenter,
      height: 66,
      child: Row(
        children: [
          Spacer(),
          GestureDetector(
            onTap: () {
              a.setPage(0);
            },
            child: value == 0
                ? const SizedBox(
                    width: 70,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.flag,
                          color: AppColor.green,
                        ),
                        Text(
                          '공간 분양',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColor.green,
                            fontSize: 13,
                          ),
                        )
                      ],
                    ),
                  )
                : const SizedBox(
                    width: 70,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.flag,
                          color: Colors.black,
                        ),
                        Text(
                          '공간 분양',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                          ),
                        )
                      ],
                    ),
                  ),
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              a.setPage(1);
            },
            child: value == 1
                ? const SizedBox(
                    width: 70,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.book_outlined,
                          color: AppColor.green,
                        ),
                        Text(
                          '품앗이',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColor.green,
                            fontSize: 13,
                          ),
                        )
                      ],
                    ),
                  )
                : const SizedBox(
                    width: 70,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.book_outlined,
                          color: Colors.black,
                        ),
                        Text(
                          '품앗이',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                          ),
                        )
                      ],
                    ),
                  ),
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              a.setPage(2);
            },
            child: value == 2
                ? const SizedBox(
                    width: 70,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.shopping_cart_outlined,
                          color: AppColor.green,
                        ),
                        Text(
                          '스토어',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColor.green,
                            fontSize: 13,
                          ),
                        )
                      ],
                    ),
                  )
                : const SizedBox(
                    width: 70,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.shopping_cart_outlined,
                          color: Colors.black,
                        ),
                        Text(
                          '스토어',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                          ),
                        )
                      ],
                    ),
                  ),
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              a.setPage(3);
            },
            child: value == 3
                ? const SizedBox(
                    width: 70,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person_outline,
                          color: AppColor.green,
                        ),
                        Text(
                          '마이페이지',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColor.green,
                            fontSize: 13,
                          ),
                        )
                      ],
                    ),
                  )
                : const SizedBox(
                    width: 70,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person_outline,
                          color: Colors.black,
                        ),
                        Text(
                          '마이페이지',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                          ),
                        )
                      ],
                    ),
                  ),
          ),
          const Spacer()
        ],
      ),
    );
  }
}
