import 'package:flutter/material.dart';

class Buttons{
  String value;
  final Color color;
  bool operand;
  Buttons({required this.value, required this.color, required this.operand});

}


List buttonList= [
  [Buttons(value:'C', color: Colors.green, operand: false), Buttons(value:'()', color: Colors.green, operand: false), Buttons(value:'/', color: Colors.green, operand: false), Buttons(value:'*', color: Colors.green, operand: false)],
  [Buttons(value:'+', color: Colors.green, operand: false), Buttons(value:'0', color: Colors.lightBlueAccent, operand: true), Buttons(value:'1', color: Colors.lightBlueAccent, operand: true), Buttons(value:'2', color: Colors.lightBlueAccent, operand: true)],
  [Buttons(value:'-', color: Colors.green, operand: false), Buttons(value:'3', color: Colors.lightBlueAccent, operand: true), Buttons(value:'4', color: Colors.lightBlueAccent, operand: true), Buttons(value:'5', color: Colors.lightBlueAccent, operand: true)],
  [Buttons(value:'%', color: Colors.green, operand: false), Buttons(value:'6', color: Colors.lightBlueAccent, operand: true), Buttons(value:'7', color: Colors.lightBlueAccent, operand: true), Buttons(value:'8', color: Colors.lightBlueAccent, operand: true)],
  [Buttons(value:'=', color: Colors.green, operand: false), Buttons(value:'.', color: Colors.green, operand: true), Buttons(value:'+/-', color: Colors.green, operand: false), Buttons(value:'9', color: Colors.lightBlueAccent, operand: true)]];