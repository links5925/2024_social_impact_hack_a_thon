import 'package:flutter/material.dart';
import 'package:social_impact2024/model/farm.dart';
import 'package:social_impact2024/stable/colors.dart';

class MyFarmContaineer extends StatefulWidget {
  final Farm farm;
  const MyFarmContaineer({super.key, required this.farm});

  @override
  State<MyFarmContaineer> createState() => _MyFarmContaineerState();
}

class _MyFarmContaineerState extends State<MyFarmContaineer> {
  @override
  Widget build(BuildContext context) {
    Farm farm = widget.farm;
    return Stack(
      children: [
        _body(),
        Column(
          children: [_image(farm), _bottom(farm)],
        )
      ],
    );
  }

  Widget _body() {
    return Container(
      width: 334,
      height: 142,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
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
        ],
      ),
    );
  }

  Widget _image(Farm farm) {
    return Container(
      width: 334,
      height: 105,
      decoration: ShapeDecoration(
        image: DecorationImage(
            image: AssetImage(farm.image), fit: BoxFit.fitWidth),
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }

  Widget _bottom(Farm farm) {
    return Container(
      height: 37,
      width: 334,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(children: [
        Text(farm.name),
        const SizedBox(width: 6),
        Container(
          width: 8,
          height: 8,
          decoration: const ShapeDecoration(
            color: AppColor.green,
            shape: OvalBorder(),
          ),
        ),
        const SizedBox(width: 3),
        Text('${farm.sf} 평'),
        const Spacer(),
        const Text('재배기간'),
        const SizedBox(width: 4),
        Text('${farm.day} 일'),
      ]),
    );
  }
}
