import 'package:b_doctor_app/widgets/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class AdditionalServicesScreen extends StatefulWidget {
  const AdditionalServicesScreen({Key? key}) : super(key: key);

  @override
  _AdditionalServicesScreenState createState() =>
      _AdditionalServicesScreenState();
}

class _AdditionalServicesScreenState extends State<AdditionalServicesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 160.h,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.r),
          ),
          padding: const EdgeInsets.only(top: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(
                'assets/ss.png',
                height: 160.h,
                width: 140.w,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children:  [
                  Text(
                  AppLocalizations.of(context)!.besaftey,
                    style: TextStyle(
                        fontFamily: 'Pacifico',
                        wordSpacing: 3,
                        fontSize: 24.sp,
                        color: kadd2),
                  ),
                  Text(
                    AppLocalizations.of(context)!.protectyourcountry,
                    style: TextStyle(
                        fontSize: 15.sp,
                        fontFamily: 'Pacifico',
                        wordSpacing: 3,
                        color: kadd2),
                  )
                ],
              )
            ],
          ),
        ),
        // child:
      ),
      body: GridView(
        padding: const EdgeInsets.only(top: 20),
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 5, top: 15),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: Column(
              children:  [
                Image(
                  image: const AssetImage('assets/c1.png'),
                  height: 130.h,
                  width: 130.w,
                ),
                Text(
                  AppLocalizations.of(context)!.washhandsthorough,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'IndieFlower',
                    fontSize: 16.1.sp,
                    fontWeight: FontWeight.w800,
                    color: mainColor1,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 5, top: 15),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: Column(
              children:  [
                Image(
                  image: const AssetImage('assets/c2.png'),
                  height: 130.sp,
                  width: 130.sp,
                ),
                Text(
                  AppLocalizations.of(context)!.social,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'IndieFlower',
                    fontSize: 16.1.sp,
                    fontWeight: FontWeight.w800,
                    color: mainColor1,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 5, top: 15),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: Column(
              children:  [
                Image(
                  image: const AssetImage('assets/c3.png'),
                  height: 130.h,
                  width: 130.w,
                ),
                Text(
                  AppLocalizations.of(context)!.stickto,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'IndieFlower',
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w800,
                    color: mainColor1,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 5, top: 15),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: Column(
              children:  [
                Image(
                  image: const AssetImage('assets/c4.png'),
                  height: 130.h,
                  width: 130.w,
                ),
                Text(
                  AppLocalizations.of(context)!.checkyour,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'IndieFlower',
                    fontSize: 16.1.sp ,
                    fontWeight: FontWeight.w800,
                    color: mainColor1,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 5, top: 15),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: Column(
              children:  [
                Image(
                  image: const AssetImage('assets/c5.png'),
                  height: 130.h,
                  width: 130.w,
                ),
                Text(
                  AppLocalizations.of(context)!.stickto,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'IndieFlower',
                    fontSize: 16.1.sp,
                    fontWeight: FontWeight.w800,
                    color: mainColor1,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 5, top: 15),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: Column(
              children:  [
                Image(
                  image: const AssetImage('assets/c6.png'),
                  height: 130.h,
                  width: 130.w,
                ),
                Text(
                  AppLocalizations.of(context)!.ontheandmouth,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'IndieFlower',
                    fontSize: 16.1.sp,
                    fontWeight: FontWeight.w800,
                    color: mainColor1,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
