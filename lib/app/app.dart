import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/HomeView.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyWidge());
}

class MyWidge extends StatelessWidget {
  const MyWidge({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.red,
          fontFamily: GoogleFonts.notoSansOsmanya().fontFamily
        ),
        title: "hello world", 
        home: HomeView(),
    );
  }
}
