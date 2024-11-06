import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Icecreamview extends StatefulWidget {
  const Icecreamview({super.key});

  @override
  State<Icecreamview> createState() => _IcecreamviewState();
}

Map<String,dynamic>? decodedIceCreams;
class _IcecreamviewState extends State<Icecreamview> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    iceCreamsLoad();
  }


  Future<void> iceCreamsLoad() async {
    final rawIcecreams = await rootBundle.loadString("assets/icecream.json");
    decodedIceCreams = jsonDecode(rawIcecreams);
    await Future.delayed(const Duration(seconds: 1));
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "ice cream view",
            style: Theme.of(context).textTheme.displayMedium
          ),
          Text(
            "ice cream view",
            style: Theme.of(context).textTheme.bodyMedium
          ),
          if(decodedIceCreams != null) const Text("loaded")
          else const Center(child: CircularProgressIndicator.adaptive())
        ],
      ),
    );
  }
}