import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  Button({Key? key,required this.label,required this.onPress}) : super(key: key);
  final String label;
  var onPress;
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color(0xffcc2b5e),
                Color(0xff753a88).withOpacity(0.8),
              ]
          ),
      ),
      child: Container(
        width: 80,
        height: 70,
        child: ElevatedButton(
            onPressed: (){onPress();},
            child: Text(label),
            style: ElevatedButton.styleFrom(
              primary: Colors.transparent,
              textStyle: TextStyle(fontSize: 38),
              shadowColor: Colors.transparent,
            ),
          ),
      ),
    );
  }
}
