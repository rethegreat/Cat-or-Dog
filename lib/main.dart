import 'package:flutter/material.dart';
// ignore_for_file: prefer_const_constructors
import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _dogVotes = 0;
  int _catVotes = 0;
  String winner = 'Dogs';

  void _addDog() {
    setState(() {
      _dogVotes++;

      if (_catVotes > _dogVotes) {
        winner = 'Cats';
      } else {
        winner = 'Dogs';
      }
    });
  }

  void _addCat() {
    setState(() {
      _catVotes++;

      if (_catVotes > _dogVotes) {
        winner = 'Cats';
      } else {
        winner = 'Dogs';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var dogPicture = Container(
      width: 150,
      height: 250,
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('images/dog.jpeg')),
          borderRadius: BorderRadius.all(Radius.circular(20))),
    );

    var catPicture = Container(
      width: 150,
      height: 250,
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('images/cat.jpeg')),
          borderRadius: BorderRadius.all(Radius.circular(20))),
    );

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.orange,
            title: const Text('Cats or Dogs?'),
          ),
          body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        dogPicture,
                        Padding(
                          padding: const EdgeInsets.only(top: 30.0),
                          child: TextButton(
                            style: TextButton.styleFrom(
                              textStyle: const TextStyle(fontSize: 40),
                            ),
                            onPressed: _addDog,
                            child: const Text(
                              'Dogs',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        catPicture,
                        Padding(
                          padding: const EdgeInsets.only(top: 30.0),
                          child: TextButton(
                            style: TextButton.styleFrom(
                              textStyle: const TextStyle(fontSize: 40),
                            ),
                            onPressed: _addCat,
                            child: const Text(
                              'Cats',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Text('Click on the word to vote', style: TextStyle(fontSize: 25, color: Colors.orange)),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Text(
                    '$winner are winning by ${(_catVotes - _dogVotes).abs()} votes',
                    style: TextStyle(fontSize: 35),
                  ),
                ),
              ])),
    );
  }
}
