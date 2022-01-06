// ignore_for_file: prefer_const_constructors

import 'package:day_project/components/button_home.dart';
import 'package:day_project/screens/debts_list.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.green[900],
          accentColor: Colors.blueAccent[700],
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.blueAccent[700],
            textTheme: ButtonTextTheme.primary,
          )
      ),
      home: Scaffold(

        backgroundColor: Color(0xFF25252c),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset("images/Fire Loop.gif",
              width: 475,
              height: 600,
              ),
            ),
            Row(
              children: <Widget>[
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ListDebts()));
                  },
                  child: ButtonHome(
                    icon: Icon(Icons.people, size: 50, color: Colors.white),
                    name: "Contatos",
                    view: "",
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ListDebts()));
                  },
                  child: ButtonHome(
                    icon: Icon(Icons.description, size: 50, color: Colors.white),
                    name: "Debitos",
                    view: "a",
                  ),
                ),
                ButtonHome(
                  icon: Icon(Icons.camera_alt, size: 50, color: Colors.white,),
                  name: "Câmera",
                  view: "a",
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

