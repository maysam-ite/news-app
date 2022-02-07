import 'dart:math';

import 'package:about/about.dart';
import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:news_ite/view/seting.dart';

import 'mainpage.dart';
import 'newstype.dart';

class NewsDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double len = max(size.width, size.height);
    return SafeArea(
      child: Drawer(
        child: Container(
         width: double.infinity,
          height: double.infinity,
          //color: Colors.amber,
         // margin: EdgeInsets.only(right: len * 0.2),
          child: ListView(
            children: [Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.asset(
                      "images/news.jpg",
                      width: len,
                      height: len* 0.25,
                      fit: BoxFit.cover,
                    )),
                SizedBox(height: 5),
                Container(
                  width: len * 0.8,
                  height: 300,
                  child: SingleChildScrollView(
                      child: Wrap(children: DrawerElement.getdrawerele())),
                ),
                Card(
                  margin: EdgeInsets.only(top: 10, bottom: 5),
                  child: ListTile(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return Setting();
                      }));
                    },
                    leading: Icon(
                      Icons.settings,
                      size: 30,
                    ),
                    title: Text( "titleAppBar" ,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        )).tr(gender: "Setting"),
                  ),
                ),
                GestureDetector(
                  child: Card(
                    margin: EdgeInsets.only(top: 10, bottom: 5),
                    child: ListTile(
                      leading: Icon(
                        Icons.home,
                        size: 30,
                      ),
                      title: Text("About Us" ,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          )).tr(),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return About();
                    }));
                  },
                )
              ],
            ),]
          ),
        ),
      ),
    );
  }
}

class DrawerElement extends StatelessWidget {
  final String sub;
  final String photo;
  DrawerElement({required this.sub, required this.photo});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Card(
            child: ListTile(
          leading: CircleAvatar(
            foregroundImage: AssetImage(photo),
          ),
          title: Text("titleAppBar").tr(gender: sub),
        )),
        onTap: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return AllNewsScreen(
              newstype: sub,
            );
          }));
        });
  }

  static List<Widget> getdrawerele() {
    List<Widget> k = [];

    for (var x = 0; x < 10; x++) {
      k.add(DrawerElement(sub: MainModel().sub(x), photo: MainModel().pho(x)));
    }

    return k;
  }
}

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AboutPage(
        values: {
          'version': '1.0',
          'year': DateTime.now().year.toString(),
        },
        applicationLegalese: 'Copyright © David PHAM-VAN, {{ year }}',
        applicationDescription: const Text(
            'News App To Show Alot Of Articles About Word.'),
        children: const <Widget>[
          MarkdownPageListTile(
            icon: Icon(Icons.list),
            title: Text('Changelog'),
            filename: 'CHANGELOG.md',
          ),
          LicensesPageListTile(
            icon: Icon(Icons.favorite),
          ),
        ],
        applicationIcon: const SizedBox(
          width: 100,
          height: 100,
          child: Image(
            image: AssetImage('images/news.jpg'),
          ),
        ));
  }
}
