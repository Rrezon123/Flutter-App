import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart' as prefix0;

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPage createState() => _DashboardPage();
}

class _DashboardPage extends State<DashboardPage> {
  List<String> events = [
    "Calendar",
    "Founder",
    "People",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromRGBO(176, 196, 222, 100),
                     
                      
                    ),
                    margin: EdgeInsets.only(top: 20),
                    child: SfRadialGauge(
                      axes: <RadialAxis>[
                        RadialAxis(
                          startAngle: 150,
                          endAngle: 30,
                          axisLineStyle: AxisLineStyle(thickness: 30),
                          showTicks: false,
                          pointers: <GaugePointer>[
                            MarkerPointer(
                              value: 60,
                              enableAnimation: true,
                              markerHeight: 0,
                              markerWidth: 0,
                            ),
                            RangePointer(
                                value: 60,
                                enableAnimation: true,
                                width: 30,
                                animationType: AnimationType.bounceOut,
                                color: Colors.blueAccent,
                                cornerStyle: prefix0.CornerStyle.endCurve)
                          ],
                          annotations: <GaugeAnnotation>[
                            GaugeAnnotation(
                                widget: Column(
                                  children: <Widget>[
                                    Container(
                                        width: 50.00,
                                        height: 10.00,
                                        decoration: new BoxDecoration()),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
                                      child: Container(
                                        child: Text('60%',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 25)),
                                      ),
                                    )
                                  ],
                                ),
                                angle: 270,
                                positionFactor: 0.1)
                          ],
                        ),
                      ],
                      title: GaugeTitle(text: 'Work done',
                      textStyle: TextStyle(fontSize: 26, fontWeight: FontWeight.bold,),)
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.0,
                    ),
                    child: Row(
                      children: <Widget>[
                        Text(
                          'Dashboard',
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
                        thickness: 10,
                        color: Colors.blueAccent,
                        endIndent: 190),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 0.0,
                ),
                child: Container(
                  margin: EdgeInsets.only(top: 430),
                  child: GridView(
                    physics: BouncingScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    children: events.map((title) {
                      return GestureDetector(
                        child: Card(
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(20),
                          ),
                          margin: const EdgeInsets.all(20.0),
                          child: getCardByTitle(title),
                        ),
                        onTap: () {
                          if (title == "Calendar") {
                            Navigator.of(context).pop();
                            Navigator.of(context).pushNamed('/calendar');
                          } else if (title == "People") {
                            Navigator.of(context).pop();
                            Navigator.of(context).pushNamed('/people');
                          }
                        },
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Column getCardByTitle(String title) {
  String img = "";
  if (title == "Calendar")
    img = "assets/calendar.png";
  else if (title == "Founder")
    img = "assets/team_time.png";
  else
    img = "assets/friends.png";
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      new Center(
        child: Container(
          child: new Stack(
            children: <Widget>[
              new Image.asset(
                img,
                width: 80,
                height: 80,
              )
            ],
          ),
        ),
      ),
      Text(title,
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center),
    ],
  );
}
