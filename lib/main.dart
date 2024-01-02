import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueAccent,
        appBar: AppBar(
          centerTitle: true,
          title: Text('Dicee'),
          backgroundColor: Colors.blue,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  var leftDiceNumber = 1; // Initialize it as 5 initially we can intialized with any number
  var rightDiceNumber = 1;

  void ChangeDice() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) +
          1; //generate the random number from 0-max,excluding max so we need to add 1 if we want number from 0-6.
      rightDiceNumber = Random().nextInt(6) + 1;
      // print('DiceNumber = $leftDiceNumber');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextButton(
              onPressed: () {
                ChangeDice();
                // setState(() {
                //                 //   leftDiceNumber = Random().nextInt(6) + 1;//generate the random number from 0-max,excluding max so we need to add 1 if we want number from 0-6.
                //                 //   rightDiceNumber = Random().nextInt(6) + 1;
                //                 //   // print('DiceNumber = $leftDiceNumber');
                //                 // });
              },
              child: Image.asset('images/dice$leftDiceNumber.png'),
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: () {
                ChangeDice();
                // setState(() {
                //   rightDiceNumber = Random().nextInt(6) + 1;
                //   leftDiceNumber = Random().nextInt(6) + 1;
                //   // print('DiceNumber = $rightDiceNumber');
                // });
              },
              child: Image.asset('images/dice$rightDiceNumber.png'),
            ),
          ),
        ],
      ),
    );
  }
}
//The Expanded widget is used inside the Row to distribute available space equally among its child widgets.
// In this case, the TextButton widgets containing dice images are wrapped inside Expanded to ensure they expand to fill the entire space horizontally. This way, each die occupies an equal portion of the row.
// Without Expanded, the widgets might not expand to fill the available space, and they could have inconsistent or fixed sizes based on their content, affecting the layout of the dice images in the row.
