import 'dart:convert';

class Restaurant {
  final String author;
  final String title;
  final String description;
  final String urlImage;
  final String publishDate;
  final String content;

  Restaurant({
    required this.author,
    required this.title,
    required this.description,
    required this.urlImage,
    required this.publishDate,
    required this.content,
  });

  factory Restaurant.fromJson(Map<String, dynamic> restaurant) => Restaurant(
      author: restaurant['author'],
      title: restaurant['title'],
      description: restaurant['description'],
      urlImage: restaurant['urlImage'],
      publishDate: restaurant['publishDate'],
      content: restaurant['content']);
}

List<Restaurant> parseRestaurant(String? json) {
  if (json == null) {
    return [];
  }
  final List parse = jsonDecode(json);
  return parse.map((json) => Restaurant.fromJson(json)).toList();
}
