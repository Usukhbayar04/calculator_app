import 'package:calculator_app/calcButton.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculateApp extends StatefulWidget {
  const CalculateApp({super.key});

  @override
  State<CalculateApp> createState() => _CalculateAppState();
}

class _CalculateAppState extends State<CalculateApp> {
  String equation = '0';
  String result = '0';
  String expression = '';
  double equationFontSize = 38.0;
  double resultFontSize = 48.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Calculator',
          style: TextStyle(fontSize: 28, color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.bottomRight,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            result,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 80,
                            ),
                          ),
                        ),
                        const Icon(
                          Icons.more_vert,
                          color: Colors.orange,
                          size: 40,
                        ),
                        const SizedBox(width: 20),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Text(
                            equation,
                            style: const TextStyle(
                              fontSize: 40,
                              color: Colors.white38,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            buttonPressed('⌫');
                          },
                          icon: const Icon(
                            Icons.backspace_outlined,
                            color: Colors.orange,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                    // const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    calcButton('AC', Colors.white10, () => buttonPressed('AC')),
                    calcButton('%', Colors.white10, () => buttonPressed('%')),
                    calcButton('÷', Colors.white10, () => buttonPressed('÷')),
                    calcButton('×', Colors.white10, () => buttonPressed('×')),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    calcButton('7', Colors.white10, () => buttonPressed('7')),
                    calcButton('8', Colors.white10, () => buttonPressed('8')),
                    calcButton('9', Colors.white10, () => buttonPressed('9')),
                    calcButton('-', Colors.white10, () => buttonPressed('-')),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    calcButton('4', Colors.white10, () => buttonPressed('4')),
                    calcButton('5', Colors.white10, () => buttonPressed('5')),
                    calcButton('6', Colors.white10, () => buttonPressed('6')),
                    calcButton('+', Colors.white10, () => buttonPressed('+')),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            calcButton(
                                '1', Colors.white10, () => buttonPressed('1')),
                            SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.04),
                            calcButton(
                                '2', Colors.white10, () => buttonPressed('2')),
                            SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.04),
                            calcButton(
                                '3', Colors.white10, () => buttonPressed('3')),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            calcButton('+/-', Colors.white10,
                                () => buttonPressed('+/-')),
                            SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.04),
                            calcButton(
                                '0', Colors.white10, () => buttonPressed('0')),
                            SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.04),
                            calcButton(
                                '.', Colors.white10, () => buttonPressed('.')),
                          ],
                        ),
                      ],
                    ),
                    calcButton('=', Colors.orange, () => buttonPressed('=')),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "AC") {
        equation = "0";
        result = "0";
      } else if (buttonText == "⌫") {
        equation = equation.substring(0, equation.length - 1);
        if (equation == "") {
          equation = "0";
        }
      } else if (buttonText == '%') {
        double value = double.parse(equation);
        value = value / 100;
        equation = value.toString();
      } else if (buttonText == "+/-") {
        if (equation[0] != '-') {
          equation = '-$equation';
        } else {
          equation = equation.substring(1);
        }
      } else if (buttonText == "=") {
        expression = equation;
        expression = expression.replaceAll('×', '*');
        expression = expression.replaceAll('÷', '/');
        expression = expression.replaceAll('%', '%');

        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);
          ContextModel cm = ContextModel();
          double eval = exp.evaluate(EvaluationType.REAL, cm);

          result = formatResult(eval);
        } catch (e) {
          result = "Error";
        }
      } else {
        if (equation == "0") {
          equation = buttonText;
        } else {
          equation = equation + buttonText;
        }
      }
    });
  }

  String formatResult(double value) {
    if (value == value.toInt()) {
      return value.toInt().toString();
    } else {
      return value.toString();
    }
  }
}
