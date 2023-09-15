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
                tag: restaurant.urlImage,
                child: Image.network(restaurant.urlImage)),
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
                    'Date: ${restaurant.publishDate}',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const Divider(
                    color: Colors.grey,
                  ),
                  Text(
                    'author: ${restaurant.author}',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const Divider(
                    color: Colors.grey,
                  ),
                  Text(
                    restaurant.content,
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
