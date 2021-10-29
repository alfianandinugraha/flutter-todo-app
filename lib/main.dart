// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nanoid/nanoid.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Todo {
  String id = "";
  String activity = "";
  bool isFinish = false;

  Todo(this.activity) {
    id = nanoid();
  }
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  List<Todo> todos = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Form(
            onSubmit: (input) {
              setState(() {
                todos.add(Todo(input));
              });
            },
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: todos.map((todo) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: Color.fromRGBO(238, 238, 238, 1),
                  ),
                  width: double.infinity,
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  padding: EdgeInsets.all(10),
                  child: Text(todo.activity),
                );
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
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
      body: App()
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
