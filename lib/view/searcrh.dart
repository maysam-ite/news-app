import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:news_ite/api/controller/newsmodelcon.dart';
import 'package:news_ite/api/model/newsapp.dart';
import 'package:news_ite/controller/control.dart';
import 'package:news_ite/widgets/newsel.dart';


// ignore: must_be_immutable
class SearchPage extends StatelessWidget {
  List<String> lange = ["English", "Arabic"];
  List<String> sortbe = ["PublishedAt","Relevancy", "Popularity", ];
  String value = '';
  String language = "en";
  String sort = "PublishedAt";
  @override
  Widget build(BuildContext context) {
    SearchControler controller = Get.put(SearchControler());
    return GetBuilder<SearchControler>(
        init: controller,
        builder: (_) {
          return Scaffold(
              appBar: AppBar(
                elevation: 0.0,
                backgroundColor: Colors.transparent,
                iconTheme: IconThemeData(
                  color: Get.isDarkMode?Colors.white:Colors.black, //change your color here
                ),
                title: TextField(
                  decoration: InputDecoration(
                    hintText:Text("Searchp").tr(gender:"Search Here").toString(),
                    icon: Icon(Icons.search),
                  ),
                  onSubmitted: (val) {
                    value = val;
                    _.addse(value);
                    _.press();
                  },
                  onTap: () {
                    value = "";
                    _.sub();
                  },
                ),
              ),
              body: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                            padding: EdgeInsets.only(left: 15),
                            margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5)),
                            child: DropdownButton(
                              items: (sortbe)
                                  .map((e) => DropdownMenuItem(
                                        child: Text("$e"),
                                        value: e,
                                      ))
                                  .toList(),
                              onChanged: (val) {
                                sort = val.toString();
                                _.l();
                              },
                              value: sort,
                            )),
                      ),
                      Expanded(
                        child: Container(
                            padding: EdgeInsets.only(left: 5),
                            margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5)),
                            child: DropdownButton(
                              items: (lange)
                                  .map((e) => DropdownMenuItem(
                                      child: Text("$e"), value: e.substring(0,2).toLowerCase()))
                                  .toList(),
                              onChanged: (val) {
                                language = val.toString();
                                _.l();
                              },
                              value: language,
                            )),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 10,
                  ),
                  Expanded(
                    child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        child: _.k
                            ? NewsShowSearch(NewsController().getsearch(
                                type: value, l: language, sort: sort))
                            : ListLast(_)),
                  )
                ],
              ));
        });
  }

}

class NewsShowSearch extends StatelessWidget {
  NewsShowSearch(this.future);

  final Future<Object> future;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: future,
        builder: (context, asyncSnapShot) {
          if (asyncSnapShot.hasData) {
            List<NewsApp> model = asyncSnapShot.data as List<NewsApp>;
            if (model.isEmpty) {
              return Container(
                child: Center(
                  child: Text('No result'),
                ),
              );
            }
            return ListView.builder(
                itemCount: model.length,
                itemBuilder: (context, i) {
                  return NewsEl(model[i]);
                });
          } else if (asyncSnapShot.hasError) {
            return const Center(child: Text('no internet connecting'));
          }
          return Center(child: CircularProgressIndicator());
        });
  }
}

// ignore: must_be_immutable
class ListLast extends StatelessWidget {
  SearchControler controller;
  ListLast(this.controller);

  @override
  Widget build(BuildContext context) {
    List<String> l = controller.last;
    return GetBuilder<SearchControler>(
      init: controller,
      builder: (_) {
        if (l.isEmpty) {
          return Container(
            child: Center(child: Text("")),
          );
        }
        return ListView.builder(
            itemCount: l.length,
            itemBuilder: (context, i) {
              return Container(
                width: double.infinity,
                height: 50,
                margin: EdgeInsets.all(5),
                child: ListTile(
                  trailing: Icon(Icons.search),
                  title: Text(
                    l[ l.length-i-1],
                    style: TextStyle(fontSize: 15),
                  ),
                  leading: Text("${i + 1}"),
                ),
              );

             
            });
      },
    );
  }
}
