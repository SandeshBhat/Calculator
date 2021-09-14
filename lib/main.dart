import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Basic Calculator',
      theme: new ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: new MyHomePage(title: 'Basic Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String output = "0";
  String temp = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";
  String displayNum1 = "0";
  String displayNum2 = "0";
  String displayOpp = "";

  numberPressed(String buttonText) {
    if (buttonText == "ALL CLEAR") {
      temp = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
      displayNum1 = "0.0";
      displayNum2 = "0.0";
      displayOpp = "";
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "/" ||
        buttonText == "X") {
      num1 = double.parse(output);
      operand = buttonText;
      displayNum1 = double.parse(output).toStringAsFixed(2);
      displayOpp = operand;
      temp = "0";
    } else if (buttonText == ".") {
      if (temp.contains(".")) {
        return;
      } else {
        temp = temp + buttonText;
      }
    } else if (buttonText == "=") {
      num2 = double.parse(output);
      displayNum2 = double.parse(output).toStringAsFixed(2);

      if (operand == "+") {
        temp = (num1 + num2).toString();
      }
      if (operand == "-") {
        temp = (num1 - num2).toString();
      }
      if (operand == "X") {
        temp = (num1 * num2).toString();
      }
      if (operand == "/") {
        temp = (num1 / num2).toString();
      }

      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else {
      temp = temp + buttonText;
    }

    print(temp);

    setState(() {
      output = double.parse(temp).toStringAsFixed(2);
    });
  }

  Widget calcButton(String value) {
    return new Expanded(
      child: new MaterialButton(
        padding: new EdgeInsets.all(24.0),
        child: new Text(
          value,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: () => numberPressed(value),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double height = size.height;
    return new Scaffold(
        appBar: new AppBar(
          centerTitle: true,
          title: new Text(widget.title),
        ),
        body: new Container(
            child: new Column(
          children: <Widget>[
            new Container(
              height: height * .1,
              alignment: Alignment.bottomRight,
              child: new Text(
                "$displayNum1 $displayOpp $displayNum2 ",
                style: new TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ),
            new Divider(),
            new Container(
              height: height * .15,
              alignment: Alignment.bottomRight,
              child: new Text(
                output,
                style: new TextStyle(
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            new Divider(),
            new Column(children: [
              new Row(children: [
                calcButton("7"),
                calcButton("8"),
                calcButton("9"),
                calcButton("/")
              ]),
              new Row(children: [
                calcButton("4"),
                calcButton("5"),
                calcButton("6"),
                calcButton("X")
              ]),
              new Row(children: [
                calcButton("1"),
                calcButton("2"),
                calcButton("3"),
                calcButton("-")
              ]),
              new Row(children: [
                calcButton("."),
                calcButton("0"),
                calcButton("="),
                calcButton("+")
              ]),
              new Row(children: [
                calcButton("ALL CLEAR"),
              ])
            ])
          ],
        )));
  }
}
