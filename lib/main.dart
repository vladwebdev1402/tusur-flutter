import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      title: "Laba 1",
      home: Scaffold(
          appBar: AppBar(
            title: const Text("Кривенко В.В."),
            backgroundColor: Colors.purpleAccent,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              color: Colors.pink,
              child: const Text(
                "Разработка мобильных приложений",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 32.0),
              ),
            ),
          )),
    ));
