import 'package:flutter/material.dart';
import 'package:restaurant/data/model/restaurant.dart';
import 'package:restaurant/ui/home.dart';
import 'package:restaurant/ui/restaurant_details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News Apps',
      theme: ThemeData(
        colorScheme: Theme.of(context).colorScheme.copyWith(
            primary: Colors.blue,
            onPrimary: Colors.black,
            secondary: Colors.white),
        scaffoldBackgroundColor: Colors.white70,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: const AppBarTheme(elevation: 0),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey,
                foregroundColor: Colors.white,
                textStyle: const TextStyle(),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(0))))),
        primarySwatch: Colors.grey,
      ),
      initialRoute: Home.routeName,
      routes: {
        Home.routeName: (context) => const Home(),
        RestaurantDetails.routeName: (context) => RestaurantDetails(
              restaurant:
                  ModalRoute.of(context)?.settings.arguments as Restaurant,
            )
      },
    );
  }
}
