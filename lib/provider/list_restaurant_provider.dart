import 'package:flutter/cupertino.dart';
import 'package:restaurant/data/api/api_service.dart';
import 'package:restaurant/data/enum/result_state.dart';
import 'package:restaurant/data/model/list_restaurant_model.dart';

class ListRestaurantProvider extends ChangeNotifier {
  final ApiService apiService;

  ListRestaurantProvider({required this.apiService}) {
    fetchRestaurant();
  }

  late ListRestaurantModel _listRestaurantModel;
  late ResultState _resultState;
  String _message = '';

  ListRestaurantModel get result => _listRestaurantModel;

  ResultState get state => _resultState;

  String get message => _message;

  Future<dynamic> fetchRestaurant() async {
    try {
      _resultState = ResultState.loading;
      notifyListeners();
      final listRestaurant = await apiService.getListRestaurant();
      if (listRestaurant.count == 0 && listRestaurant.restaurants.isEmpty) {
        _resultState = ResultState.noData;
        notifyListeners();
        return _message = 'get Empty Data';
      } else {
        _resultState = ResultState.hasData;
        notifyListeners();
        return _listRestaurantModel = listRestaurant;
      }
    } catch (e) {
      _resultState = ResultState.error;
      notifyListeners();
      return _message = 'Error get data';
    }
  }
}
