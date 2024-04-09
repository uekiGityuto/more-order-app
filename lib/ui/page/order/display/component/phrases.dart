import 'package:flutter/material.dart';

class Phrases extends StatelessWidget {
  final Map<String, int> phrasesWithQuantity;

  const Phrases({Key? key, required this.phrasesWithQuantity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final phraseEntryList = phrasesWithQuantity.entries.toList();

    return ReorderableListView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      onReorder: (int oldIndex, int newIndex) {
        if (oldIndex < newIndex) {
          newIndex -= 1;
        }
        final item = phraseEntryList.removeAt(oldIndex);
        phraseEntryList.insert(newIndex, item);
      },
      children: List.generate(phraseEntryList.length, (index) {
        final entry = phraseEntryList[index];
        return Padding(
          key: ValueKey(entry.key),
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 6.0 * MediaQuery.of(context).textScaleFactor,
                ),
                child: Icon(
                  Icons.drag_handle,
                  size: 20 * MediaQuery.of(context).textScaleFactor,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  entry.value == 1 ? entry.key : '${entry.key} ×${entry.value}',
                  style: TextStyle(
                    fontSize: 24 * MediaQuery.of(context).textScaleFactor,
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
