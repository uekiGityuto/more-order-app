import 'package:flutter/material.dart';

class EditAndDeleteListTile extends StatelessWidget {
  final String title;
  final Widget editPage;
  final bool disabled;
  final Future<void> Function() onDeletePressed;
  const EditAndDeleteListTile({
    Key? key,
    required this.title,
    this.disabled = false,
    required this.editPage,
    required this.onDeletePressed,
  }) : super(key: key);

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
              onPressed: disabled
                  ? null
                  : () => {
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
              onPressed: disabled ? null : onDeletePressed,
            ),
          ),
        ],
      ),
      contentPadding: EdgeInsets.zero,
      dense: true,
    );
  }
}
