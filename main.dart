import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Area Calcular',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Area Calculadora'),
        ),
        body: AreaCalculator(),
      ),
    );
  }
}

class AreaCalculator extends StatefulWidget {
  @override
  _AreaCalculatorState createState() => _AreaCalculatorState();
}

class _AreaCalculatorState extends State<AreaCalculator> {
  String result = '0';
  double width = 0;
  double height = 0;

  final TextEditingController widthController = TextEditingController();
  final TextEditingController heightController = TextEditingController();

  @override
  void initState() {
    super.initState();
    result = '0';
    var currentShape = 'Triangulo';
    widthController.addListener(updateWidth);
    heightController.addListener(updateHeight);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15.0),
      child: Column(
        children: <Widget>[
          // Remove the DropdownButton widget
          AreaTextField(widthController, 'Base'),
          AreaTextField(heightController, 'Altura'),
          Container(
            margin: EdgeInsets.all(15.0),
            child: ElevatedButton(
              child: Text('Calcular', style: TextStyle(fontSize: 18.0)),
              onPressed: calculaArea,
            ),
          ),
          Text(
            result,
            style: TextStyle(
              fontSize: 24.0,
              color: Color.fromARGB(255, 64, 191, 198),
            ),
          ),
        ],
      ),
    );
  }

  void calculaArea() {
    double area;

    var currentShape;
    'Triangulo';
    {
      area = width * height / 2;
    }
    ;

    setState(() {
      result = 'A area é $area';
    });
  }

  void updateWidth() {
    setState(() {
      if (widthController.text != '') {
        width = double.parse(widthController.text);
      } else {
        width = 0;
      }
    });
  }

  void updateHeight() {
    setState(() {
      if (heightController.text != '') {
        height = double.parse(heightController.text);
      } else {
        height = 0;
      }
    });
  }
}

class AreaTextField extends StatelessWidget {
  AreaTextField(this.controller, this.hint);

  final TextEditingController controller;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        style: TextStyle(
          color: Color.fromARGB(255, 101, 109, 109),
          fontWeight: FontWeight.w300,
          fontSize: 24.0,
        ),
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.border_all),
          filled: true,
          fillColor: Color.fromARGB(255, 149, 236, 229),
          hintText: hint,
        ),
      ),
    );
  }
}
