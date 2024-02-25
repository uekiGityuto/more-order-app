import 'package:flutter/material.dart';

class ListTileOption {
  final String title;
  final Widget nextPage;

  ListTileOption({required this.title, required this.nextPage});
}

class ListTileNavigation extends StatelessWidget {
  final ListTileOption option;
  const ListTileNavigation({Key? key, required this.option}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(option.title),
      trailing: const Icon(Icons.arrow_forward),
      contentPadding: EdgeInsets.zero,
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => option.nextPage),
      ),
    );
  }
}
