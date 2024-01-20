import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:animation/providers/meals_provider.dart';

enum filter {
  lactosefree,
  veganfree,
  vegetarianfree,
  glutenfree,
}

class FiltersNotifier extends StateNotifier<Map<filter, bool>> {
  FiltersNotifier()
      : super({
          filter.glutenfree: false,
          filter.lactosefree: false,
          filter.veganfree: false,
          filter.vegetarianfree: false,
        });
  void setfilters(Map<filter, bool> chosenfilters) {
    state = chosenfilters;
  }

  void setfilter(filter filter, bool isActive) {
    state = {...state, filter: isActive};
  }
}

final filtersprovider =
    StateNotifierProvider<FiltersNotifier, Map<filter, bool>>(
        (ref) => FiltersNotifier());

final filteredMealsProvider = Provider((ref) {
  final meals = ref.watch(mealsProvider);
  final activefilters = ref.watch(filtersprovider);
  return meals.where((meal) {
    if (activefilters != null &&
        activefilters[filter.glutenfree]! &&
        !meal.isGlutenFree) {
      return false;
    }
    if (activefilters != null &&
        activefilters[filter.lactosefree]! &&
        !meal.isLactoseFree) {
      return false;
    }
    if (activefilters != null &&
        activefilters[filter.veganfree]! &&
        !meal.isVegan) {
      return false;
    }
    if (activefilters != null &&
        activefilters[filter.vegetarianfree]! &&
        !meal.isVegetarian) {
      return false;
    }
    return true;
  }).toList();
});
