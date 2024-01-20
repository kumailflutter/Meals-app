import 'package:flutter/material.dart';
import 'package:animation/data/dumy_data.dart';
import 'package:animation/models/category.dart';
import 'package:animation/models/meal.dart';
import 'package:animation/screens/meals.dart';
import 'package:animation/widgets/category_grid_item.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({
    super.key,
    required this.availableMeals,
  });

  final List<Meal> availableMeals;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationcontroller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationcontroller = AnimationController(
        vsync: this,
        duration: const Duration(microseconds: 300),
        lowerBound: 0,
        upperBound: 1);
    _animationcontroller.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationcontroller.dispose();
  }

  void _selectedCategory(BuildContext context, Category category) {
    final filteredMeals = widget.availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) =>
            MealsScreen(title: category.title, meals: filteredMeals)));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animationcontroller,
        child: GridView(
          padding: EdgeInsets.all(24),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              childAspectRatio: 1.5),
          children: [
            for (final category in availableCategories)
              CategoruGridItem(
                onSelectCategory: () {
                  _selectedCategory(context, category);
                },
                category: category,
              )
          ],
        ),
        builder: (context, child) => SlideTransition(
              position: Tween(begin: Offset(0, 0.3), end: Offset(0, 0)).animate(
                  CurvedAnimation(
                      parent: _animationcontroller, curve: Curves.easeInOut)),
              child: child,
            ));
  }
}
