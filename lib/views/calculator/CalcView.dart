

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const CalcView());
}
class CalcView extends StatefulWidget{
  const CalcView({
    super.key
  });

  @override
  State<CalcView> createState() => _CalcViewState();
}

class _CalcViewState extends State<CalcView> {
  num x =0;
  num y = 0;
  num z = 0;

  
  final DisplayOneController = TextEditingController();
  final DisplayTwoController = TextEditingController();

  late final AppLifecycleListener _listener;

  // for setting state
  @override
  void initState(){
    super.initState();
    DisplayOneController.text = x.toString();
    DisplayTwoController.text = y.toString();

    // to check state
    _listener = AppLifecycleListener(
      onStateChange: (AppLifecycleState state) => print("current state is ${state.toString().substring(18)}")
    );
  }

  @override
  void dispose() {
    _listener.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        children: [
          // calc display
          DisplayBox(key: const Key("displayOne"), hint: "Enter first number", controller:  DisplayOneController),
          const SizedBox(height: 20),
          DisplayBox(key: const Key("displayTwo"),hint: "Enter second number", controller:  DisplayTwoController),
          const SizedBox(height: 20),
          Text(
            key: const Key("result"),
            z.toString(),
            style: const TextStyle(
              fontSize: 70,
              fontWeight: FontWeight.bold
            )
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // add button
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    z = num.tryParse(DisplayOneController.text)! + num.tryParse(DisplayTwoController.text)!;
                  });
                },
                backgroundColor: Colors.deepOrangeAccent,
                child: const Icon(CupertinoIcons.add)
              ),
              // subtract button
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    z = num.tryParse(DisplayOneController.text)! - num.tryParse(DisplayTwoController.text)!;
                  });
                },
                backgroundColor: Colors.deepOrangeAccent,
                child: const Icon(CupertinoIcons.minus)
              ),
              // multiplication button
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    z = num.tryParse(DisplayOneController.text)! * num.tryParse(DisplayTwoController.text)!;
                  });
                },
                backgroundColor: Colors.deepOrangeAccent,
                child: const Icon(CupertinoIcons.multiply)
              ),
              // divide button
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    z = num.tryParse(DisplayOneController.text)! / num.tryParse(DisplayTwoController.text)!;
                  });
                }
                ,
                backgroundColor: Colors.deepOrangeAccent,
                child: const Icon(CupertinoIcons.divide)
              ),
            ]
          ),
          const SizedBox(height: 20),
          // clear button
          FloatingActionButton.extended(
            onPressed: () {
              setState(() {
                x = 0;
                y = 0;
                z = 0;
                DisplayOneController.clear();
                DisplayTwoController.clear();
              });
            },
            backgroundColor: Colors.deepOrangeAccent,
            label: const Text("clear"),
          )
        ],
      ),
    );
  }
}

class DisplayBox extends StatelessWidget {
  const DisplayBox({
    super.key,
    this.hint = "Enter a number: ",
    required this.controller
  });

  final String? hint;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
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