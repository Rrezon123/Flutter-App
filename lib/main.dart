import 'package:flui/homepage.dart';
import 'package:flutter/material.dart';
import 'New_page.dart';
import 'dart:async';
import 'contents.dart';
import 'Dashboard.dart';
import 'calendar.dart';
import 'People.dart';
// import 'news.dart';
// import 'package:intl/intl.dart';
import 'homepage.dart';

Map<int, Color> color = {
  50: Color.fromRGBO(136, 14, 79, .1),
  100: Color.fromRGBO(136, 14, 79, .2),
  200: Color.fromRGBO(136, 14, 79, .3),
  300: Color.fromRGBO(136, 14, 79, .4),
  400: Color.fromRGBO(136, 14, 79, .5),
  500: Color.fromRGBO(136, 14, 79, .6),
  600: Color.fromRGBO(136, 14, 79, .7),
  700: Color.fromRGBO(136, 14, 79, .8),
  800: Color.fromRGBO(136, 14, 79, .9),
  900: Color.fromRGBO(136, 14, 79, 1),
};

MaterialColor colorCustom = MaterialColor(0xFF00688B, color);
void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        theme: new ThemeData(
          primarySwatch: colorCustom,
        ),
        debugShowCheckedModeBanner: false,
        home: new HomePage(),
        routes: <String, WidgetBuilder>{
          "/welcome": (BuildContext context) => new NewPage("New Page"),
          "/w": (BuildContext context) => new NewsPage(),
          "/content": (BuildContext context) => new ContentPage(),
          "/dash": (BuildContext context) => new DashboardPage(),
          "/calendar": (BuildContext context) => new Calendar(),
          "/people": (BuildContext context) => new PeoplePage(),
        });
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              currentAccountPicture: new CircleAvatar(
                  backgroundColor: Colors.white10, child: new Text("G")),
              accountName: new Text("Guest"),
              accountEmail: new Text("guest@gmail.com"),
            ),
            new ListTile(
              title: new Text("Dashboard"),
              trailing: new Icon(Icons.dashboard),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed("/dash");
              },
            ),
            new ListTile(
              title: new Text("News"),
              trailing: new Icon(Icons.insert_drive_file),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed("/w");
              },
            ),
            new ListTile(
              title: new Text("Settings"),
              trailing: new Icon(Icons.settings),
            ),
            new Divider(),
            new ListTile(
              title: new Text("Close"),
              trailing: new Icon(Icons.close),
              onTap: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              child: Stack(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius:  BorderRadius.vertical(bottom: Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0.0, 2.0),
                            blurRadius: 6.0)
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius:  BorderRadius.vertical(bottom: Radius.circular(20)),
                      child: Image(
                        image: AssetImage('assets/bg1.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 7.0, vertical: 30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.menu),
                          iconSize: 30.0,
                          color: Colors.white,
                          onPressed: () =>
                              scaffoldKey.currentState.openDrawer(),
                        ),
                        Row(
                          children: <Widget>[
                            IconButton(
                              icon: Icon(Icons.search),
                              iconSize: 30.0,
                              color: Colors.white,
                              onPressed: () => Navigator.of(context).pop(),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10.0,
              ),
              child: Row(
                children: <Widget>[
                  Text(
                    'Home',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 36.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 7.0,
              ),
              child: Divider(
                  thickness: 10, color: Colors.blueAccent, endIndent: 190),
            ),
          ],
        ),
      ),
    );
  }
}
