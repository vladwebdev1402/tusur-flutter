import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
    title: "Laba 2",
    home: Scaffold(
      appBar: AppBar(
        title: const Text("Кривенко В. В. "),
        backgroundColor: Colors.purpleAccent,
      ),
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 96.0,
            height: 96.0,
            margin: const EdgeInsets.only(top: 12.0),
            child: Image.asset(
              'assets/keka1.png',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: 96.0,
            height: 96.0,
            margin: const EdgeInsets.only(top: 12.0),
            child: Image.asset(
              'assets/keka2.png',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: 96.0,
            height: 96.0,
            margin: const EdgeInsets.only(top: 12.0),
            child: Image.asset(
              'assets/keka3.png',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: 96.0,
            height: 96.0,
            margin: const EdgeInsets.only(top: 12.0),
            child: Image.asset(
              'assets/monya1.png',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: 96.0,
            height: 96.0,
            margin: const EdgeInsets.only(top: 12.0),
            child: Image.asset(
              'assets/monya2.png',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: 96.0,
            height: 96.0,
            margin: const EdgeInsets.only(top: 12.0),
            child: Image.asset(
              'assets/monya3.png',
              fit: BoxFit.cover,
            ),
          ),
        ],
      )),
    )));
