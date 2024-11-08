import 'dart:math';

import 'package:calculator/calculator_button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  var userQuestion = '';
  var userResult = '0';
  final List<String> buttons = [
    'C',
    'DEL',
    '/',
    'x',
    '7',
    '8',
    '9',
    '-',
    '4',
    '5',
    '6',
    '+',
    '1',
    '2',
    '3',
    '=',
    '0',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 198, 231, 255),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(height: 50),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.all(20),
                    child: Text(
                      userQuestion,
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.all(20),
                    child: Text(
                      userResult,
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: buttons.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4),
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Buttons(
                    buttonTap: () {
                      setState(() {
                        userQuestion = '';
                        userResult = '0';
                      });
                    },
                    buttonText: buttons[index],
                    buttonColor: const Color.fromARGB(255, 255, 138, 138),
                    textColor: Colors.black,
                  );
                } else if (index == 1) {
                  return Buttons(
                    buttonTap: () {
                      setState(() {
                        userQuestion =
                            userQuestion.substring(0, userQuestion.length - 1);
                      });
                    },
                    buttonText: buttons[index],
                    buttonColor: const Color.fromARGB(255, 255, 221, 174),
                    textColor: Colors.black,
                  );
                } else if (index == 15) {
                  return Buttons(
                    buttonTap: () {
                      setState(() {
                        equal();
                      });
                    },
                    buttonText: buttons[index],
                    buttonColor: const Color.fromARGB(255, 172, 224, 124),
                    textColor: Colors.black,
                  );
                } else {
                  var random = Random();
                  int red = 150 + random.nextInt(106);
                  int green = 150 + random.nextInt(106);
                  int blue = 150 + random.nextInt(106);
                  return Buttons(
                    buttonTap: () {
                      setState(() {
                        userQuestion += buttons[index];
                      });
                    },
                    buttonText: buttons[index],
                    buttonColor: isOperator(buttons[index])
                        ? Color.fromARGB(255, red, green, blue)
                        : const Color.fromARGB(255, 212, 246, 255),
                    textColor: Colors.black,
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }

  void equal() {
    String finalQuestion = userQuestion;
    finalQuestion = finalQuestion.replaceAll('x', '*');

    Parser p = new Parser();
    Expression exp = p.parse(finalQuestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    int hasilEval = eval.toInt();

    userResult = hasilEval.toString();
  }

  bool isOperator(String x) {
    if (x == 'x' || x == '-' || x == '+' || x == '/') {
      return true;
    } else {
      return false;
    }
  }
}
