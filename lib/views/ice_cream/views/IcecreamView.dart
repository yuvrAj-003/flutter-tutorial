import 'dart:convert';
// import 'dart:js_interop';

// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/views/ice_cream/models/icecreamModel.dart';
import 'package:flutter_application_1/views/ice_cream/views/IcecreamDetail.dart';
import 'package:flutter_application_1/views/ice_cream/widgets/IceCreamCard.dart';

class Icecreamview extends StatelessWidget {
  const Icecreamview({super.key});

  Future<List<Icecream>> iceCreamsLoad() async {
    final rawIcecreams = await rootBundle.loadString("assets/icecream.json");
    final decodedIceCreams = jsonDecode(rawIcecreams);
    final getIceCreams = IceCreamModel.fromJson(decodedIceCreams);
    await Future.delayed(const Duration(seconds: 1));
    return getIceCreams.icecreams; // Return the list of ice creams
  }

  @override
  Widget build(BuildContext context) {
    // late dynamic selectedIceCream;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Ice creams", style: Theme.of(context).textTheme.displayMedium),
          Text("Get your ice creams",
              style: Theme.of(context).textTheme.bodyMedium),
          const SizedBox(height: 20),
          Expanded(
              child: Center(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // future builder to render future objects
                FutureBuilder(
                    future: iceCreamsLoad(),
                    builder: (context, snapshot) {
                      final icecreams = snapshot.data;
                      // selectedIceCream = icecreams?[0];
                      if (snapshot.connectionState == ConnectionState.done) {
                        // sized box
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width,
                              height: MediaQuery.sizeOf(context).height / 1.25,
                              // for rendering lists
                              child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                // shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  final icecream = icecreams[index];
                                  // selectedIceCream = icecreams[index];
                                  return InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    IcecreamDetail(
                                                        icecream: icecream)));
                                      },
                                      child: IceCreamCard(icecream: icecream));
                                },
                                itemCount: icecreams!.length,
                              ),
                            ),
                          ],
                        );
                      } else {
                        return const Center(
                            child: CircularProgressIndicator.adaptive());
                      }
                    })
              ],
            ),
          ))
        ],
      ),
    );
  }
}
