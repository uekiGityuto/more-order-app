import 'package:flutter/material.dart';
import 'package:smart_order_app/domain/entity/phrase.dart';

class Phrases extends StatelessWidget {
  final List<Phrase> phrases;
  const Phrases({Key? key, required this.phrases}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: phrases
          .map(
            (phrase) => ListTile(
              leading: const Icon(Icons.fiber_manual_record),
              title: Text(
                phrase.phrase,
                style: TextStyle(
                  fontSize: 24 * MediaQuery.of(context).textScaleFactor,
                ),
              ),
              contentPadding: EdgeInsets.zero,
            ),
          )
          .toList(),
    );
  }
}
