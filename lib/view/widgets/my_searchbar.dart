import 'package:flutter/material.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';


class MySearchBar extends StatelessWidget {
  const MySearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, right: 20, left: 20),
      child: SizedBox(
        height: 100,
        child: FloatingSearchBar(
          hint: 'Search...',
          autocorrect: true,
          borderRadius: BorderRadius.circular(40),
          scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
          openAxisAlignment: 0.0,
          debounceDelay: const Duration(milliseconds: 500),
          onQueryChanged: (query) {},
          actions: [
            FloatingSearchBarAction(
              showIfOpened: false,
              child: CircularButton(
                icon: const Icon(Icons.search),
                onPressed: () {},
              ),
            ),
            FloatingSearchBarAction.searchToClear(
              showIfClosed: false,
            ),
          ],
          builder: (context, transition) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(100, (i) => i).map((i) {
                return Text('Item $i');
              }).toList(),
            );
          },
        ),
      ),
    );
  }
}
