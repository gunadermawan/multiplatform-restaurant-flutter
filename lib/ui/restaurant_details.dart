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
                tag: restaurant.urlToImage,
                child: Image.network(restaurant.urlToImage)),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    restaurant.description,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const Divider(
                    color: Colors.grey,
                  ),
                  Text(
                    'Date: ${restaurant.publishedAt}',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Text(
                    'author: ${restaurant.author}',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Text(
                    restaurant.content,
                    style: Theme.of(context).textTheme.titleSmall,
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
