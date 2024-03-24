import 'package:flutter/material.dart';
import 'package:more_order/domain/entity/phrase.dart';

class Phrases extends StatelessWidget {
  final List<Phrase> phrases;

  const Phrases({Key? key, required this.phrases}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: phrases.map((phrase) {
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
                  phrase.phrase,
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
