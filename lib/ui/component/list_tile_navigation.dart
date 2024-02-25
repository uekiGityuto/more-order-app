import 'package:flutter/material.dart';

enum NavigationType { push, pushReplacement, pushAndRemoveUntil }

class ListTileOption {
  final String title;
  final Widget nextPage;
  final NavigationType navigateType;

  ListTileOption({
    required this.title,
    required this.nextPage,
    this.navigateType = NavigationType.push,
  });
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
        onTap: () {
          switch (option.navigateType) {
            case NavigationType.push:
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => option.nextPage));
              break;
            case NavigationType.pushReplacement:
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => option.nextPage));
              break;
            case NavigationType.pushAndRemoveUntil:
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => option.nextPage),
                (_) => false,
              );
          }
        });
  }
}
