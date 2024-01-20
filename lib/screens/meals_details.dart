import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:animation/models/meal.dart';
import 'package:animation/providers/favoruite_provider.dart';

class MealDetailScreen extends ConsumerWidget {
  const MealDetailScreen({super.key, required this.meal});
  final Meal meal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favouriteMeals = ref.watch(favouriteMealsProvider);
    final isfavourite = favouriteMeals.contains(meal);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                final wasAdded = ref
                    .read(favouriteMealsProvider.notifier)
                    .toggleMealFavouriteStatus(meal);
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content:
                        Text(wasAdded ? 'Meal added as faourite' : 'Meal re')));
              },
              icon: Icon(isfavourite ? Icons.star : Icons.star_border))
        ],
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              meal.imageUrl,
              height: 300,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            SizedBox(
              height: 14,
            ),
            Text(
              "Ingreddients",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.primary),
            ),
            SizedBox(
              height: 14,
            ),
            for (final ingredient in meal.ingredients)
              Text(
                ingredient,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
            SizedBox(
              height: 24,
            ),
            Text(
              "Steps",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.primary),
            ),
            SizedBox(
              height: 14,
            ),
            for (final steps in meal.steps)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text(
                  steps,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
