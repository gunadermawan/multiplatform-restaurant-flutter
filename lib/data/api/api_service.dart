import 'dart:convert';
import 'package:restaurant/data/api/api_config.dart';
import 'package:restaurant/data/model/review_restaurant.dart';
import 'package:restaurant/data/model/search_restaurant_model.dart';
import '../model/detail_restaurant_model.dart';
import '../model/list_restaurant_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<ListRestaurantModel> getListRestaurant() async {
    final response = await http.get(Uri.parse('${ApiConfig.baseUrl}/list'));
    if (response.statusCode == 200) {
      return ListRestaurantModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('error get data');
    }
  }

  Future<DetailRestaurantModel> getDetailRestaurant(String id) async {
    final response =
        await http.get(Uri.parse('${ApiConfig.baseUrl}/detail/$id'));
    if (response.statusCode == 200) {
      return DetailRestaurantModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('error get data');
    }
  }

  Future<SearchRestaurantModel> getSearchRestaurant(String query) async {
    final response =
        await http.get(Uri.parse('${ApiConfig.baseUrl}/search?q=$query'));
    if (response.statusCode == 200) {
      return SearchRestaurantModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('error get data');
    }
  }

  Future<ReviewRestaurantModel> getReviewRestaurant({
    required String id,
    required String name,
    required String review,
  }) async {
    final response = await http.post(Uri.parse('${ApiConfig.baseUrl}/review'),
        body: jsonEncode(<String, String>{
          'id': id,
          'name': name,
          'review': review,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json',
        });
    if (response.statusCode == 201) {
      return ReviewRestaurantModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('error send data');
    }
  }
}
