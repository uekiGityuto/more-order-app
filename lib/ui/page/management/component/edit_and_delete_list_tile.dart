import 'package:flutter/material.dart';

class EditAndDeleteListTile extends StatelessWidget {
  final String title;
  final Widget editPage;
  final Future<void> Function() onDeletePressed;
  const EditAndDeleteListTile(
      {Key? key,
      required this.title,
      required this.editPage,
      required this.onDeletePressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => editPage,
                  ),
                ),
              },
            ),
          ),
          Flexible(
            child: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: onDeletePressed,
            ),
          ),
        ],
      ),
      contentPadding: EdgeInsets.zero,
      dense: true,
    );
  }
}
