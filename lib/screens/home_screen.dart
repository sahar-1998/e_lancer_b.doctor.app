import 'package:b_doctor_app/providers/language_provider.dart';
import 'package:b_doctor_app/widgets/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 250.h,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Container(
          padding: const EdgeInsets.only(bottom: 0, top: 10, left: 0, right: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(
                'assets/ss.png',
                height: 160.h,
                width: 160.w,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children:  [
                  Text(
                  AppLocalizations.of(context)!.welcome,
            style: TextStyle(
                      fontFamily: 'Pacifico',
                      wordSpacing: 3,
                      fontSize: 24.sp,
                      color: kadd2
                    ),
                  ),
                  Text(
                      AppLocalizations.of(context)!.appchoices,
                      style: TextStyle(fontSize: 15.sp, fontFamily: 'Pacifico',
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<LanguageProvider>(context,listen: false).changeLanguage();
        },
        child: Icon(Icons.language),
      ),
      body: GridView(
        padding: const EdgeInsets.only(top: 20),
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/contact_screen');
            },
            child: Container(
              padding: const EdgeInsets.only(bottom: 5, top: 15),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: Column(
                children:  [
                  Image(
                    image: const AssetImage('assets/b.png'),
                    height: 150.h,
                    width: 150.w,
                  ),
                  Text(
                    AppLocalizations.of(context)!.bookappointment,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'IndieFlower',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w800,
                      color: mainColor1,
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/main_screen');
            },
            child: Container(
              padding: const EdgeInsets.only(bottom: 5, top: 15),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: Column(
                children:  [
                  Image(
                    image: const AssetImage('assets/r.png'),
                    height: 150.h,
                    width: 150.w,
                  ),
                  Text(
                    AppLocalizations.of(context)!.seeappointment,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'IndieFlower',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w800,
                      color: mainColor1,
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/additional_services_screen');
            },
            child: Container(
              padding: const EdgeInsets.only(bottom: 5, top: 15),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: Column(
                children:  [
                  Image(
                    image: const AssetImage('assets/a.png'),
                    height: 150.h,
                    width: 150.w,
                  ),
                  Text(
                    AppLocalizations.of(context)!.additionalservices,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'IndieFlower',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w800,
                      color: mainColor1,
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/about');
            },
            child: Container(
              padding: const EdgeInsets.only(bottom: 5, top: 15),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: Column(
                children:  [
                  Image(
                    image: const AssetImage('assets/abb.png'),
                    height: 150.h,
                    width: 150.w,
                  ),
                  Text(
                    AppLocalizations.of(context)!.aboutapp,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'IndieFlower',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w800,
                      color: mainColor1,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
