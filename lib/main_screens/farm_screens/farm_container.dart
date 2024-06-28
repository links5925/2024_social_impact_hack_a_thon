import 'package:flutter/material.dart';
import 'package:social_impact2024/main_screens/farm_screens/detail_farm_screen.dart';
import 'package:social_impact2024/model/farm.dart';
import 'package:social_impact2024/stable/colors.dart';

class FarmContainer extends StatefulWidget {
  final Farm farm;
  const FarmContainer({super.key, required this.farm});

  @override
  State<FarmContainer> createState() => _FarmContainerState();
}

class _FarmContainerState extends State<FarmContainer> {
  @override
  Widget build(BuildContext context) {
    Farm farm = widget.farm;
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailFarmScreen(farm: farm),
            ));
      },
      child: Container(
        alignment: Alignment.topLeft,
        width: 300,
        height: 80,
        child: Row(
          children: [_image(farm), const SizedBox(width: 11), _text(farm)],
        ),
      ),
    );
  }

  Widget _image(Farm farm) {
    return Container(
      width: 70,
      height: 70,
      decoration: ShapeDecoration(
        color: Colors.grey,
        image: DecorationImage(
          image: AssetImage(farm.image),
          fit: BoxFit.fill,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }

  Widget _text(Farm farm) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            farm.name,
            style: TextStyle(
              color: Color(0xFF333333),
              fontSize: 15,
              fontFamily: 'Source Han Sans KR',
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 7),
          Text(
            farm.address,
            style: TextStyle(
              color: Color(0xFF333333),
              fontSize: 13,
              fontFamily: 'Source Han Sans KR',
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 3),
          Row(
            children: [
              Row(
                children: [
                  Icon(Icons.spoke, size: 13, color: AppColor.green),
                  const SizedBox(width: 3),
                  Text(
                    '${farm.sf}',
                    style: TextStyle(
                      color: Color(0xFF333333),
                      fontSize: 13,
                      fontFamily: 'Source Han Sans KR',
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
              const SizedBox(width: 5),
              Row(
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: ShapeDecoration(
                      color: AppColor.green,
                      shape: OvalBorder(),
                    ),
                  ),
                  const SizedBox(width: 3),
                  Text(
                    '${farm.usf}',
                    style: TextStyle(
                      color: Color(0xFF333333),
                      fontSize: 13,
                      fontFamily: 'Source Han Sans KR',
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
              const SizedBox(width: 5),
              Row(
                children: [
                  const Icon(Icons.sell, size: 13, color: AppColor.red),
                  const SizedBox(width: 3),
                  Text(
                    '${farm.cost}',
                    style: const TextStyle(
                      color: Color(0xFF333333),
                      fontSize: 13,
                      fontFamily: 'Source Han Sans KR',
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
