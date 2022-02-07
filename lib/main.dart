import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_ite/controller/control.dart';
import 'package:news_ite/view/mainpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  SharedPreferences pref = await SharedPreferences.getInstance();
  var x = pref.getString("lang");
  if(x==null){
    pref.setString("lang","en");
  }
  if(pref.getBool("isligth") ==null){
    pref.setBool("isligth", true );
    Controller().theme=false;
  }
  runApp(
    EasyLocalization(
        supportedLocales: [Locale('en'), Locale('ar')],
        path: 'assets/translations',
        fallbackLocale: Locale('en', 'US'),
        saveLocale: true,
        child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    Controller controller = Get.put(Controller());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: MainPage(),
    );
  }
}
