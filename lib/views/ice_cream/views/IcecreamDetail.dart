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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Card(
                        elevation: 0.0,
                        color: Colors.transparent,
                        child: Hero(
                          tag: icecream.image,
                          child: CircleAvatar(
                            radius: 100,
                            backgroundImage: CachedNetworkImageProvider(
                                icecream.image,
                                cacheKey: icecream.image),
                          ),
                        )),
                    const SizedBox(width: 10),
                    Text("\$ ${icecream.price.toString()}",
                        style: const TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(icecream.description),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Toppings",
                      style: Theme.of(context).textTheme.displaySmall),
                ),
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
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Ingredients",
                      style: Theme.of(context).textTheme.displaySmall),
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  height: 200,
                  child: ListView.builder(
                    itemBuilder: (context, iteration) {
                      final ingredient = icecream.ingredients[iteration];
                      return Card(
                          child: ListTile(
                        title: Text(ingredient.name),
                        subtitle: Text("QTY. ${ingredient.quantity}"),
                      ));
                    },
                    itemCount: icecream.ingredients.length,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
