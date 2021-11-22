import 'package:b_doctor_app/widgets/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 250.h,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Container(
          padding: const EdgeInsets.only(bottom: 10, top: 10, left: 0, right: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(
                'assets/about.png',
                height: 160.h,
                width: 160.w,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children:  [
                  Text('WELCOME Here',
                      style: TextStyle(
                        fontFamily: 'IndieFlower',
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w800,
                        color: mainColor1,
                      )),
                  Text(
                    'About App',
                    style: TextStyle(
                      fontFamily: 'IndieFlower',
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w800,
                      color: mainColor1,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        // child:
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Text(
            'B.Doctor App ',
            style: TextStyle(
              fontFamily: 'Pacifico',
              letterSpacing: 2,
              fontSize: 25.sp,
              fontWeight: FontWeight.bold,
              color: mainColor1,
            ),
          ),
          Container(
              padding: const EdgeInsets.only(left: 24, right: 24, top: 20),
              child: Text('B.Doctor App e_Lacner Course, this App made by Sahar Essam AlTalaam, 21/November/2021, Supervised by: Eng.Momen SiSalem, Skills used in this App: UI design, Shared Preferences, Database , Statemanagement (provider), Localization.',
                overflow: TextOverflow.ellipsis,
                maxLines: 7,
                style: TextStyle(
                    letterSpacing: 1,
                    wordSpacing: 2,
                    fontSize: 20.sp,
                    fontFamily: 'IndieFlower',
                    fontWeight: FontWeight.bold),
              )),
        ],
      ),
    );
  }
}
