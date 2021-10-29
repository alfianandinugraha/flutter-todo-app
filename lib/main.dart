// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(112, 11, 151, 1),
        title: Text("Flutter Todo"),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
        child: Column(
          children: [
            Form(
              onSubmit: (input) {
                print(input);
              },
            )
          ],
        ),
      ),
    );
  }
}

class Form extends StatefulWidget {
  final Function(String)? onSubmit;

  const Form({Key? key, this.onSubmit}) : super(key: key);

  @override
  _FormState createState() => _FormState();
}

class _FormState extends State<Form> {
  String inputText = "";
  final TextEditingController _textController = TextEditingController(text: "");

  _FormState();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
          child: TextField(
            controller: _textController,
            onChanged: (value) {
              setState(() {
                inputText = value;
              });
            },
          ),
        ),
        Row(children: [
          Expanded(
              flex: 1,
              child: MaterialButton(
                onPressed: () {
                  if (widget.onSubmit == null) return;
                  widget.onSubmit!(inputText);
                  setState(() {
                    _textController.text = "";
                    inputText = "";
                  });
                },
                child: Text(
                  "Add todo",
                  style: TextStyle(color: Colors.white),
                ),
                color: Color.fromRGBO(112, 11, 151, 1),
              ))
        ])
      ],
    );
  }
}
