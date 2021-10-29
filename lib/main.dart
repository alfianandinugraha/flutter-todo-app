// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Home(),
    )
  );
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
        child: Column(
          children: [
            Column(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: TextField(),
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: MaterialButton(
                        onPressed: () {},
                        child: Text(
                          "Add todo",
                          style: TextStyle(
                            color: Colors.white
                          ),
                        ),
                        color: Color.fromRGBO(112, 11, 151, 1),
                      )
                    )
                  ]
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
