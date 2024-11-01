import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/calcView.dart';

void main(){
  runApp(const HomeView());
}

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      body: SafeArea(
        bottom: false,
        child: Container(
          color: Colors.deepOrange,
          child: const CalcView()
        )
      )
        
      );
  }
}