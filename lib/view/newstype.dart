import 'package:flutter/material.dart';
import 'package:news_ite/view/defult.dart';
import 'package:news_ite/widgets/newsel.dart';

class AllNewsScreen extends StatelessWidget {
  const AllNewsScreen({required this.newstype});

  final String newstype;

  @override
  Widget build(BuildContext context) {
    return Go(
        isdrawer: true,
        title: newstype,
        content: SafeArea(
            child: SingleChildScrollView(
            
          child: Column(
              children: [NewsShowWidgets(NewsEl.getnews(newstype))]),
        )));
  }
}

class NewsShowWidgets extends StatelessWidget {
  NewsShowWidgets(this.future);

  final Future<Object> future;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: future,
        builder: (context, asyncSnapShot) {
          if (asyncSnapShot.hasData) {
            return SingleChildScrollView(
                child: Wrap(children: asyncSnapShot.data as List<Widget>));
          } else if (asyncSnapShot.hasError) {
            return Center(child: Text('no internet connecting'));
          }
          return Center(child: CircularProgressIndicator());
        });
  }
}
