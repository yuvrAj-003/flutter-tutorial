import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/homeView.dart';

void main() {
  runApp(const myWidge());
}

class myWidge extends StatelessWidget {
  const myWidge({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: "hello world", 
        home: HomeView(),
    );
  }
}
