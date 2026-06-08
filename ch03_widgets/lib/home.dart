import 'package:flutter/material.dart';
import 'package:yummy/components/category_card.dart';
import 'package:yummy/components/post_card.dart';
import 'package:yummy/components/restaurant_card.dart';
import 'package:yummy/models/models.dart';
import '../components/color_button.dart';
import '../components/theme_button.dart';
import '../constants.dart';

class Home extends StatefulWidget {
  const Home(
      {super.key,
      required this.colorSelected,
      required this.changeColor,
      required this.changeTheme});

  final ColorSelection colorSelected;
  final void Function(int value) changeColor;
  final void Function(bool useLightMode) changeTheme;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int tab = 0;
  List<NavigationDestination> appBarDestinations = const [
    NavigationDestination(
      icon: Icon(Icons.credit_card),
      label: "Category",
      selectedIcon: Icon(Icons.credit_card),
    ),
    NavigationDestination(
      icon: Icon(Icons.credit_card),
      label: "Post",
      selectedIcon: Icon(Icons.credit_card),
    ),
    NavigationDestination(
      icon: Icon(Icons.credit_card),
      label: "Restaurant",
      selectedIcon: Icon(Icons.credit_card),
    ),
  ];

  final pages = [
    Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 300),
        child: CategoryCard(category: categories[0]),
      ),
    ),
    Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: PostCard(post: posts[0]),
      ),
    ),
    Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 400),
        child: RestaurantCard(restaurant: restaurants[0]),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          ThemeButton(changeTheme: widget.changeTheme),
          ColorButton(
              colorSelected: widget.colorSelected,
              changeColor: widget.changeColor),
        ],
        elevation: 4.0,
      ),
      body: IndexedStack(
        index: tab,
        children: pages,
      ),
      bottomNavigationBar: NavigationBar(
        destinations: appBarDestinations,
        selectedIndex: tab,
        onDestinationSelected: (index) {
          setState(() {
            tab = index;
          });
        },
      ),
    );
  }
}
