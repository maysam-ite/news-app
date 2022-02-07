import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:news_ite/controller/control.dart';
import 'package:news_ite/view/defult.dart';
import 'package:shared_preferences/shared_preferences.dart';

//import 'defultScreen.dart';

// ignore: must_be_immutable
class Setting extends StatelessWidget {
  List<String> lang = ["English", "Arabic"];
  @override
  Widget build(BuildContext context) {
    return Go(
      isdrawer: false,
      title: "Setting",
      content: SafeArea(child: Settingele()),
    );
  }
}

// ignore: must_be_immutable
class Settingele extends StatelessWidget {
  Controller controller = Get.put(Controller());
  List<String> lang = ["English", "Arabic"];
  String l = "English";
  bool state = false;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<Controller>(
        init: controller,
        builder: (_) {
          return Column(
            children: [
              Container(
                child: SwitchListTile(
                    title: Text("Setting").tr(gender:"Theme"),
                    value: _.theme,
                    onChanged: (bool) {
                      _.changetheme();
                    }),
              ),
              Container(
                  padding: EdgeInsets.only(left: 15),
                  margin: EdgeInsets.all(5),
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                      //color: Colors.blue,
                      borderRadius: BorderRadius.circular(5)),
                  child: DropdownButton(
                    items: lang
                        .map((e) =>
                            DropdownMenuItem(child: Text("$e"), value: e))
                        .toList(),
                    onChanged: (val) async {
                      
                      SharedPreferences pref =
                          await SharedPreferences.getInstance();
                      var x = pref.getString("lang");
                      
                      if (val == "Arabic" && x == 'en') {
                        await pref.setString("lang", "ar");
                        l = "Arabic";
                       
                        
                        final _newLocale = Locale("ar");
                        await context.setLocale(_newLocale);

                        Get.updateLocale(_newLocale);
                        
                      } else if (val == "English" && x == 'ar') {
                        await pref.setString("lang", "en");
                        l = "English";
                        final _newLocale = Locale("en");
                        await context.setLocale(_newLocale);
                        Get.updateLocale(_newLocale);
                       
                      }
                    },
                    hint: Text("Setting",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),).tr(gender:"lang"),
                  )),
            ],
          );
        });
  }
}
