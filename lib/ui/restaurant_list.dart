import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant/data/model/restaurant.dart';
import 'package:restaurant/ui/restaurant_details.dart';
import 'package:restaurant/widget/platform_widget.dart';

class RestaurantListPage extends StatelessWidget {
  const RestaurantListPage({super.key});

  Widget _buildList(BuildContext buildContext) {
    return FutureBuilder<String>(
        future: DefaultAssetBundle.of(buildContext)
            .loadString('assets/restaurant.json'),
        builder: (context, snapshot) {
          final List<Restaurant> restaurant = parseRestaurant(snapshot.data);
          return ListView.builder(itemBuilder: (context, index) {
            return _buildRestaurantItem(context, restaurant[index]);
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(androidBuilder: _buildAndroid, iosBuilder: _buildIos);
  }

  Widget _buildRestaurantItem(BuildContext context, Restaurant restaurant) {
    return Material(
      color: Colors.blue,
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        leading: Hero(
          tag: restaurant.urlToImage,
          child: Image.network(
            restaurant.urlToImage,
            width: 100,
          ),
        ),
        title: Text(restaurant.title),
        subtitle: Text(restaurant.author),
        onTap: () {
          Navigator.pushNamed(context, RestaurantDetails.routeName,
              arguments: restaurant);
        },
      ),
    );
  }

  Widget _buildAndroid(BuildContext buildContext) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News Apps'),
      ),
      body: _buildList(buildContext),
    );
  }

  Widget _buildIos(BuildContext buildContext) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('News Apps'),
        transitionBetweenRoutes: false,
      ),
      child: _buildList(buildContext),
    );
  }
}
