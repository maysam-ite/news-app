import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:news_ite/controller/control.dart';
import 'package:news_ite/view/drawer.dart';
import 'package:news_ite/view/searcrh.dart';

// ignore: must_be_immutable
class Go extends StatelessWidget {
  Controller controller = Get.put(Controller());
  String title;
  Widget content;
  bool isdrawer;
  Go({required this.content, required this.title, required this.isdrawer});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<Controller>(
        init: controller,
        builder: (_) {
          return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                iconTheme: IconThemeData(
                  color: Get.isDarkMode?Colors.white:Colors.black
                ),
                title: Text("titleAppBar",
                        style: TextStyle(
                            color: Get.isDarkMode?Colors.white:Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold))
                    .tr(gender: title),
                elevation: 0.0,
                actions: [
                  IconButton(
                    
                    icon: Icon(
                      Icons.search,
                      size: 20,
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return SearchPage();
                      }));
                    },
                  )
                ],
              ),
              body: SafeArea(child: content),
              drawer: isdrawer ? NewsDrawer() : null);
        });
  }
}
