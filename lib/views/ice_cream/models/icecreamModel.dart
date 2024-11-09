class IceCreamModel {
  List<Icecream> icecreams;

  IceCreamModel({
    required this.icecreams,
  });

  factory IceCreamModel.fromJson(Map<String, dynamic> json) {
    return IceCreamModel(
      icecreams: List<Icecream>.from(
        json['icecreams'].map((x) => Icecream.fromJson(x)),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'icecreams': icecreams.map((x) => x.toJson()).toList(),
    };
  }
}

class Icecream {
  String flavour;
  String description;
  List<String> toppings;
  double price;
  String image;
  List<Ingredient> ingredients;

  Icecream({
    required this.flavour,
    required this.description,
    required this.toppings,
    required this.price,
    required this.image,
    required this.ingredients,
  });

  factory Icecream.fromJson(Map<String, dynamic> json) {
    return Icecream(
      flavour: json['flavour'],
      description: json['description'],
      toppings: List<String>.from(json['toppings']),
      price: json['price'].toDouble(),
      image: json['image'],
      ingredients: List<Ingredient>.from(
          json['ingredients'].map((x) => Ingredient.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'flavour': flavour,
      'description': description,
      'toppings': toppings,
      'price': price,
      'image': image,
      'ingredients': ingredients.map((x) => x.toJson()).toList(),
    };
  }
}

class Ingredient {
  String name;
  dynamic quantity;

  Ingredient({
    required this.name,
    required this.quantity,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      name: json['name'],
      quantity: json['quantity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'quantity': quantity,
    };
  }
}
