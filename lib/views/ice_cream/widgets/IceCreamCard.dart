import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/ice_cream/models/icecreamModel.dart';

class IceCreamCard extends StatelessWidget {
  const IceCreamCard({
    super.key,
    required this.icecream,
  });

  final Icecream icecream;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      // Hei(),
      child: Card(
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Stack(
          fit: StackFit.expand,
          children: [
            // add images in it
            Hero(
              tag: icecream.image,
              child: CachedNetworkImage(
                cacheKey: icecream.image,
                imageUrl: icecream.image,
                fit: BoxFit.cover,
                // color: Colors.purpleAccent.withOpacity(0.2),
                // colorBlendMode: BlendMode.color,
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.only(topRight: Radius.circular(10))),
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  // ice cream descriptions
                  children: [
                    Text(icecream.flavour,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    Text("\$ ${icecream.price.toString()}",
                        style: Theme.of(context).textTheme.labelLarge)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
