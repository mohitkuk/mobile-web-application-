import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CalculatorPage(),
    );
  }
}

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String _output = '0';
  String _currentInput = '';
  double _num1 = 0.0;
  double _num2 = 0.0;
  String _operator = '';
  bool _isOperatorClicked = false;

  void _handleButtonClick(String buttonText) {
    if (buttonText == 'C') {
      _clear();
    } else if (buttonText == '=') {
      _calculate();
    } else if (buttonText == '+' ||
        buttonText == '-' ||
        buttonText == '*' ||
        buttonText == '/') {
      _handleOperator(buttonText);
    } else {
      _handleDigit(buttonText);
    }
  }

  void _handleDigit(String digit) {
    if (_isOperatorClicked) {
      setState(() {
        _currentInput = digit;
        _isOperatorClicked = false;
      });
    } else {
      setState(() {
        _currentInput =
        _currentInput == '0' ? digit : _currentInput + digit;
      });
    }
  }

  void _handleOperator(String operator) {
    if (_currentInput.isNotEmpty) {
      setState(() {
        _num1 = double.parse(_currentInput);
        _operator = operator;
        _isOperatorClicked = true;
      });
    }
  }

  void _calculate() {
    if (_currentInput.isNotEmpty && _operator.isNotEmpty) {
      setState(() {
        _num2 = double.parse(_currentInput);
        switch (_operator) {
          case '+':
            _output = (_num1 + _num2).toString();
            break;
          case '-':
            _output = (_num1 - _num2).toString();
            break;
          case '*':
            _output = (_num1 * _num2).toString();
            break;
          case '/':
            if (_num2 != 0) {
              _output = (_num1 / _num2).toString();
            } else {
              _output = 'Error';
            }
            break;
        }
        _currentInput = '';
        _operator = '';
        _num1 = double.parse(_output);
      });
    }
  }

  void _clear() {
    setState(() {
      _output = '0';
      _currentInput = '';
      _operator = '';
      _num1 = 0.0;
      _num2 = 0.0;
      _isOperatorClicked = false;
    });
  }

  Widget _buildButton(String buttonText) {
    return Expanded(
        child: Padding(
        padding: const EdgeInsets.all(8.0),
    child: ElevatedButton(
    onPressed: () {
    _handleButtonClick(buttonText);
    },
    child: Text(
    buttonText,
    style: TextStyle(fontSize: 32), // Adjust font size
    ),
    style: ElevatedButton.styleFrom(
    primary: Colors.white, // Change button color
      onPrimary: Colors.black,
      padding: EdgeInsets.all(24), // Increase button size
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30), // Round button edges
        side: BorderSide(
          color: Colors.grey[300]!, // Add border to buttons
          width: 1,
        ),
      ),
    ),
    ),
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Calculator'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16.0),
              alignment: Alignment.centerRight,
              child: Text(
                _currentInput.isEmpty ? _output : _currentInput,
                style: TextStyle(
                  fontSize: 48, // Increase font size
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      _buildButton('7'),
                      _buildButton('8'),
                      _buildButton('9'),
                      _buildButton('/'),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      _buildButton('4'),
                      _buildButton('5'),
                      _buildButton('6'),
                      _buildButton('*'),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      _buildButton('1'),
                      _buildButton('2'),
                      _buildButton('3'),
                      _buildButton('-'),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      _buildButton('0'),
                      _buildButton('C'),
                      _buildButton('='),
                      _buildButton('+'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
