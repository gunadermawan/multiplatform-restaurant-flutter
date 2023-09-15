import 'dart:convert';

class Restaurant {
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;

  Restaurant({
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory Restaurant.fromJson(Map<String, dynamic> restaurant) => Restaurant(
      author: restaurant['author'],
      title: restaurant['title'],
      description: restaurant['description'],
      url: restaurant['url'],
      urlToImage: restaurant['urlToImage'],
      publishedAt: restaurant['publishedAt'],
      content: restaurant['content']);
}

List<Restaurant> parseRestaurant(String? json) {
  if (json == null) {
    return [];
  }
  final List parse = jsonDecode(json);
  return parse.map((json) => Restaurant.fromJson(json)).toList();
}
