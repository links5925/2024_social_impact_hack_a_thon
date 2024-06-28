import 'package:social_impact2024/model/farm.dart';

String iamge_root = 'assets';
Farm farm1 = Farm(
    name: '농장1',
    sf: 80,
    day: 20,
    image: '$iamge_root/farm1.png',
    cost: 30000,
    usf: 10,
    address: '서울특별시 용산구 한강대로 164',
    rain: 16.8,
    sun: '좋음');

Farm farm2 = Farm(
    name: '농장2',
    sf: 130,
    day: 52,
    image: '$iamge_root/farm2.jpg',
    cost: 70000,
    usf: 13,
    address: '서울특별시 중구 세종대로 164',
    rain: 16,
    sun: '좋음');

Farm farm3 = Farm(
    name: '농장3',
    sf: 50,
    day: 70,
    image: '$iamge_root/farm3.png',
    cost: 20000,
    usf: 10,
    address: '서울특별시 영등포구 도신로 16길',
    rain: 16,
    sun: '좋음');

Farm farm4 = Farm(
    name: '농장4',
    sf: 180,
    day: 45,
    image: '$iamge_root/farm4.jpg',
    cost: 10000,
    usf: 18,
    address: '인천 미추홀구 소성로 71',
    rain: 16,
    sun: '좋음');

Farm farm5 = Farm(
    name: '인천 미추홀구 인주대로 244',
    sf: 110,
    day: 17,
    image: '$iamge_root/farm5.png',
    cost: 17000,
    usf: 10,
    address: '주소5',
    rain: 16,
    sun: '좋음');

List<Farm> dummy_farms = [farm1, farm2, farm3, farm4, farm5];
