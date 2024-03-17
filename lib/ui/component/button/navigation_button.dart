import 'package:flutter/material.dart';

class NavigationButton extends StatelessWidget {
  final Widget nextPage;
  final String text;
  final bool isSecondary;
  final bool disabled;

  const NavigationButton({
    Key? key,
    required this.nextPage,
    required this.text,
    this.isSecondary = false,
    this.disabled = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void navigate() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => nextPage),
      );
    }

    Widget label = Text(text);
    Widget icon = const Icon(Icons.chevron_left);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: isSecondary
          ? OutlinedButton.icon(
              onPressed: disabled ? null : navigate,
              label: label,
              icon: icon,
            )
          : ElevatedButton.icon(
              onPressed: disabled ? null : navigate,
              label: label,
              icon: icon,
            ),
    );
  }
}
