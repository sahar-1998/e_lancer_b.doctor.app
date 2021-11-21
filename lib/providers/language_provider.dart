
import 'package:b_doctor_app/prefs/shared_pref_controller.dart';
import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {

  String language = SharedPrefController().language;

  void changeLanguage(){
    language = language == 'en' ? 'ar' : 'en';
    SharedPrefController().setLanguage(lang: language);
    notifyListeners();
  }
}