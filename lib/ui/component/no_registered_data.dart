import 'package:flutter/material.dart';
import 'package:smart_order_app/ui/component/navigation_button.dart';

class NoRegisteredData extends StatelessWidget {
  final String message;
  final NavigationButton? navigationButton;

  const NoRegisteredData({
    Key? key,
    required this.message,
    this.navigationButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [
      Text(message),
      const SizedBox(height: 16),
    ];

    if (navigationButton != null) {
      children.add(navigationButton!);
    }

    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: children,
      ),
    );
  }
}
