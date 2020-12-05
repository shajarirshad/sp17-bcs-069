import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.deepPurpleAccent,
        appBar: AppBar(
          title: Text(
            'Dice ',
            style: TextStyle(
              fontSize: 50.0,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          backgroundColor: Colors.deepPurpleAccent,
        ),
        body: DicePageDynamic(),
      ),
    ),
  );
}

//create a stateful widget; shortcut is  stful
//this class will let part of the user interface change dynamically
class DicePageDynamic extends StatefulWidget {
  @override
  _DicePageDynamicState createState() => _DicePageDynamicState();
}

class _DicePageDynamicState extends State<DicePageDynamic> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  void changeDiceFace() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    //make dice image change anytime a user presses
    //create a var for the left and right

    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: FlatButton(
                onPressed: () {
                  changeDiceFace();
                },
                child: Image.asset('images/dice$leftDiceNumber.png')),
          ),
          Expanded(
            child: FlatButton(
              onPressed: () {
                changeDiceFace();
              },
              child: Image.asset('images/dice$rightDiceNumber.png'),
            ),
          ),
        ],
      ),
    );
  }
}
