import 'dart:math';

import 'package:flutter/material.dart';
import 'package:social_impact2024/dummy/dummy_farm.dart';
import 'package:social_impact2024/main_screens/farm_screens/alarm_screen.dart';
import 'package:social_impact2024/main_screens/farm_screens/farm_container.dart';
import 'package:social_impact2024/main_screens/farm_screens/my_farm_container.dart';
import 'package:social_impact2024/stable/colors.dart';
import 'package:social_impact2024/widgets/image_slider.dart';

class FarmPage extends StatefulWidget {
  const FarmPage({super.key});

  @override
  State<FarmPage> createState() => _FarmPageState();
}

class _FarmPageState extends State<FarmPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
          child: Container(
        alignment: Alignment.topCenter,
        margin: const EdgeInsets.symmetric(horizontal: 25),
        width: MediaQuery.sizeOf(context).width - 50,
        child: SingleChildScrollView(
          child: Column(
            children: [
              _appbar(),
              const SizedBox(height: 25),
              ImageSlide(imageUrls: ['assets/ad.png']),
              const SizedBox(height: 25),
              _textfield(),
              const SizedBox(height: 25),
              _myPlace(),
              const SizedBox(height: 50),
              _order(),
              const SizedBox(height: 19),
              _farms(dummy_farms),
              SizedBox(height: 10)
            ],
          ),
        ),
      )),
    );
  }

  Widget _appbar() {
    return Row(
      children: [
        Container(
          alignment: Alignment.bottomCenter,
          margin: EdgeInsets.only(top: 10),
          width: 86,
          height: 27,
          decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/logo.png'))),
        ),
        Spacer(),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AlarmScreen(),
                ));
          },
          child: const Icon(Icons.notifications_outlined,
              size: 25, color: AppColor.green),
        ),
        SizedBox(width: 25),
        const Icon(Icons.notes_outlined, size: 25, color: AppColor.green)
      ],
    );
  }

  Widget _textfield() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 10),
          width: 293,
          height: 37,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1.50, color: Color(0xFF333333)),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: const Icon(Icons.search, size: 24),
        ),
        const SizedBox(width: 10),
        Container(
          width: 37,
          height: 37,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1.50, color: Color(0xFF333333)),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Icon(Icons.tune),
        )
      ],
    );
  }

  Widget _myPlace() {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width - 50,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Text(
                '내가 사용 중인 공간',
                style: TextStyle(
                  color: Color(0xFF333333),
                  fontSize: 13,
                ),
              ),
              Icon(
                Icons.location_on,
                color: AppColor.red,
              )
            ],
          ),
          SizedBox(height: 15),
          MyFarmContaineer(farm: farm1),
        ],
      ),
    );
  }

  Widget _order() {
    return Column(
      children: [
        Row(
          children: [
            Text(
              '분양 가능 공간',
              style: TextStyle(
                color: Color(0xFF333333),
                fontSize: 13,
                fontFamily: 'Source Han Sans KR',
                fontWeight: FontWeight.w500,
                height: 0.09,
              ),
            ),
            SizedBox(width: 3),
            Icon(Icons.yard, color: AppColor.green, size: 15),
          ],
        ),
        SizedBox(height: 19),
        Row(
          children: [
            Container(
              width: 69,
              height: 23,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 7),
              decoration: ShapeDecoration(
                color: AppColor.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(999),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    '서울',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontFamily: 'Source Han Sans KR',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down_rounded,
                    size: 19,
                    color: Colors.white,
                  )
                ],
              ),
            ),
            _orderButton('거리순'),
            _orderButton('인기순'),
            _orderButton('면적순'),
            _orderButton('가격순'),
          ],
        ),
      ],
    );
  }

  Widget _orderButton(String name) {
    return Container(
      width: 56,
      height: 23,
      margin: const EdgeInsets.only(left: 10),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(999),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            name,
            style: const TextStyle(
              color: Color(0xFF333333),
              fontSize: 13,
              fontFamily: 'Source Han Sans KR',
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _farms(List farms) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: min(farms.length, 3),
      itemBuilder: (BuildContext context, int index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FarmContainer(farm: farms[index]),
            index + 1 != min(farms.length, 3) ? const Divider() : Container()
          ],
        );
      },
    );
  }
}
