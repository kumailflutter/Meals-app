import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:animation/data/dumy_data.dart';
import 'package:animation/models/meal.dart';
import 'package:animation/providers/favoruite_provider.dart';
import 'package:animation/providers/meals_provider.dart';
import 'package:animation/screens/categories.dart';
import 'package:animation/screens/filters.dart';
import 'package:animation/screens/meals.dart';
import 'package:animation/widgets/main_drawer.dart';
import 'package:animation/providers/filter_provider.dart';

const kinitalfilter = {
  filter.glutenfree: false,
  filter.lactosefree: false,
  filter.veganfree: false,
  filter.vegetarianfree: false,
};

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedpageindex = 0;

  void selectpage(int index) {
    setState(() {
      _selectedpageindex = index;
    });
  }

  void _setscreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'Meals') {
      Navigator.of(context).pop();
    } else if (identifier == 'Filters') {
      final result = await Navigator.of(context).push<Map<filter, bool>>(
        MaterialPageRoute(
          builder: (ctx) => FiltersScreen(currentfilters: kinitalfilter),
        ),
      );
      // Handle the result if needed
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = ref.watch(filteredMealsProvider);
    Widget activepage = CategoriesScreen(
      availableMeals: availableMeals,
    );
    var activepagetitle = 'Categories';
    if (_selectedpageindex == 1) {
      final favouriteMeals = ref.watch(favouriteMealsProvider);
      activepage = MealsScreen(
        meals: favouriteMeals,
      );
      activepagetitle = 'Your Favourites';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activepagetitle),
      ),
      drawer: MainDrawer(
        onselectscreen: _setscreen,
      ),
      body: activepage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectpage,
        currentIndex: _selectedpageindex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favourites',
          ),
        ],
      ),
    );
  }
}
