import 'package:equatable/equatable.dart';

class Recipe extends Equatable {
  final String title;
  final String imageUrl;
  final String time;
  final String calories;
  final String category;

  const Recipe({
    required this.title,
    required this.imageUrl,
    required this.time,
    required this.calories,
    required this.category,
  });

  @override
  List<Object> get props => [title, imageUrl, time, calories, category];
}
