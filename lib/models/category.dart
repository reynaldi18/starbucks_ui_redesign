class Category {
  final int id;
  final String title;
  bool isSelected;

  Category({
    required this.id,
    required this.title,
    this.isSelected = false,
  });
}

final categories = [
  Category(
    id: 1,
    title: 'All',
    isSelected: true,
  ),
  Category(
    id: 2,
    title: 'Coffee',
  ),
  Category(
    id: 3,
    title: 'Tea',
  ),
  Category(
    id: 4,
    title: 'Drink',
  ),
  Category(
    id: 5,
    title: 'Food',
  ),
];
