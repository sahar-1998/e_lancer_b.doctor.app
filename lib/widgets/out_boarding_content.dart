import 'package:flutter/material.dart';

class OutBoardingContent extends StatelessWidget {
  final String image;
  String mainText;
  String subText;

  //final Color pageColor;

  OutBoardingContent({
    required this.image, required this.mainText, required this.subText
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      // padding: EdgeInsets.symmetric(horizontal: 10)
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(image, height: 280,width: 280,),
        const SizedBox(height: 20),
        Text(
          mainText,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 22,
            fontFamily: 'Pacifico',
            fontWeight: FontWeight.w600,
          ),
        ),
          SizedBox(height: 12,),
          Text(
          subText,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            fontFamily: 'IndieFlower',

          ),
        ),
      ],
    );
  }
}
