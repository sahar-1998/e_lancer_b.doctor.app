import 'package:b_doctor_app/widgets/constants.dart';
import 'package:b_doctor_app/widgets/out_boarding_content.dart';
import 'package:b_doctor_app/widgets/out_boarding_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class OutBoardingScreen extends StatefulWidget {
  const OutBoardingScreen({Key? key}) : super(key: key);

  @override
  _OutBoardingScreenState createState() => _OutBoardingScreenState();
}

class _OutBoardingScreenState extends State<OutBoardingScreen> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: AlignmentDirectional.topEnd,
            child: Visibility(
              visible: _currentPage < 2,
              replacement: TextButton(
                onPressed: () =>
                    Navigator.pushReplacementNamed(context, '/login_screen'),
                child:  Text(
                  AppLocalizations.of(context)!.start,
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontFamily:'IndieFlower',
                    fontWeight: FontWeight.w900,
                    color: mainColor1,
                  ),
                ),
              ),
              child: TextButton(
                onPressed: () =>
                    _pageController.animateToPage(2,
                        duration: const Duration(seconds: 1),
                        curve: Curves.easeInOut),
                child:  Text(
                  AppLocalizations.of(context)!.skip,
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontFamily:'IndieFlower',
                    fontWeight: FontWeight.w900,
                    color: mainColor1,
                  ),
                ),
              ),
            ),
          ),
          ConstrainedBox(
            constraints:  BoxConstraints(
              minWidth: 0,
              maxWidth: double.infinity,
              minHeight: 0.h,
              maxHeight: 500.h,
            ),
            child: PageView(
              controller: _pageController,
              // scrollDirection: Axis.vertical,
              onPageChanged: (value) {
                setState(() {
                  _currentPage = value;
                });
                // print('Current Page: $value');
              },
              children: [
                OutBoardingContent(
                  image: 'assets/ask.png',
                  mainText:AppLocalizations.of(context)!.welcometobdoctorapp,
                  subText:
                  AppLocalizations.of(context)!.first,
                ),
                OutBoardingContent(
                  image: 'assets/talk.png',
                  mainText:AppLocalizations.of(context)!.welcometobdoctorapp,
                  subText:
                  AppLocalizations.of(context)!.second                ),
                OutBoardingContent(
                  image: 'assets/res.png',
                    mainText:AppLocalizations.of(context)!.welcometobdoctorapp,
                  subText:
                  AppLocalizations.of(context)!.third
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                color: _currentPage == 0 ? Colors.grey : Colors.black,
                onPressed: () {
                  _pageController.previousPage(
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeInOut);
                },
                icon: const Icon(Icons.arrow_back_ios),
              ),
              IconButton(
                color: _currentPage == 2 ? Colors.grey : Colors.black,
                onPressed: () {
                  _pageController.nextPage(
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeInOut);
                },
                icon: const Icon(Icons.arrow_forward_ios),
              ),
            ],
          ),
           SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              out_boarding_indicator(
                marginEnd: 10,
                selected: _currentPage == 0,
              ),
              out_boarding_indicator(
                marginEnd: 10,
                selected: _currentPage == 1,
              ),
              out_boarding_indicator(
                selected: _currentPage == 2,
              ),
            ],
          ),
           SizedBox(
            height: 20.h,
          ),
          Visibility(
            visible: _currentPage == 2,
            maintainAnimation: true,
            maintainState: true,
            maintainSize: true,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  primary: mainColor1,
                ),
                onPressed: () =>
                    Navigator.pushReplacementNamed(context, '/login_screen'),
                child:  Text(AppLocalizations.of(context)!.start, style:TextStyle(fontSize: 16.sp),),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
