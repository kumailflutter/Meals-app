import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:animation/providers/filter_provider.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key, required Map<filter, bool> currentfilters});

  @override
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activefilters = ref.watch(filtersprovider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
      ),
      body: Column(
        children: [
          SwitchListTile(
            value: activefilters[filter.glutenfree]!,
            onChanged: (isChecked) {
              ref
                  .read(filtersprovider.notifier)
                  .setfilter(filter.glutenfree, isChecked);
            },
            title: Text(
              'Gluten free',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              'only include gluen',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: activefilters[filter.lactosefree]!,
            onChanged: (isChecked) {
              ref
                  .read(filtersprovider.notifier)
                  .setfilter(filter.lactosefree, isChecked);
            },
            title: Text(
              'Lactose free',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              'only include gluen',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: activefilters[filter.veganfree]!,
            onChanged: (isChecked) {
              ref
                  .read(filtersprovider.notifier)
                  .setfilter(filter.veganfree, isChecked);
            },
            title: Text(
              'Vegetarian free', // Corrected text
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              'only include vegetarian', // Corrected text
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: activefilters[filter.vegetarianfree]!,
            onChanged: (isChecked) {
              ref
                  .read(filtersprovider.notifier)
                  .setfilter(filter.vegetarianfree, isChecked);
            },
            title: Text(
              'Vegan free',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              'only include gluen',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: EdgeInsets.only(left: 34, right: 22),
          )
        ],
      ),
    );
  }
}
