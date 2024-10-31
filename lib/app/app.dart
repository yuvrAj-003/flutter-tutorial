import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/homeView.dart';

void main() {
  runApp(const MyWidge());
}

class MyWidge extends StatelessWidget {
  const MyWidge({
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
