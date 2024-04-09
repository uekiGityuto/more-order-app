import 'package:flutter/material.dart';

class Phrases extends StatelessWidget {
  final Map<String, int> phrasesWithQuantity;

  const Phrases({Key? key, required this.phrasesWithQuantity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: phrasesWithQuantity.entries.map((entry) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                // アイコンとテキストがずれるので調整
                padding: EdgeInsets.only(
                    top: 6.0 * MediaQuery.of(context).textScaleFactor),
                child: Icon(Icons.fiber_manual_record,
                    size: 16 * MediaQuery.of(context).textScaleFactor),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  entry.value == 1
                      ? entry.key
                      : '${entry.key}  ×${entry.value}',
                  style: TextStyle(
                    fontSize: 24 * MediaQuery.of(context).textScaleFactor,
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
