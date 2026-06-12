import 'package:flutter/material.dart';
import 'package:yummy/api/mock_yummy_service.dart';
import 'package:yummy/components/categories_section.dart';
import 'package:yummy/components/post_section.dart';
import 'package:yummy/components/restaurant_section.dart';

class ExplorePage extends StatelessWidget {
  final mockService = MockYummyService();
  ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: mockService.getExploreData(),
        builder: (context, AsyncSnapshot<ExploreData> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final restaurants = snapshot.data?.restaurants ?? [];
            final categories = snapshot.data?.categories ?? [];
            final posts = snapshot.data?.friendPosts ?? [];
            return ListView(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: [
                RestaurantSection(restaurants: restaurants),
                CategoriesSection(categories: categories),
                PostSection(posts: posts),
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
