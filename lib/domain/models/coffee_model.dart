class CoffeeModel {
  final String name;
  final String subtitle;
  final double price;
  final double rating;
  final String imagePath;

  CoffeeModel({
    required this.name,
    required this.subtitle,
    required this.price,
    required this.rating,
    required this.imagePath,
  });

  // JSON uchun
  factory CoffeeModel.fromJson(Map<String, dynamic> json) {
    return CoffeeModel(
      name: json['name'],
      subtitle: json['subtitle'],
      price: json['price'],
      rating: json['rating'],
      imagePath: json['imagePath'],
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'subtitle': subtitle,
        'price': price,
        'rating': rating,
        'imagePath': imagePath,
      };

  // copyWith
  CoffeeModel copyWith({
    String? name,
    String? subtitle,
    double? price,
    double? rating,
    String? imagePath,
  }) {
    return CoffeeModel(
      name: name ?? this.name,
      subtitle: subtitle ?? this.subtitle,
      price: price ?? this.price,
      rating: rating ?? this.rating,
      imagePath: imagePath ?? this.imagePath,
    );
  }
}


final List<CoffeeModel> coffeeList = [
    CoffeeModel(
      name: 'Cappuccino',
      subtitle: 'With Steamed Milk',
      price: 4.20,
      rating: 4.5,
      imagePath: 'assets/coffeeImage/1.png',
    ),
    CoffeeModel(
      name: 'Espresso',
      subtitle: 'Strong and bold flavor',
      price: 3.60,
      rating: 4.7,
      imagePath: 'assets/coffeeImage/1.png',
    ),
    CoffeeModel(
      name: 'Americano',
      subtitle: 'Diluted espresso shot',
      price: 3.10,
      rating: 4.4,
      imagePath: 'assets/coffeeImage/1.png',
    ),
    CoffeeModel(
      name: 'Macchiato',
      subtitle: 'Espresso with milk foam',
      price: 4.00,
      rating: 4.6,
      imagePath: 'assets/coffeeImage/1.png',
    ),
    CoffeeModel(
      name: 'Latte',
      subtitle: 'Mild and creamy texture',
      price: 4.50,
      rating: 4.8,
      imagePath: 'assets/coffeeImage/1.png',
    ),
    CoffeeModel(
      name: 'Mocha',
      subtitle: 'Chocolate flavored coffee',
      price: 4.70,
      rating: 4.9,
      imagePath: 'assets/coffeeImage/1.png',
    ),
    CoffeeModel(
      name: 'Cortado',
      subtitle: 'Equal espresso and milk',
      price: 3.80,
      rating: 4.3,
      imagePath: 'assets/coffeeImage/1.png',
    ),
    CoffeeModel(
      name: 'Affogato',
      subtitle: 'Espresso over ice cream',
      price: 5.20,
      rating: 4.9,
      imagePath: 'assets/coffeeImage/1.png',
    ),
    CoffeeModel(
      name: 'Flat White',
      subtitle: 'Smooth milk and coffee',
      price: 4.10,
      rating: 4.6,
      imagePath: 'assets/coffeeImage/1.png',
    ),
    CoffeeModel(
      name: 'Irish Coffee',
      subtitle: 'With a hint of whiskey',
      price: 5.50,
      rating: 4.7,
      imagePath: 'assets/coffeeImage/1.png',
    ),
  ];