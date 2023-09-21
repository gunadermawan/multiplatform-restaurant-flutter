import 'package:flutter/material.dart';
import 'package:restaurant/data/model/restaurant.dart';

class RestaurantDetails extends StatelessWidget {
  static const routeName = '/restaurant_details';
  final Restaurant restaurant;

  const RestaurantDetails({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('news apps'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
                tag: restaurant.pictureId,
                child: Image.network(restaurant.pictureId)),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    restaurant.description,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const Divider(
                    color: Colors.grey,
                  ),
                  Text(
                    'Date: ${restaurant.menus}',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const Divider(
                    color: Colors.grey,
                  ),
                  Text(
                    'author: ${restaurant.city}',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const Divider(
                    color: Colors.grey,
                  ),
                  Text(
                    restaurant.description,
                    style: Theme.of(context).textTheme.bodyMedium,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
