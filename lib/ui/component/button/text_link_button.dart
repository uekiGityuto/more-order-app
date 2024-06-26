import 'package:flutter/material.dart';
import 'package:more_order/ui/style/custom_color.dart';

class TextLinkButton extends StatelessWidget {
  final Widget nextPage;
  final String text;

  const TextLinkButton({
    Key? key,
    required this.nextPage,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => nextPage),
        );
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: TextStyle(
              color: CustomColors.linkBlue,
              fontSize: 14 * MediaQuery.of(context).textScaleFactor,
            ),
          ),
          Icon(
            Icons.arrow_forward,
            size: 14 * MediaQuery.of(context).textScaleFactor,
            color: const Color(0xFF1558D6),
          ),
        ],
      ),
    );
  }
}
