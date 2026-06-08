import 'package:flutter/material.dart';

import '../models/models.dart';

class RestaurantCard extends StatefulWidget {
  const RestaurantCard({super.key, required this.restaurant});
  final Restaurant restaurant;

  @override
  State<RestaurantCard> createState() => _RestaurantCardState();
}

class _RestaurantCardState extends State<RestaurantCard> {
  bool _isFavorited = false;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context)
        .textTheme
        .apply(displayColor: Theme.of(context).colorScheme.onSurface);
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(10),
            ),
            child: AspectRatio(
              aspectRatio: 2,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    widget.restaurant.imageUrl,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 4,
                    right: 4,
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          _isFavorited = !_isFavorited;
                        });
                      },
                      icon: Icon(
                        _isFavorited ? Icons.favorite : Icons.favorite_outline,
                      ),
                      iconSize: 30,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            title: Text(
              widget.restaurant.name,
              style: textTheme.titleSmall,
            ),
            subtitle: Text(
              widget.restaurant.attributes,
              maxLines: 1,
              style: textTheme.bodySmall,
            ),
            onTap: () {
              print('Tap on  ${widget.restaurant.name}');
            },
          ),
        ],
      ),
    );
  }
}
