import 'package:flutter/material.dart';
import 'package:animation/models/meal.dart';
import 'package:animation/screens/meals_details.dart';
import 'package:animation/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({Key? key, this.title,

   required this.meals})
      : super(key: key);

  final String? title;
  final List<Meal> meals;

  void selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (ctx) => MealDetailScreen(
        meal: meal,
       
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    Widget content;

    if (meals.isNotEmpty) {
      content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, index) => MealItem(
          meal: meals[index],
          onSelectMeal: (meal) {
            selectMeal(context, meal);
          },
        ),
      );
    } else {
      content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Oops, Nothing to show',
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              'Try selecting a different category',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: title != null ? Text(title!) : null,
      ),
      body: content,
    );
  }
}
