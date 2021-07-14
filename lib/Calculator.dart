import 'package:calculator/calculator_components/ResultScreen.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'calculator_components/ThemeToggle.dart';
import 'calculator_components/Button.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String result='0';
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(bottom: 20),
              child: Text('Welcome to My fancy Calculator',
              style: TextStyle(fontSize: 30,fontFamily: 'Abel',fontWeight: FontWeight.bold),
              ),
          ),
          ThemeToggle(),
          SizedBox(height: 40,),
          ResultScreen(result: result,),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Button(label: 'C',onPress: (){setState(() {result='0';});}),
              Button(label: '+/-',onPress: (){setState(() {
                if(result.contains('.'))
                  result=(double.parse(result)*-1).toString();
                else
                  result=(int.parse(result)*-1).toString();
              });}),
              Button(label: '%',onPress: (){setState(() {result+='%';});}),
              Button(label: '/',onPress: (){setState(() {result+='/';});}),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Button(label: '7',onPress: (){setState(() {result=='0'?result='7':result+='7';});}),
              Button(label: '8',onPress: (){setState(() {result=='0'?result='8':result+='8';});}),
              Button(label: '9',onPress: (){setState(() {result=='0'?result='9':result+='9';});}),
              Button(label: '*',onPress: (){setState(() {result+='*';});}),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Button(label: '4',onPress: (){setState(() {result=='0'?result='4':result+='4';});}),
              Button(label: '5',onPress: (){setState(() {result=='0'?result='5':result+='5';});}),
              Button(label: '6',onPress: (){setState(() {result=='0'?result='6':result+='6';});}),
              Button(label: '-',onPress: (){setState(() {result+='-';});}),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Button(label: '1',onPress: (){setState(() {result=='0'?result='1':result+='1';});}),
              Button(label: '2',onPress: (){setState(() {result=='0'?result='2':result+='2';});}),
              Button(label: '3',onPress: (){setState(() {result=='0'?result='3':result+='3';});}),
              Button(label: '+',onPress: (){setState(() {result=='0'?result='+':result+='+';});}),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Button(label: '0',onPress: (){setState(() {result=='0'?result='0':result+='0';});}),
              Button(label: '.',onPress: (){setState(() {result+='.';});}),
              Button(label: '⬅',onPress: (){setState(() {
                if(result=='0')
                  result='0';
                else{
                  List<String> newResult = result.split(""); // ['a', 'a', 'a', 'b', 'c', 'd']
                  newResult.removeLast(); // ['a', 'a', 'a', 'b', 'c']
                  result=newResult.join();//aaabc
                }
              });}),
              Button(label: '=',onPress: (){
                setState(() {
                  Parser p = Parser();
                  Expression expression=p.parse(result);
                  ContextModel cm = ContextModel();
                  result=expression.evaluate(EvaluationType.REAL, cm).toString();
                });}),
            ],
          ),
        ],
      ),
    ),
    );
  }
}
