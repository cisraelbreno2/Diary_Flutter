import 'package:flutter/material.dart';

class ButtonHome extends StatelessWidget{

  late final Icon icon;
  late final String name;
  late final String view;


  ButtonHome({required this.name, required this.icon, required this.view});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 30),
      child: Container(
        width: 108 ,
        height: 100,
        // ignore: prefer_const_constructors
        decoration: BoxDecoration(
          color: Color(0xFFbfa430),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
            bottomLeft: Radius.circular(10.0),
            bottomRight: Radius.circular(10.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Color(0xFF5c422f).withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 10,
              offset: Offset(0, 10), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: <Widget>[
            icon,
            Text(
              name,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15
              ),
            )
          ],
        ),
      ),
    );
  }

}