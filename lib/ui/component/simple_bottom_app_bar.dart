import 'package:flutter/material.dart';
import 'package:smart_order_app/ui/page/management/page.dart';

class SimpleBottomAppBar extends StatelessWidget {
  const SimpleBottomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const ManagementPage()),
            ),
          ),
        ],
      ),
    );
  }
}
