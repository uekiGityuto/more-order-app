import 'package:flutter/material.dart';

class PageModelChild extends StatelessWidget {
  final String title;
  final String imageAssetPath;
  final String body;

  const PageModelChild({
    Key? key,
    required this.title,
    required this.imageAssetPath,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16.0),
      color: Theme.of(context).colorScheme.onPrimary,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: screenSize.width,
            height: screenSize.height * 0.3,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Image.asset(
                imageAssetPath,
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            title,
            style: TextStyle(
              fontSize: 24 * MediaQuery.of(context).textScaleFactor,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            body,
            style: const TextStyle(color: Colors.black),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
