import 'package:flutter/material.dart';
import 'contents.dart';
import 'news.dart';
import 'package:intl/intl.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
  
  
}

class _NewsPageState extends State<NewsPage> {
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
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.0,
          ),
          child: loadingInProgress
              ? Center(
                  child: Text('Loading...'),
                )
              : Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          'Top headlines',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 36.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                     Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 7.0,
                    ),
                    child: Divider(
                        thickness: 5,
                        color: Colors.blueAccent,
                        endIndent: 50),
                  ),
                    Expanded(
                      child: new ListView.builder(
                        itemCount: newslist.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: ListTile(
                                title: Text(newslist[index].title),
                                subtitle: Text(
                                  DateFormat.Hm()
                                      .format(newslist[index].publishedAt),
                                ),
                                leading:
                                    Image.network(newslist[index].urlToImage),
                                // onTap: () {
                                //   Navigator.of(context).pop();
                                //   Navigator.of(context).pushNamed('/content');
                                // }
                                ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
