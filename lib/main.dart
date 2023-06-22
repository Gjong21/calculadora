import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: CalculadoraScreen(),
    );
  }
}


class CalculadoraScreen extends StatefulWidget {
  @override
  _CalculadoraScreenState createState() => _CalculadoraScreenState();
}

class _CalculadoraScreenState extends State<CalculadoraScreen> {
  String displayText = '';
  double num1 = 0.0;
  double num2 = 0.0;
  String operator = '';

  void _onButtonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'C') {
        displayText = '';
        num1 = 0.0;
        num2 = 0.0;
        operator = '';
      } else if (buttonText == '+' || buttonText == '-' || buttonText == '*' || buttonText == '/') {
        num1 = double.parse(displayText);
        operator = buttonText;
        displayText = '';
      } else if (buttonText == '=') {
        num2 = double.parse(displayText);
        if (operator == '+') {
          displayText = (num1 + num2).toString();
        } else if (operator == '-') {
          displayText = (num1 - num2).toString();
        } else if (operator == '*') {
          displayText = (num1 * num2).toString();
        } else if (operator == '/') {
          displayText = (num1 / num2).toString();
        }
      } else {
        displayText += buttonText;
      }
    });
  }

  Widget _buildButton(String buttonText, Color buttonColor) {
    return Container(
      height: 90,
      width: 90,

      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50)
          ),
          backgroundColor: buttonColor,
          foregroundColor: Colors.white,
        ),
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 40.0),
        ),
        onPressed: () => _onButtonPressed(buttonText),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      body: Column(
        children: [
          Container(
            height: 330,
            alignment: Alignment.bottomRight,
            padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
            child: Text(
              displayText,
              style: TextStyle(fontSize: 90.0,color: Colors.white,fontWeight: FontWeight.w300),
            ),
          ),
          Container(
            height: 450,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildButton('7', Colors.grey.shade800),
                    _buildButton('8', Colors.grey.shade800),
                    _buildButton('9', Colors.grey.shade800),
                    _buildButton('/', Colors.orange),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildButton('4', Colors.grey.shade800),
                    _buildButton('5', Colors.grey.shade800),
                    _buildButton('6', Colors.grey.shade800),
                    _buildButton('*', Colors.orange),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildButton('1', Colors.grey.shade800),
                    _buildButton('2', Colors.grey.shade800),
                    _buildButton('3', Colors.grey.shade800),
                    _buildButton('-', Colors.orange.shade800),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildButton('C', Colors.red),
                    _buildButton('0', Colors.grey.shade800),
                    _buildButton('=', Colors.orange),
                    _buildButton('+', Colors.orange),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
