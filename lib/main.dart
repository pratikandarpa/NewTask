import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:practical_test/constants/app_colors.dart';
import 'package:practical_test/constants/app_fonts.dart';
import 'package:practical_test/pages/home/home_bindings.dart';
import 'package:practical_test/routes/app_pages.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  runApp(GetMaterialApp(
    title: 'Flutter Practical task',
    initialBinding: HomeBindings(),
    initialRoute: AppPages.INITIAL,
    getPages: AppPages.routes,
    enableLog: true,
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: primaryColor,
      fontFamily: APP_FONT,
      bottomSheetTheme:
      BottomSheetThemeData(backgroundColor: Colors.black.withOpacity(0)),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
  ));

  const SystemUiOverlayStyle(
    statusBarColor: Colors.white,

    statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
    statusBarBrightness: Brightness.light, // For iOS (dark icons)
  );

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
}