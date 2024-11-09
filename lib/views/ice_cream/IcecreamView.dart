import 'dart:convert';
// import 'dart:js_interop';

// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/views/ice_cream/models/icecreamModel.dart';

class Icecreamview extends StatelessWidget{
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
          const SizedBox(height: 20),
          Expanded(child: Center(
            child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // future builder to render future objects
                  FutureBuilder(
                    future: iceCreamsLoad(), 
                    builder: (context, snapshot) {
                      final icecreams = snapshot.data;
                      if(snapshot.connectionState == ConnectionState.done){
                        // sized box
                        return SizedBox(
                          width: MediaQuery.sizeOf(context).width,
                          height: MediaQuery.sizeOf(context).height / 3,
                          // for rendering lists
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemBuilder: (context,index) {
                              final icecream = icecreams[index];
                              return SizedBox(
                                width: 200,
                                child: Card(
                                  clipBehavior: Clip.hardEdge,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: Stack(
                                    fit: StackFit.expand,
                                    children: [
                                      // add images in it
                                      Image.network(
                                        icecream.image, 
                                        fit: BoxFit.cover,
                                        color: Colors.purpleAccent.withOpacity(0.2),
                                        colorBlendMode: BlendMode.color,
                                      ),
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            // ice cream descriptions
                                            children: [
                                              Text(
                                                icecream.flavour,
                                                style: Theme.of(context).textTheme.labelLarge
                                              ),
                                              Text(
                                                "\$ ${icecream.price.toString()}",
                                                style: Theme.of(context).textTheme.labelLarge
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                            itemCount:  icecreams!.length,
                          ),
                        );
                      }
                      else{
                        return const Center(child: CircularProgressIndicator.adaptive());
                      }
                    }
                  )
                ],
              ),
            )
          )
        ],
      ),
    );
  }
}