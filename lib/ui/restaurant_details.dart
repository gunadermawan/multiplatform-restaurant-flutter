import 'package:flutter/material.dart';
import 'package:restaurant/data/model/restaurant.dart';

class RestaurantDetails extends StatelessWidget {
  static const routeName = '/restaurant_details';
  final Restaurant restaurant;

  const RestaurantDetails({Key? key, required this.restaurant})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(restaurant.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: restaurant.pictureId,
              child: Image.network(restaurant.pictureId),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Ratings',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 18.0,
                          ),
                          Text(
                            restaurant.rating.toStringAsFixed(1),
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'City',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(
                            restaurant.city,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Divider(
                    color: Colors.grey,
                  ),
                  Text(
                    'Description',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    restaurant.description,
                    textAlign: TextAlign.justify,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const Divider(
                    color: Colors.grey,
                  ),
                  Text(
                    'Menu',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              'Makanan',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const Icon(
                              Icons.food_bank_outlined,
                              color: Colors.grey,
                              size: 48,
                            ),
                            Column(
                              children: restaurant.menus.foods.map((food) {
                                return Card(
                                  child: ListTile(
                                      title: Text(
                                    food.name,
                                    textAlign: TextAlign.center,
                                  )),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              'Minuman',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const Icon(
                              Icons.local_drink_outlined,
                              color: Colors.grey,
                              size: 48,
                            ),
                            Column(
                              children: restaurant.menus.drinks.map((drink) {
                                return Card(
                                  child: ListTile(
                                    title: Text(
                                      drink.name,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
