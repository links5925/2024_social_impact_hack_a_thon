import 'dart:math';

import 'package:flutter/material.dart';
import 'package:social_impact2024/dummy/plants.dart';
import 'package:social_impact2024/main_screens/farm_screens/buy_screen.dart';
import 'package:social_impact2024/model/farm.dart';
import 'package:social_impact2024/stable/colors.dart';

class DetailFarmScreen extends StatefulWidget {
  final Farm farm;
  const DetailFarmScreen({super.key, required this.farm});

  @override
  State<DetailFarmScreen> createState() => _DetailFarmScreenState();
}

class _DetailFarmScreenState extends State<DetailFarmScreen> {
  @override
  Widget build(BuildContext context) {
    Farm farm = widget.farm;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _appBar(farm),
      body: SafeArea(
          child: SingleChildScrollView(
              child: Column(children: [
        _image(farm),
        const SizedBox(height: 20),
        _farmInfo(farm),
        const SizedBox(height: 20),
        _plants(plants_dummy),
        const SizedBox(height: 80),
        _button(farm),
        const SizedBox(height: 50)
      ]))),
    );
  }

  AppBar _appBar(Farm farm) {
    return AppBar(
      centerTitle: true,
      title: Text(
        farm.name,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Color(0xFF333333),
          fontSize: 22,
          fontFamily: 'Source Han Sans KR',
          fontWeight: FontWeight.w500,
        ),
      ),
      actions: [
        Container(
          margin: const EdgeInsets.only(top: 25, right: 20),
          child: GestureDetector(
            onTap: () {},
            child: Column(
              children: [
                Container(
                  width: 3,
                  height: 3,
                  decoration: const ShapeDecoration(
                    color: Color(0xFF333333),
                    shape: OvalBorder(),
                  ),
                ),
                const SizedBox(height: 3),
                Container(
                  width: 3,
                  height: 3,
                  decoration: const ShapeDecoration(
                    color: Color(0xFF333333),
                    shape: OvalBorder(),
                  ),
                ),
                const SizedBox(height: 3),
                Container(
                  width: 3,
                  height: 3,
                  decoration: const ShapeDecoration(
                    color: Color(0xFF333333),
                    shape: OvalBorder(),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _image(Farm farm) {
    return Container(
      height: 308,
      decoration: BoxDecoration(
        color: Colors.grey,
        image: DecorationImage(
          image: AssetImage(farm.image),
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget _farmInfo(Farm farm) {
    return Container(
      width: MediaQuery.sizeOf(context).width - 40,
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Icon(Icons.favorite, size: 20, color: AppColor.red),
                Text(
                  ' ${_getRandom()}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: 'Source Han Sans KR',
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 19),
          Row(
            children: [
              Text(
                '분양가',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF333333),
                  fontSize: 16,
                  fontFamily: 'Source Han Sans KR',
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(width: 5),
              Icon(Icons.sell, size: 18, color: AppColor.red),
              Spacer(),
              Text(
                '${(farm.cost)} 원',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF333333),
                  fontSize: 20,
                  fontFamily: 'Source Han Sans KR',
                  fontWeight: FontWeight.w500,
                  height: 0.04,
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          _infoModule(
              '주소',
              Icon(Icons.my_location_rounded, size: 16, color: AppColor.green),
              farm.address),
          SizedBox(height: 10),
          _infoModule(
              '농지 총 면적',
              Icon(Icons.spoke, size: 16, color: AppColor.green),
              '${farm.sf} 평'),
          SizedBox(height: 10),
          _infoModule(
              '분양 단위',
              Container(
                  height: 16,
                  width: 16,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(90),
                      color: AppColor.green)),
              '${farm.usf} 평'),
          const SizedBox(height: 10),
          _infoModule(
              '평균 강수량',
              const Icon(Icons.umbrella_outlined,
                  size: 16, color: AppColor.green),
              '${farm.rain} mm'),
          const SizedBox(height: 10),
          _infoModule(
              '연간 일조량',
              const Icon(Icons.sunny, size: 16, color: AppColor.green),
              farm.sun),
        ],
      ),
    );
  }

  int _getRandom() {
    int value = (Random().nextInt(3) + 2) * (Random().nextInt(50) + 1) +
        (Random().nextInt(50));

    return value;
  }

  Widget _infoModule(String title, Widget icon, String value) {
    return Row(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF333333),
            fontSize: 16,
            fontFamily: 'Source Han Sans KR',
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(width: 5),
        icon,
        Spacer(),
        Text(
          value,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF333333),
            fontSize: 16,
            fontFamily: 'Source Han Sans KR',
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _plants(List p) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width - 40,
      child: Column(
        children: [
          Row(
            children: const [
              Text(
                '주요 재배 품종',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF333333),
                  fontSize: 14,
                  fontFamily: 'Source Han Sans KR',
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(width: 3),
              Icon(Icons.yard, color: AppColor.green, size: 18),
              SizedBox(height: 10),
            ],
          ),
          SizedBox(height: 10),
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: p.length,
              itemBuilder: (BuildContext context, int index) {
                return _plantContainer(index.toString(), plants_dummy[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _plantContainer(String image, String name) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 10),
          width: 55,
          height: 55,
          decoration: ShapeDecoration(
            color: Colors.grey,
            image: DecorationImage(
              image: AssetImage('assets/plant${int.parse(image) + 1}.jpeg'),
              fit: BoxFit.fill,
            ),
            shape: const OvalBorder(),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          name,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 11,
            fontFamily: 'Source Han Sans KR',
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _button(Farm farm) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => BuyScreen(
                      farm: farm,
                    )));
      },
      child: Container(
        width: 282,
        height: 38,
        alignment: Alignment.center,
        decoration: ShapeDecoration(
          color: AppColor.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: const Text(
          '분양하기',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
