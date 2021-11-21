import 'package:b_doctor_app/widgets/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/out_boarding_screen');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: AlignmentDirectional.center,
        decoration: const BoxDecoration(
          color: kWhite,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/launch.png'),
            const SizedBox(
              height: 10,
            ),
             Text(
              'B.Doctor App',
              style: TextStyle(
                  color: mainColor3,
                  fontSize: 28.sp,
                  fontFamily: 'Pacifico',
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
