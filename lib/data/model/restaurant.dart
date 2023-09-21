import 'dart:convert';

class Restaurant {
  final String id;
  final String name;
  final String description;
  final String pictureId;
  final String city;
  final double rating;
  final Menus menus;

  Restaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
    required this.menus,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      pictureId: json['pictureId'],
      city: json['city'],
      rating: json['rating'].toDouble(),
      menus: Menus.fromJson(json['menus']),
    );
  }
}

class Menus {
  final List<MenuItem> foods;
  final List<MenuItem> drinks;

  Menus({
    required this.foods,
    required this.drinks,
  });

  factory Menus.fromJson(Map<String, dynamic> json) {
    final foodList = json['foods'] as List;
    final drinkList = json['drinks'] as List;

    final foods = foodList.map((food) => MenuItem.fromJson(food)).toList();
    final drinks = drinkList.map((drink) => MenuItem.fromJson(drink)).toList();

    return Menus(
      foods: foods,
      drinks: drinks,
    );
  }
}

class MenuItem {
  final String name;

  MenuItem({required this.name});

  factory MenuItem.fromJson(Map<String, dynamic> json) {
    return MenuItem(name: json['name']);
  }
}

List<Restaurant> parseRestaurant(String? json) {
  final List<Restaurant> restaurants = [];

  if (json == null) {
    return restaurants;
  }

  final jsonData = jsonDecode(json);
  final restaurantsData = jsonData['restaurants'] as List;

  for (final restaurantData in restaurantsData) {
    final restaurant = Restaurant.fromJson(restaurantData);
    restaurants.add(restaurant);
  }

  return restaurants;
}
