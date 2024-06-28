import 'package:flutter/material.dart';

class ImageSlide extends StatelessWidget {
  final List<String> imageUrls; // 이미지 asset 경로들의 리스트

  ImageSlide({Key? key, required this.imageUrls}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      child: Container(
        height: 165,
        width: 340,
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.circular(15.0), // 여기서 모서리 둥글기 설정
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: PageView.builder(
            itemCount: imageUrls.length,
            itemBuilder: (context, index) {
              return Image.asset(
                imageUrls[index],
                fit: BoxFit.cover,
              );
            },
          ),
        ),
      ),
    );
  }
}
