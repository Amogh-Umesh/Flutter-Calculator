import 'buttons/buttons.dart';
import 'package:stack/stack.dart';

String evaluateExpression(String expression) {
  Stack<double> stack = Stack();
  stack.push(0);
  String output = '';
  String number = '';
  double a, b;
  String postFix = getPostfix(expression);

  for (int i = 0; i < postFix.length; i++) {
    if (isOperand(postFix[i])) {
      number += postFix[i];
    } else if (postFix[i] == ' ') {
      if (number != '') {
        try {
          stack.push(double.parse(number));
          number = '';
        } on FormatException {
          print("Format Exception Raised: Evaluate Expression");
        }
      }
    } else {
      if (number != '') {
        try {
          stack.push(double.parse(number));
          number = '';
        } on FormatException {
          print("Format Exception Raised: Evaluate Expression");
        }
      }
      switch (postFix[i]) {
        case '%':
          {
            b = stack.pop();
            a = stack.pop();
            stack.push(a % b);
          }
          break;

        case '/':
          {
            b = stack.pop();
            a = stack.pop();
            stack.push(a / b);
          }
          break;

        case '*':
          {
            b = stack.pop();
            a = stack.pop();
            stack.push(a * b);
          }
          break;

        case '+':
          {
            b = stack.pop();
            a = stack.pop();
            stack.push(a + b);
          }
          break;

        case '-':
          {
            b = stack.pop();
            a = stack.pop();
            stack.push(a - b);
          }
          break;
      }
    }
  }
  if (number != '') {
    try {
      stack.push(double.parse(number));
      number = '';
    } on FormatException {
      print("Format Exception Raised: Evaluate Expression");
    }
  }
  try {
    double ans = stack.pop();
    if (isInteger(ans)) {
      output = ans.round().toString();
    } else {
      output = ans.toString();
    }
  } on FormatException {
    return '';
  }
  return output;
}

bool isOperand(String char) {
  try {
    int.parse(char);
  } on FormatException {
    if (char == '.') {
      return true;
    } else {
      return false;
    }
  }
  return true;
}

String getPostfix(String expression) {
  Stack<String> stack = Stack();
  String postFix = '';
  for (int i = 0; i < expression.length; i++) {
    if (isOperand(expression[i])) {
      postFix += expression[i];
    } else {
      if (expression[i] == '(') {
        stack.push(expression[i]);
      } else if (expression[i] == ')') {
        while (stack.top() != '(') {
          postFix += stack.pop();
        }
        stack.pop();
      } else if (isOperand(expression[i]) == false) {
        while (
            stack.isNotEmpty && precedenceCheck(stack.top(), expression[i])) {
          postFix += stack.pop();
        }
        postFix += ' ';
        stack.push(expression[i]);
      }
    }
  }
  while (stack.isNotEmpty) {
    postFix += stack.pop();
  }
  return postFix;
}

bool precedenceCheck(String a, String b) {
  if (a == '(') {
    return false;
  } else if (a == '%') {
    return true;
  } else if (b == '%') {
    return false;
  } else if (a == '/' || a == '*') {
    return true;
  } else if (b == '/' || b == '*') {
    return false;
  } else {
    return true;
  }
}

int checkBrackets(String userInput) {
  int count = 0;
  for (int i = 0; i < userInput.length; i++) {
    if (userInput[i] == '(') {
      count--;
    } else if (userInput[i] == ')') {
      count++;
    }
  }
  return count;
}

bool isInteger(num value) => value is int || value == value.roundToDouble();

String checkInput(Buttons button, String userInput) {
  String value = button.value;
  if (userInput.length > 84) {
    return userInput;
  } else if (value == '()') {
    if (userInput == '') {
      userInput = userInput + '(';
    } else if (userInput[userInput.length - 1] == '(') {
      userInput = userInput + '(';
    } else if (userInput[userInput.length - 1] == ')') {
      if (checkBrackets(userInput) < 0) {
        userInput = userInput + ')';
      }
    } else {
      try {
        int.parse(userInput[userInput.length - 1]);
      } on FormatException {
        return userInput + '(';
      }
      if (checkBrackets(userInput) < 0) {
        userInput = userInput + ')';
      }
    }
  } else if (value == 'C') {
    userInput = '';
  } else {
    userInput = userInput + value;
  }
  return userInput;
}

List<dynamic> mainLogic(Buttons button, String userInput, String output){
  if(button.value == '=' || button.value == '+/-'){
    if(button.value == '='){
      output = evaluateExpression(userInput);
    }else{
      try {
        double a = double.parse(userInput);
        a = 0-a;
        if(isInteger(a)){
          int b = a.round();
          output = b.toString();
        }else{
          output = a.toString();
        }
      } on FormatException {
        output = '';
        return [userInput, ''];
      }
      userInput = '';

    }
  }
  else{
    if(output != '' && button.operand == false){
      userInput = output;
      output = '';
    }else{
      output = '';
    }
    userInput = checkInput(button, userInput);
  }
  return [userInput, output];
}