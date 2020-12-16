import 'package:flutter/material.dart';
import 'news.dart';
import 'package:intl/intl.dart';

class ContentPage extends StatefulWidget {
  @override
  _ContentPageState createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {
  bool loadingInProgress;
  var newslist;

  void getNews() async {
    News news = News();
    await news.getNews();
    setState(() {
      loadingInProgress = false;
      newslist = news.news;
    });
  }

  @override
  void initState() {
    loadingInProgress = true;
    //TODO implement initState
    super.initState();
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            // Row(
            //   children: <Widget>[
            Text(
              newslist[1].title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 36.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            // ],
            // ),
            Divider(),

            // Expanded(
            //   child: new ListView.builder(
            //     itemCount: newslist.length,
            //     itemBuilder: (context, index) {
            //       return ListTile(
            //         //title: Text(newslist[index].title),
            //         subtitle: Text(
            //           DateFormat.Hm().format(newslist[index].publishedAt),
            //         ),
            //         title: Image.network(newslist[index].urlToImage),
            //         leading: Text(newslist[1].content),
            //       );
            //     },
            //   ),
            // ),

            Container(
              child:Column(children: <Widget>[
                Text(newslist[1].content),
              ],)
            ),
          ],
        ),
      ),
    );
  }
}
