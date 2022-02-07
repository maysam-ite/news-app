import 'package:flutter/material.dart';
import 'package:news_ite/api/controller/newsmodelcon.dart';
import 'package:news_ite/api/model/newsapp.dart';
import 'package:news_ite/view/infoScrren.dart';

class NewsEl extends StatelessWidget {
  final NewsApp model;
  NewsEl(this.model);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
          margin: EdgeInsets.all(5),
          child: Stack(children: [
            ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  topRight: Radius.circular(20),
                ),
                child: Image.network(
                  model.urlToImage,
                  width: double.infinity,
                  height: 130,
                  fit: BoxFit.cover,
                )),
            Container(
                height: 130,
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      topRight: Radius.circular(20),
                    ),
                    color: Colors.black38),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 15),
                    Text(model.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.w500)),
                    SizedBox(height: 10),
                    Text(model.description,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 10,
                            color: Colors.white,
                            fontWeight: FontWeight.w500))
                  ],
                ))
          ]),
        ),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return MainInfoSreen(model);
          }));
        });
  }

  static Future<List<Widget>> getnews(String newstype) async {
    List models = await NewsController().getallnews(newstype);
    List<Widget> widgets = [];
    for (var x in models) {
      widgets.add(NewsEl(x));
    }
    return widgets;
  }

  static Future<List<Widget>> getsearch(
      {String type = "sport",
      String l = "en",
      String sort = "PublishedAt"}) async {
    List models =
        await NewsController().getsearch(type: type, l: l, sort: sort);
    List<Widget> widgets = [];
    for (var x in models) {
      widgets.add(NewsEl(x));
    }
    return widgets;
  }
}
