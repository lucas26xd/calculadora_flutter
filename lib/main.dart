import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora Lucas',
      theme: ThemeData(
        primaryColor: Colors.blueGrey,
        brightness: Brightness.dark,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Calc(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Calc extends StatefulWidget {
  @override
  _CalcState createState() => _CalcState();
}

class _CalcState extends State<Calc> {
  String operacao, operator, a, b, resultado;
  int num1, num2;
  bool hasOp;

  @override
  void initState() {
    hasOp = false;
    operacao = operator = a = b = resultado = '';
    num1 = num2 = 0;
  }

  void updateOperacao({int n:0, String op:''}) {
    setState(() {
      if(op != '') {
        hasOp = true;
        operator = op;
      } else if (hasOp) {
        b += n.toString();
        num2 = int.parse(b);
      } else {
        a += n.toString();
        num1 = int.parse(a);
      }
      operacao = a + ' ' + operator + ' ' + b;
    });
  }

  void calcula() {
    setState(() {
      if (operator == '+') {
        resultado = (num1 + num2).toString();
      } else if (operator == '-') {
        resultado = (num1 - num2).toString();
      } else if (operator == '*') {
        resultado = (num1 * num2).toString();
      } else if (operator == '/') {
        resultado = (num1 / num2).toStringAsFixed(6);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🔢 Calculadora 🔢'),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget> [
              SizedBox(height: 20),
              Row(
                children: [Text('Operação: '), SizedBox(width: 50), Text('$operacao', style: TextStyle(fontSize: 20))],
              ),
              SizedBox(height: 10),
              Row(
                children: [Text('Resultado: '), SizedBox(width: 50), Text('$resultado', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24))],
              ),
              SizedBox(height: 20),
              Row(
                children: [ SizedBox(width: 20),
                            OutlineButton(child: Text('1', style: TextStyle(fontSize: 24)), onPressed: () => updateOperacao(n:1)), SizedBox(width: 20),
                            OutlineButton(child: Text('2', style: TextStyle(fontSize: 24)), onPressed: () => updateOperacao(n:2)), SizedBox(width: 20),
                            OutlineButton(child: Text('3', style: TextStyle(fontSize: 24)), onPressed: () => updateOperacao(n:3)), SizedBox(width: 20)],
              ),
              SizedBox(height: 20),
              Row(
                children: [ SizedBox(width: 20),
                            OutlineButton(child: Text('4', style: TextStyle(fontSize: 24)), onPressed: () => updateOperacao(n:4)), SizedBox(width: 20),
                            OutlineButton(child: Text('5', style: TextStyle(fontSize: 24)), onPressed: () => updateOperacao(n:5)), SizedBox(width: 20),
                            OutlineButton(child: Text('6', style: TextStyle(fontSize: 24)), onPressed: () => updateOperacao(n:6)), SizedBox(width: 20)],
              ),
              SizedBox(height: 20),
              Row(
                children: [ SizedBox(width: 20),
                            OutlineButton(child: Text('7', style: TextStyle(fontSize: 24)), onPressed: () => updateOperacao(n:7)), SizedBox(width: 20),
                            OutlineButton(child: Text('8', style: TextStyle(fontSize: 24)), onPressed: () => updateOperacao(n:8)), SizedBox(width: 20),
                            OutlineButton(child: Text('9', style: TextStyle(fontSize: 24)), onPressed: () => updateOperacao(n:9)), SizedBox(width: 20)],
              ),
              SizedBox(height: 20),
              Row(
                children: [ OutlineButton(child: Text('➕'), onPressed: () => updateOperacao(op:'+')),
                            OutlineButton(child: Text('➖'), onPressed: () => updateOperacao(op:'-')),
                            OutlineButton(child: Text('❌'), onPressed: () => updateOperacao(op:'*')),
                            OutlineButton(child: Text('➗'), onPressed: () => updateOperacao(op:'/'))],
              ),
              SizedBox(height: 40),
              Row(
                children: [ SizedBox(width: 20),
                            RaisedButton(child: Text('Calcular', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36)), color: Colors.green, onPressed: calcula),
                            SizedBox(width: 50),
                            RaisedButton(child: Text('Limpar', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)), color: Colors.red, onPressed: () => {setState(() {initState();})})],
              )
            ],
          ),
        )
      )
    );
  }
}
