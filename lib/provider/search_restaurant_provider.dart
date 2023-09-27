import 'package:flutter/cupertino.dart';
import 'package:restaurant/data/api/api_service.dart';
import 'package:restaurant/data/enum/result_state.dart';

import '../data/model/search_restaurant_model.dart';

class SearchRestaurantProvider extends ChangeNotifier {
  final ApiService apiService;

  SearchRestaurantProvider({required this.apiService});

  late SearchRestaurantModel _searchRestaurantResult;
  ResultState? _resultState;
  String _message = '';

  String get message => _message;

  SearchRestaurantModel get result => _searchRestaurantResult;

  ResultState? get state => _resultState;

  Future<dynamic> fetchSearchRestaurant(String query) async {
    try {
      _resultState = ResultState.loading;
      notifyListeners();
      final searchRestaurant = await apiService.getSearchRestaurant(query);
      if (searchRestaurant.founded == 0 &&
          searchRestaurant.restaurants.isEmpty) {
        _resultState = ResultState.noData;
        notifyListeners();
        return _message = 'Query not found';
      } else {
        _resultState = ResultState.hasData;
        notifyListeners();
        return _searchRestaurantResult = searchRestaurant;
      }
    } catch (e) {
      _resultState = ResultState.error;
      return _message = 'Error get data -> $e';
    }
  }
}
