

import 'package:flutter/material.dart';

void main(){
  runApp(const CalcView());
}
class CalcView extends StatelessWidget{
  const CalcView({
    super.key
  });


  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(32.0),
      child: Column(
        children: [
          // calc display
          DisplayBox(hint: "Enter first number"),
          SizedBox(height: 20),
          DisplayBox(hint: "Enter second number"),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}

class DisplayBox extends StatelessWidget {
  const DisplayBox({
    super.key,
    this.hint = "Enter a number: "
  });

  final String? hint;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.number,
      autofocus: true ,
      decoration: InputDecoration(
        // focused border
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black,
            width: 3.0
          ),
          borderRadius: BorderRadius.circular(12)
        ),
        // normal border
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black,
            width: 1.5
          ),
          borderRadius: BorderRadius.circular(10)
        ),
        // text
        labelText: hint,
        labelStyle: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold
        )
      ),
    );
  }
}