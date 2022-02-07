import 'package:flutter/material.dart';
import 'package:news_ite/api/model/newsapp.dart';
import 'package:news_ite/view/defult.dart';

import 'package:webview_flutter/webview_flutter.dart';

class MainInfoSreen extends StatelessWidget {
  final NewsApp model;
  MainInfoSreen(this.model);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Go(
      isdrawer: false,
      title: "Info",
      content: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Container(
                height: size.height * 0.5,
                width: double.infinity,
               // margin: EdgeInsets.only(bottom: 10),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.network(
                      model.urlToImage,
                      width: double.infinity,
                      height: size.height * 0.5,
                      fit: BoxFit.cover,
                    )),
              ),
            ),
             SizedBox(height: 10,),
            Expanded(
              flex: 2,
              child: Text(
                "_ ${model.title}",
                style: TextStyle(fontSize: 20),
              ),
            ),
            //SizedBox(height: 10,),
            Expanded(
              flex: 2,
              child: Text(
                "_ ${model.description}",
                style: TextStyle(fontSize: 20),
              ),
            ),
            //SizedBox(height: 5,),
            Expanded(
              child: Text(
                "_ Written By:  ${model.author}",
                style: TextStyle(fontSize: 15),
              ),
            ),
            //SizedBox(height: 5,),
            Expanded(
              child: TextButton(
                child: Text("for more information clic here"),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return InfoScren(model.url);
                  }));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class InfoScren extends StatelessWidget {
  final String url;
  InfoScren(this.url);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
