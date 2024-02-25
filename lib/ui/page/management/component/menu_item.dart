import 'package:flutter/material.dart';
import 'package:smart_order_app/ui/component/list_tile_navigation.dart';

class MenuItem extends StatelessWidget {
  final String title;
  final List<ListTileOption> options;
  const MenuItem({Key? key, required this.title, required this.options})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("◼️$title"),
        Container(
          decoration:
              BoxDecoration(color: Theme.of(context).colorScheme.surface),
          child: Column(
            children: [
              ...options.map((option) => ListTileNavigation(option: option)),
            ],
          ),
        ),
      ],
    );
  }
}