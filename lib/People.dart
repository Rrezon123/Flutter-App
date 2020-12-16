import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'Person.dart';

class PeoplePage extends StatefulWidget {
  @override
  _PeoplePage createState() => _PeoplePage();
}

class _PeoplePage extends State<PeoplePage> {
  final List<Person> peopleList = [
    Person("Anisë Murseli", "XII/1", "anisa.murseli@outlook.com"),
    Person("Erduan Shabani", "XII/1", "erduanshabani@gmail.com"),
    Person("Lindrit Murati", "XII/1", "lindrit-murati@outlook.com"),
    Person("Anduen Kryeziu", "XII/1", "anduen.kryeziu@hotmail.com"),
    Person("Bardh Osmani", "XII/1", "bardhosmani01@gmail.com"),
    Person("Sherif Hoti", "XII/1", "sherifhoti1235@hotmail.com"),
    Person("Aron Hoxha", "XII/1", "aronhoxha@gmail.com"),
    Person("Andi Sejdiu", "XII/1", "andi23012002@gmail.com"),
    Person("Dion Berisha", "XI/2", "dion.berisha.1@gmail.com"),
    Person("Olti Gashi", "XI/2", "oltigashi18@gmail.com"),
    Person("Alena Rama", "X/2", "ramaalena3@gmail.com"),
    Person("Valmira Shala", "XII/2", "valmira.-@hotmail.com"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter People'),
      ),
      body:  Container(
          child: new ListView.builder(
              itemCount: peopleList.length,
              itemBuilder: (BuildContext context, int index) =>
                  buildPeopleCard(context, index)),
        ),
    );
  }

  Widget buildPeopleCard(BuildContext context, int index) {
    final people = peopleList[index];

    return new Container(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
                child: Row(children: <Widget>[
                  Text(
                    people.name,
                    style: new TextStyle(fontSize: 30.0,fontWeight: FontWeight.w500),
                  ),
                  Spacer(),
                   Icon(Icons.account_circle,size: 50,),
                   
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Text(
                    people.year,
                    style: new TextStyle(fontSize: 23.0),
                  ),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      people.description,
                      style: new TextStyle(fontSize: 20.0),
                    ),
                    Spacer(),
                   
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
