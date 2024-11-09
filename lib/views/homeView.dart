import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/ice_cream/IcecreamView.dart';
// import 'package:flutter_application_1/views/calculator/calcView.dart';
// import 'package:flutter_application_1/views/ice_cream/IcecreamView.dart';

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
      // backgroundColor: Colors.amber,
      body: SafeArea(
        bottom: false,
        child: Container(
          // color: Colors.amber,
          child: const Icecreamview()
        )
      )
        
      );
  }
}