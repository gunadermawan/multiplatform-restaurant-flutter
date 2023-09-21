import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant/data/model/restaurant.dart';
import 'package:restaurant/ui/restaurant_details.dart';
import 'package:restaurant/widget/platform_widget.dart';
import 'package:transparent_image/transparent_image.dart';

class RestaurantListPage extends StatelessWidget {
  const RestaurantListPage({super.key});

  Widget _buildList(BuildContext context) {
    return FutureBuilder<String>(
        future:
            DefaultAssetBundle.of(context).loadString('assets/restaurant.json'),
        builder: (context, snapshot) {
          final List<Restaurant> restaurant = parseRestaurant(snapshot.data);
          return ListView.builder(
            itemBuilder: (context, index) {
              return _buildRestaurantItem(context, restaurant[index]);
            },
            itemCount: restaurant.length,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(androidBuilder: _buildAndroid, iosBuilder: _buildIos);
  }

  Widget _buildRestaurantItem(BuildContext context, Restaurant restaurant) {
    return Material(
      color: Colors.white,
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        leading: Hero(
          tag: restaurant.pictureId,
          child: FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            image: restaurant.pictureId,
            width: 100,
          ),
        ),
        title: Text(restaurant.name),
        subtitle: Row(
          children: <Widget>[
            const Icon(
              Icons.star,
              color: Colors.yellow,
              size: 18.0,
            ),
            Text(restaurant.rating.toStringAsFixed(1)),
            const SizedBox(
              width: 10,
            ),
            const Icon(
              Icons.pin_drop,
              color: Colors.grey,
              size: 18.0,
            ),
            Text(restaurant.city),
          ],
        ),
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
