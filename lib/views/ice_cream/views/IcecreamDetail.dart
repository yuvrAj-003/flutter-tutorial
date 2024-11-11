import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/ice_cream/models/icecreamModel.dart';

class IcecreamDetail extends StatelessWidget {
  const IcecreamDetail({super.key, required this.icecream});

  final Icecream icecream;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(icecream.flavour),
          // elevation: 0.0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Card(
                      elevation: 0.0,
                      color: Colors.transparent,
                      child: CircleAvatar(
                        radius: 100,
                        backgroundImage:
                            CachedNetworkImageProvider(icecream.image),
                      )),
                  const SizedBox(width: 10),
                  Text("\$ ${icecream.price.toString()}",
                      style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      )),
                ],
              ),
              Text("Toppings", style: Theme.of(context).textTheme.displaySmall),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width,
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, iteration) {
                    final topping = icecream.toppings[iteration];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Chip(label: Text(topping)),
                    );
                  },
                  itemCount: icecream.toppings.length,
                ),
              )
            ],
          ),
        ));
  }
}
