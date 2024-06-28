import 'package:flutter/material.dart';
import 'package:social_impact2024/dummy/dummy_farm.dart';
import 'package:social_impact2024/dummy/plants.dart';
import 'package:social_impact2024/main_screens/farm_screens/farm_container.dart';
import 'package:social_impact2024/model/farm.dart';
import 'package:social_impact2024/stable/colors.dart';

class BuyScreen extends StatefulWidget {
  final Farm farm;
  const BuyScreen({super.key, required this.farm});

  @override
  State<BuyScreen> createState() => _BuyScreenState();
}

class _BuyScreenState extends State<BuyScreen> {
  int num = 1;
  List<int> selected = [];

  void plus() {
    num += 1;
    setState(() {});
  }

  void minus() {
    if (num > 1) {
      num -= 1;
      setState(() {});
    }
  }

  void select(int num) {
    if (selected.contains(num)) {
      selected.remove(num);
    } else {
      selected.add(num);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Farm farm = widget.farm;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _appBar(),
      body: Container(
        alignment: Alignment.topLeft,
        width: MediaQuery.sizeOf(context).width - 50,
        margin: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            _first_texts(),
            const SizedBox(height: 10),
            FarmContainer(farm: farm),
            const SizedBox(height: 30),
            _info(farm),
            const SizedBox(height: 50),
            _second_texts(),
            const SizedBox(height: 30),
            _plants(plants_dummy),
            const SizedBox(height: 60),
            Align(
              alignment: Alignment.center,
              child: _buyButton(),
            ),
          ],
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      centerTitle: true,
      title: const Text(
        '분양하기',
        textAlign: TextAlign.center,
        style: TextStyle(
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

  Widget _first_texts() {
    return const Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: '분양 받을 공간 ',
            style: TextStyle(
              color: Color(0xFF333333),
              fontSize: 13,
              fontFamily: 'Source Han Sans KR',
              fontWeight: FontWeight.w500,
            ),
          ),
          TextSpan(
            text: '위치',
            style: TextStyle(
              color: Color(0xFF0B855D),
              fontSize: 13,
              fontFamily: 'Source Han Sans KR',
              fontWeight: FontWeight.w500,
            ),
          ),
          TextSpan(
            text: '와 ',
            style: TextStyle(
              color: Color(0xFF333333),
              fontSize: 13,
              fontFamily: 'Source Han Sans KR',
              fontWeight: FontWeight.w500,
            ),
          ),
          TextSpan(
            text: '면적',
            style: TextStyle(
              color: Color(0xFF0B855D),
              fontSize: 13,
              fontFamily: 'Source Han Sans KR',
              fontWeight: FontWeight.w500,
            ),
          ),
          TextSpan(
            text: '을 선택해주세요',
            style: TextStyle(
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

  Widget _info(Farm farm) {
    return Column(
      children: [
        _infoModule('농지 총 면적',
            Icon(Icons.spoke, size: 16, color: AppColor.green), '${farm.sf} 평'),
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
        Row(
          children: [
            Text(
              '분양 면적',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF333333),
                fontSize: 16,
                fontFamily: 'Source Han Sans KR',
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(width: 5),
            Icon(Icons.contrast, size: 16, color: AppColor.green),
            Spacer(),
            InkWell(
              onTap: () {
                minus();
              },
              child: Container(
                width: 15,
                height: 15,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(90),
                    color: AppColor.green),
                child: const Text(
                  '-',
                  style: TextStyle(fontSize: 10, color: Colors.white),
                ),
              ),
            ),
            SizedBox(width: 10),
            Text('${(farm.usf) * num}평',
                style: const TextStyle(color: AppColor.green, fontSize: 14)),
            const SizedBox(width: 10),
            InkWell(
              onTap: () {
                plus();
              },
              child: Container(
                width: 15,
                height: 15,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(90),
                    color: AppColor.green),
                child: const Text(
                  '+',
                  style: TextStyle(fontSize: 10, color: Colors.white),
                ),
              ),
            )
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Text(
              '최종 분양 가격',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF333333),
                fontSize: 16,
                fontFamily: 'Source Han Sans KR',
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(width: 5),
            Icon(Icons.sell, size: 16, color: AppColor.red),
            Spacer(),
            Text(
              '${(farm.cost) * num}원',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF333333),
                fontSize: 20,
                fontFamily: 'Source Han Sans KR',
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        )
      ],
    );
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
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: p.length,
        itemBuilder: (BuildContext context, int index) {
          return _plantContainer(index, plants_dummy[index]);
        },
      ),
    );
  }

  Widget _second_texts() {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: '박준우',
            style: TextStyle(
              color: Color(0xFF0B855D),
              fontSize: 13,
              fontFamily: 'Source Han Sans KR',
              fontWeight: FontWeight.w500,
              height: 0.09,
            ),
          ),
          TextSpan(
            text: ' 님의 공간에서 재배할 작물을 골라주세요',
            style: TextStyle(
              color: Color(0xFF333333),
              fontSize: 13,
              fontFamily: 'Source Han Sans KR',
              fontWeight: FontWeight.w500,
              height: 0.09,
            ),
          ),
        ],
      ),
    );
  }

  Widget _plantContainer(int image, String name) {
    return GestureDetector(
      onTap: () {
        select(image);
      },
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 10),
                width: 55,
                height: 55,
                decoration: ShapeDecoration(
                  color: Colors.grey,
                  image: DecorationImage(
                    image: AssetImage('assets/plant${image + 1}.jpeg'),
                    fit: BoxFit.fill,
                  ),
                  shape: const OvalBorder(),
                ),
              ),
              selected.contains(image)
                  ? Container(
                      margin: const EdgeInsets.only(right: 10),
                      width: 55,
                      height: 55,
                      decoration: ShapeDecoration(
                        color: AppColor.green.withOpacity(0.5),
                        image: DecorationImage(
                          image: AssetImage(image.toString()),
                          fit: BoxFit.fill,
                        ),
                        shape: const OvalBorder(),
                      ),
                      child: Icon(Icons.check, color: Colors.white, size: 30),
                    )
                  : Container(),
            ],
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
      ),
    );
  }

  Widget _buyButton() {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
        Navigator.pop(context);
      },
      child: Container(
        alignment: Alignment.center,
        width: 282,
        height: 38,
        decoration: ShapeDecoration(
          color: AppColor.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: const Text(
          '결제하기',
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
