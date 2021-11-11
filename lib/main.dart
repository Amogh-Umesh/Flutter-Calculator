// ignore_for_file: use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'buttons/buttons.dart';
import 'calc_logic.dart';

void main()=>runApp(MaterialApp(
    home : Home(),
  ));


class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String userInput = '1+2';
  String output = '';
  void buttonPress(Buttons button){
    setState(() {
      List<dynamic> temp = mainLogic(button, userInput, output);
      userInput = temp[0];
      output = temp[1];
    });
    return;
  }

  Widget calculatorButton(Buttons button){
    return ElevatedButton(
      onPressed: () => buttonPress(button),
      child: SizedBox(
        width: 30,
        height: 25,
        child: Center(
          child: Text(
            button.value,
            style: TextStyle(color: button.color, fontSize: 20),
          ),
        ),
      ),
      style: ElevatedButton.styleFrom(
        primary: Colors.grey[900],
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(30),
        shadowColor: Colors.grey[1000],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(25.0),
        child: AppBar(
          elevation: 5,
          backgroundColor: Colors.black,
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Card(
                color: Colors.grey[800],
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(5,10,5,15),
                  child: Text(
                    userInput,
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        letterSpacing: 2
                    ),
                  ),
                )
            ),
            Card(
              color: Colors.grey[800],
              child: Padding(
                padding: const EdgeInsets.fromLTRB(5,30,5,50),
                child: Text(
                  output,
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                      fontSize: 50,
                      color: Colors.white,
                      letterSpacing: 2
                  ),
                ),
              ),
            ),
          ],
        ),
            Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
                  children: buttonList[0].map<Widget>((button) => calculatorButton(button)).toList(),
                ),
                const SizedBox(height:10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
                  children: buttonList[1].map<Widget>((button) => calculatorButton(button)).toList(),
                ),
                const SizedBox(height:10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
                  children: buttonList[2].map<Widget>((button) => calculatorButton(button)).toList(),
                ),
                const SizedBox(height:10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
                  children: buttonList[3].map<Widget>((button) => calculatorButton(button)).toList(),
                ),
                const SizedBox(height:10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
                  children: buttonList[4].map<Widget>((button) => calculatorButton(button)).toList(),
                ),
                const SizedBox(height:15),
              ]
            )
          ],
        ),
      ),
    );
  }
}
