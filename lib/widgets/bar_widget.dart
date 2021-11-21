import 'package:b_doctor_app/widgets/constants.dart';
import 'package:flutter/material.dart';

class WidgetBar extends StatelessWidget {
  const WidgetBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 30, bottom: 30),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: Image.asset(
              "assets/step1.png",
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 30),
                  child: const Text(
                    'WELCOME',
                    style: TextStyle(
                      color: kadd1,
                      fontSize: 26,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: const Text(
                    'Here is Personal Details',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
