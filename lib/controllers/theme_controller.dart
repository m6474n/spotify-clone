import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/utils/constants.dart';

import 'package:shared_preferences/shared_preferences.dart';

class ColorManager extends GetxController {



  // List<String> currencyList = ["\$", "Rs."];
  // String currency = "\$";
  // String StoreLogo = 'assets/logo-light.png';

  Color primaryColor = const Color(0xFF42C83C);
  Color bgColor = const Color(0xFF1C1B1B);

  Color textColor = const Color(0xFFffffff);
  Color iconColor = const Color(0xFF959595);
  Color grayColor = const Color(0xFF343434);


  // Color iconColor = const Color.fromARGB(255, 242, 148, 6);
  // Color iconColor = const Color(0xffEA7C69);
  Color whiteColor = Colors.white;
  Color darkBlue = const Color(0xff1F1D2B);

  Color greyText = Colors.grey.shade200;
  Color bgLight = const Color.fromARGB(255, 244, 244, 244);
  // Color bgLight = const Color.fromARGB(255, 237, 237, 237);
  Color bgDark = const Color.fromARGB(255, 255, 255, 255);
  Color borderColor = const Color.fromARGB(255, 237, 237, 237);

  lightTheme() {
    textColor = const Color(0xff161616);
    greyText = Colors.grey.shade200;
    bgLight = const Color.fromARGB(255, 244, 244, 244);
    bgDark = const Color.fromARGB(255, 255, 255, 255);
    iconColor = primaryColor;
    Get.changeTheme(ThemeData.light());

    // StoreLogo = 'assets/logo-light.png';
    borderColor = const Color.fromARGB(255, 217, 217, 217);
    update();
  }

  darkTheme() {
    textColor = Colors.white;
    greyText = primaryColor;
    bgLight = const Color(0xff393C49);
    bgDark = const Color(0xff1F1D2B);
    iconColor = Colors.white;
    Get.changeTheme(ThemeData.dark());
    // StoreLogo = 'assets/logo-dark.png';
    borderColor = const Color.fromARGB(255, 217, 217, 217);
    update();
  }

  @override
  void onInit() {
    super.onInit();
    // loadThemeFromPreferences();
    // getUserRole();
  }

  bool isDark = false;
  void toggleTheme(newVal) {
    isDark = newVal;
    // isDarkTheme.value = newVal;
    isDark ? darkTheme() : lightTheme();
    saveThemeToPreferences(isDark);
    update();
  }

  void loadThemeFromPreferences() async {
   
    await SharedPreferences.getInstance().then((v) {
      isDark = v.getBool('isDarkTheme') ?? false;
      isDark ? darkTheme() : lightTheme();
      // primaryColor = v.getString('color')??
      primaryColor =
          Color(int.parse(hexToColor(v.getString('color') ?? "#06B7F2")));
      print("Id Dark theme:  $isDark");
      update();
    });
  }

  void saveThemeToPreferences(bool isDarkTheme) async {
    await SharedPreferences.getInstance().then((v) {
      v.setBool('isDarkTheme', isDarkTheme);
      update();
    });
  }
}
