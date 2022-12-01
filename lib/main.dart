import 'dart:math';
import 'package:flutter/material.dart';

void main(){
  return runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Dicee App',
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          backgroundColor: Colors.red,
          elevation: 0.0,
          centerTitle: true,
          title: Text('Dicee'),
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {

  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  void rollDice(){
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
      _toastAlert(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: MaterialButton(
              onPressed: (){
               rollDice();
              },
              child: Image.asset('images/dice$leftDiceNumber.png'),
            ),
          ),
          Expanded(
            child: MaterialButton(
              onPressed: (){
                rollDice();
              },
              child: Image.asset('images/dice$rightDiceNumber.png'),
            ),
          ),
        ],
      ),
    );
  }

  void _toastAlert(BuildContext context){
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text("Hell World"),
        action: SnackBarAction(
            label: 'Undo',
            onPressed: scaffold.hideCurrentSnackBar
        ),
      ),
    );
  }

}




