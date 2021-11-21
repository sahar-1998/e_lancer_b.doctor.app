import 'package:b_doctor_app/widgets/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late TextEditingController _emailTextController;
  late TextEditingController _passwordTextController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailTextController = TextEditingController();
    _passwordTextController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   title: const Text(
      //     'LOGIN',
      //     style: TextStyle(
      //       color: Colors.bl,
      //       fontWeight: FontWeight.bold,
      //     ),
      //   ),
      // ),
      body: ListView(
        padding: const EdgeInsets.only(top: 50),
        children: [
          Stack(
            children: [
              Image.asset(
                'assets/h.png',
                fit: BoxFit.cover,
                width: double.infinity,
                height: 300,
              ),
              Container(
                padding: const EdgeInsets.only(
                  top: 307,
                  bottom: 5,
                  left: 90,
                ),
                child:  Text(
                    AppLocalizations.of(context)!.welcomeback,
                  style: TextStyle(
                      color: mainColor1,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Pacifico',
                      letterSpacing: 2,
                      fontSize: 26.sp),
                ),
              ),
            ],
          ),
           SizedBox(
            height: 30.h,
          ),
          Container(
            height: 250.h,
            padding: const EdgeInsetsDirectional.only(start: 25, end: 25),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Email is Required';
                      }
                    },

                    controller: _emailTextController,

                    // textAlign: TextAlign.center,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.email),
                      // fillColor: kBlue,
                      // filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      labelText: AppLocalizations.of(context)!.email,
                    ),
                  ),
                   SizedBox(
                    height: 15.h,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Password is Required';
                      }
                    },

                    obscureText: true,
                    controller: _passwordTextController,
                    // textAlign: TextAlign.center,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock),

                      // fillColor: kBlue,
                      // filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      labelText: AppLocalizations.of(context)!.password
                    ),
                  ),
                   SizedBox(
                    height: 20.h,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize:  Size(double.infinity, 50),
                      primary: mainColor1,
                    ),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        Navigator.pushReplacementNamed(
                            context, '/home_screen');
                      }
                    },
                    child:  Text(
                      AppLocalizations.of(context)!.login,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: kWhite,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
