# Calculator App

A simple and elegant calculator application built using Flutter. This app provides basic arithmetic operations with a clean user interface.

## Features

- Basic arithmetic operations: addition, subtraction, multiplication, and division.
- Percentage calculation.
- Clear (AC) and backspace (⌫) functionality.
- Easy-to-use button layout.
- Displays results in real-time with proper formatting to remove trailing zeros.

## Screenshots

![Calculator Screenshot](screenshot.png)

## Getting Started

### Prerequisites

- Flutter SDK: [Install Flutter](https://flutter.dev/docs/get-started/install)

### Installation

1. Clone the repository:

```sh
git clone https://github.com/yourusername/calculator_app.git
cd calculator_app
Install the dependencies:
flutter pub get
flutter run
Usage
Basic Operations
Addition: Press the + button.
Subtraction: Press the - button.
Multiplication: Press the × button.
Division: Press the ÷ button.
Percentage: Press the % button to get the percentage value of the current equation.
Clear: Press the AC button to clear the equation and result.
Backspace: Press the ⌫ button to delete the last character in the equation.
Equals: Press the = button to evaluate the equation.
Code Overview
Main Code
The main code of the app is located in lib/main.dart. It contains the following:

CalculateApp: The main stateful widget of the app.
buttonPressed: Handles the button press events and updates the state accordingly.
formatResult: Formats the result to remove trailing zeros for better readability.
calcButton: A helper widget to create calculator buttons.
Dependencies
The app uses the math_expressions package to parse and evaluate mathematical expressions. This package simplifies the process of handling complex mathematical calculations.

Installing math_expressions package
To use the math_expressions package, add it to your pubspec.yaml file:
dependencies:
  flutter:
    sdk: flutter
  math_expressions: ^2.0.1
flutter pub get
Using math_expressions
The math_expressions package is used to parse and evaluate mathematical expressions in the buttonPressed method when the equals button is pressed. Here is a brief overview of how it is used:
import 'package:math_expressions/math_expressions.dart';

void buttonPressed(String buttonText) {
  // ... other code ...

  if (buttonText == '=') {
    expression = equation;
    expression = expression.replaceAll('×', '*');
    expression = expression.replaceAll('÷', '/');

    try {
      Parser p = Parser();
      Expression exp = p.parse(expression);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);
      result = formatResult(eval);
    } catch (e) {
      result = 'Error';
    }
  }

  // ... code ...
}

Contributing
Contributions are welcome! Please open an issue or submit a pull request if you have any improvements or bug fixes.

License
This project is licensed under the MIT License - see the LICENSE file for details.

This README file includes sections for features, screenshots (you'll need to add your own screenshot), getting started instructions, usage information, code overview, dependencies, and contribution guidelines. Adjust the content as needed based on your project specifics and repository setup.
```
