import 'dart:ui';

class Product {
  final int id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  final Color color;
  final double rate;
  final List<Type> type;
  bool isFavorite;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.color,
    required this.rate,
    required this.type,
    this.isFavorite = false,
  });
}

class Type {
  final int id;
  final String type;
  final String imageUrl;
  final double priceAdd;
  bool isSelected;

  Type({
    required this.id,
    required this.type,
    required this.imageUrl,
    required this.priceAdd,
    this.isSelected = false,
  });
}

final products = [
  Product(
    id: 1,
    title: 'Chocolate Frappuccino',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam at mi vitae augue feugiat scelerisque in a eros.',
    price: 20.0,
    color: const Color(0xFFF3F1ED),
    rate: 4.5,
    imageUrl: 'assets/images/chocolate.png',
    type: [
      Type(
        id: 1,
        type: 'Small',
        imageUrl: 'assets/images/type_small.png',
        priceAdd: 0.0,
        isSelected: true,
      ),
      Type(
        id: 2,
        type: 'Medium',
        priceAdd: 2.0,
        imageUrl: 'assets/images/type_regular.png',
      ),
      Type(
        id: 3,
        type: 'Large',
        priceAdd: 4.0,
        imageUrl: 'assets/images/type_large.png',
      ),
    ],
  ),
  Product(
    id: 2,
    title: 'Tea Frappuccino',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam at mi vitae augue feugiat scelerisque in a eros.',
    price: 30.0,
    color: const Color(0xFFF5F9E0),
    rate: 4.6,
    imageUrl: 'assets/images/tea.png',
    type: [
      Type(
        id: 2,
        type: 'Medium',
        imageUrl: 'assets/images/type_regular.png',
        priceAdd: 0.0,
        isSelected: true,
      ),
      Type(
        id: 3,
        type: 'Large',
        imageUrl: 'assets/images/type_large.png',
        priceAdd: 2.0,
      ),
    ],
  ),
  Product(
    id: 3,
    title: 'Strawberry Frappuccino',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam at mi vitae augue feugiat scelerisque in a eros.',
    price: 35.0,
    color: const Color(0xFFFAE4E6),
    rate: 4.4,
    imageUrl: 'assets/images/strawberry.png',
    type: [
      Type(
        id: 2,
        type: 'Medium',
        imageUrl: 'assets/images/type_regular.png',
        priceAdd: 0.0,
        isSelected: true,
      ),
    ],
  ),
];
