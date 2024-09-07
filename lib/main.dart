import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      title: "Laba 1",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Лабораторная работа 1"),
          backgroundColor: Colors.purpleAccent,
        ),
        body: Container(
          margin: EdgeInsets.only(top: 32.0),
          color: Colors.pink,
          child: const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Hello World",
              style: TextStyle(color: Colors.white, fontSize: 32.0),
            ),
          ),
        ),
      ),
    ));
