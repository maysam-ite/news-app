import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:news_ite/view/defult.dart';
import 'package:news_ite/view/newstype.dart';

// ignore: must_be_immutable
class MainPage extends StatelessWidget {
  List<Widget> mainsub = Elements.mm();
  @override
  Widget build(BuildContext context) {
    return Go(
      isdrawer: true,
      title: "mainpage",
      content: Container(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 5),
              Wrap(
                children: mainsub,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Elements extends StatelessWidget {
  final String subject;
  final String photo;
  Elements({required this.subject, required this.photo});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      child: Container(
          margin: EdgeInsets.only(top: 5, bottom: 5),
          child: Stack(children: [
            ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  topRight: Radius.circular(20),
                ),
                child: Image.asset(
                  photo,
                  width: size.width,
                  height: 80,
                  fit: BoxFit.cover,
                )),
            Container(
                height: 80,
                width: size.width,
                alignment: Alignment.bottomRight,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      topRight: Radius.circular(20),
                    ),
                    color: Colors.black38),
                child: Text("titleAppBar",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w500)).tr(gender: subject)
                        )
          ])),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return AllNewsScreen(
            newstype: subject,
          );
        }));
      },
    );
  }

  static List<Elements> mm() {
    List<Elements> l = [];

    for (var x = 0; x < 10; x++) {
      l.add(Elements(subject: MainModel().sub(x), photo: MainModel().pho(x)));
    }
    return l;
  }
}

class MainModel {
  List<String> _subjects = [
    "Sports",
    "Health",
    "Food",
    "Movies",
    "Policy",
    "Economy",
    "Business",
    "Weather",
    "Technology",
    "Entertainment",
  ];
 
  String sub(int i) {
   return _subjects[i];

  }

  String pho(int i) {
    return ("images/${_subjects[i]}.jpg");
  }
}
